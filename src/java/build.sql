DROP SCHEMA IF EXISTS `clinicdb`;
CREATE SCHEMA IF NOT EXISTS `clinicdb` DEFAULT CHARACTER SET latin1;
USE `clinicdb`;

CREATE TABLE IF NOT EXISTS `clinicdb`.`role` (
  `roleid` INT(11) NOT NULL,
  `role_name` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`roleid`));

CREATE TABLE IF NOT EXISTS `clinicdb`.`user` (
    `userid` INT not null AUTO_INCREMENT,
    PRIMARY KEY (`userid`),
    `firstname` VARCHAR(25) NOT NULL,
    `lastname` VARCHAR(25) NOT NULL,
    `email_address` VARCHAR(50) UNIQUE NOT NULL,
    CHECK (`email_address` REGEXP '[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}'),
    `phone_number` CHAR(12) UNIQUE NOT NULL,
    CHECK (`phone_number` REGEXP '[0-9]{3}'),
    `password` VARCHAR(25) NOT NULL,
    `salt` VARCHAR(70),
    `roleid` INT DEFAULT 1,
    CONSTRAINT `fk_user_role`
        FOREIGN KEY (`roleid`) REFERENCES `clinicdb`.`role` (`roleid`),
    isactive INT DEFAULT 1,
    CHECK (isactive IN (1, 2))
);

CREATE TABLE IF NOT EXISTS `clinicdb`.`passwordtokens` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `userid` INT NOT NULL,
  `token` VARCHAR(50) Unique NOT NULL,
  `expiryDateTime` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_passwordtokens_user`
    FOREIGN KEY (`userid`) REFERENCES `clinicdb`.`user` (`userid`)
);


CREATE TABLE IF NOT EXISTS `clinicdb`.`medicalform` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `userid` INT NOT NULL,
  `pdfFile` LONGBLOB NOT NULL,
  `timeAdded` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_medical_form_user`
    FOREIGN KEY (`userid`) REFERENCES `clinicdb`.`user` (`userid`)
);

CREATE TABLE IF NOT EXISTS `clinicdb`.`consentform` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `userid` INT NOT NULL,
  `pdfFile` LONGBLOB NOT NULL,
  `timeAdded` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_consent_form_user`
    FOREIGN KEY (`userid`) REFERENCES `clinicdb`.`user` (`userid`)
);



CREATE TABLE  IF NOT EXISTS `clinicdb`.`day` (
    `fulldate` DATE NOT NULL,
    PRIMARY KEY (`fulldate`),
    `year` INT NOT NULL,
    `dayname` VARCHAR(10) NOT NULL,
    CHECK (`dayname` IN ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday')),
    `daynumber` INT NOT NULL,
    CHECK (`daynumber` > 0 AND `daynumber` <= 31),
    `month_Name` VARCHAR(10) NOT NULL,
    CHECK (`month_Name` IN ('January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'))
);

CREATE TABLE IF NOT EXISTS `clinicdb`.`availabletime` (
    `timeid` INT AUTO_INCREMENT,
    PRIMARY KEY (`timeid`),
    `fulldate` DATE NOT NULL,
    CONSTRAINT `fk_time_day`
        FOREIGN KEY (`fulldate`) REFERENCES `clinicdb`.`day` (`fulldate`),
    `start_time` TIME NOT NULL,
    CHECK (`start_time` >= '09:00:00' AND `start_time` <= '16:00:00'),
    `end_time` TIME NOT NULL,
    CHECK (`end_time` >= '10:00:00' AND `end_time` <= '17:00:00'),
    `isBooked` INT DEFAULT 1,  --default is 1,  1 means it is not booked. 2 means it is booked
    CHECK (`isBooked` IN (1, 2))
);


CREATE TABLE IF NOT EXISTS `clinicdb`.`service` (
    `serviceid` INT,
    PRIMARY KEY (`serviceid`),
    `serviceName` VARCHAR(30) NOT NULL,
    `serviceDescription` VARCHAR(250) NOT NULL
);

CREATE TABLE IF NOT EXISTS  `clinicdb`.`appointment` (
    `appointmentid` INT AUTO_INCREMENT,
    PRIMARY KEY (`appointmentid`),
    `userid` INT NOT NULL,
    CONSTRAINT `fk_appointment_user` 
        FOREIGN KEY (`userid`) REFERENCES `clinicdb`.`user` (`userid`),
    `timeid` INT,
    CONSTRAINT `fk_appointment_time`
        FOREIGN KEY (`timeid`) REFERENCES `clinicdb`.`availabletime` (`timeid`),
    `serviceid` INT NOT NULL,
    CONSTRAINT `fk_appointment_service` 
        FOREIGN KEY (`serviceid`) REFERENCES `clinicdb`.`service` (`serviceid`),
    `description` VARCHAR(250),
    `isupcoming` INT DEFAULT 1, --isupcoming defaults to 1.  1 means it is upcoming.  2 means it has passed.
    CONSTRAINT `ck_appt_upcoming` CHECK (`isupcoming` IN (1, 2)),
    `typereminder` INT NOT NULL,
        CONSTRAINT ck_appt_reminder_type CHECK (`typereminder` IN (1, 2, 3))
);

CREATE INDEX idx_appointment_typereminder ON `clinicdb`.`appointment` (`typereminder`);


CREATE TABLE IF NOT EXISTS  `clinicdb`.`reminder` (
    `reminderid` INT AUTO_INCREMENT,
    PRIMARY KEY (`reminderid`),
    `userid` INT NOT NULL,
    CONSTRAINT `fk_reminder_user` 
        FOREIGN KEY (`userid`) REFERENCES `clinicdb`.`user` (`userid`),
    `appointmentid` INT NOT NULL,
    CONSTRAINT fk_reminder_appt 
        FOREIGN KEY (`appointmentid`) REFERENCES `clinicdb`.`appointment` (`appointmentid`),
    `typereminder` INT NOT NULL,
    CONSTRAINT ck_reminder_type CHECK (`typereminder` IN (1, 2, 3)),
    CONSTRAINT fk_reminder_type
        FOREIGN KEY (typereminder) REFERENCES clinicdb.appointment (typereminder),
    `sendTime` DATE NOT NULL --sendtime is 24 hours before the appointment.  Trigger below automatically adds a reminder
);

--sent reminders is the same table so that we can retain all the information, without it clogging the reminder table
CREATE TABLE  IF NOT EXISTS  `clinicdb`.`sentReminders` (
    `sentreminderid` INT AUTO_INCREMENT,
    PRIMARY KEY (`sentreminderid`),
    `userid` INT NOT NULL,
    CONSTRAINT `fk_sentreminder_user` 
        FOREIGN KEY (`userid`) REFERENCES `clinicdb`.`user` (`userid`),
    `appointmentid` INT NOT NULL,
    CONSTRAINT fk_sentreminder_appt 
        FOREIGN KEY (`appointmentid`) REFERENCES `clinicdb`.`appointment` (`appointmentid`),
    `typereminder` INT NOT NULL,
    CONSTRAINT ck_sentreminder_type CHECK (`typereminder` IN (1, 2, 3)),
    CONSTRAINT fk_sentreminder_type
        FOREIGN KEY (typereminder) REFERENCES clinicdb.appointment (typereminder),
    `sentTime` DATE NOT NULL 
);

--after deleting from the reminder table, insert it into the sent reminders table!
--this doesnt work because if they delete an appointment, it will delete a reminder and put it into sent reminders.  Instead
--it needs to remove from reminder table and insert into sent reminder table on its own
-- DELIMITER //
-- CREATE TRIGGER reminder_delete_trigger
-- AFTER DELETE ON `clinicdb`.`reminder`
-- FOR EACH ROW
-- BEGIN
--     -- Insert into the sentReminders table
--     INSERT INTO `clinicdb`.`sentReminders` (reminderid, userid, appointmentid, typereminder, sentTime)
--     VALUES (OLD.reminderid, OLD.userid, OLD.appointmentid, OLD.typereminder, NOW());
-- END//
-- DELIMITER ;




-- TRIGGER TO AUTOMATICALLY ADD REMINDERS AFTER AN APPOINTMENT IS MADE
DELIMITER //
CREATE TRIGGER appointment_insert_trigger
AFTER INSERT ON `clinicdb`.`appointment`
FOR EACH ROW
BEGIN
    -- Retrieve appointment time and date from the availabletime table
    SET @appointment_time = (SELECT start_time FROM `clinicdb`.`availabletime` WHERE timeid = NEW.timeid);
    SET @appointment_date = (SELECT fulldate FROM `clinicdb`.`availabletime` WHERE timeid = NEW.timeid);
    
    -- Calculate sendTime as 1 day before the appointment start time
    SET @send_time = DATE_SUB(CONCAT(@appointment_date, ' ', @appointment_time), INTERVAL 1 DAY);
    
    -- Insert into the reminder table
    INSERT INTO `clinicdb`.`reminder` (userid, appointmentid, typereminder, sendTime)
    VALUES (NEW.userid, NEW.appointmentid, NEW.typereminder, @send_time);

-- Update the `isBooked` column in the `availabletime` table for the booked appointment time
    UPDATE `clinicdb`.`availabletime`
    SET `isBooked` = 2
    WHERE `timeid` = NEW.timeid;
END//
DELIMITER ;

DELIMITER //


-- TRIGGER TO REMOVE REMINDER AND SET AVAILABLE TIME WHEN AN APPOINTMENT IS DELETED
DELIMITER //

CREATE TRIGGER appointment_delete_trigger
BEFORE DELETE ON `clinicdb`.`appointment`
FOR EACH ROW
BEGIN
    -- Delete the corresponding reminder from the `reminder` table
    DELETE FROM `clinicdb`.`reminder`
    WHERE `appointmentid` = OLD.appointmentid;
    
    -- Update the `isBooked` column in the `availabletime` table for the deleted appointment time
    UPDATE `clinicdb`.`availabletime`
    SET `isBooked` = 1
    WHERE `timeid` = OLD.timeid;
END//
DELIMITER ;

