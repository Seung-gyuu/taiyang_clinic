DROP SCHEMA IF EXISTS `clinicdb`;
CREATE SCHEMA IF NOT EXISTS `clinicdb` DEFAULT CHARACTER SET latin1;
USE `clinicdb`;

CREATE TABLE IF NOT EXISTS `clinicdb`.`role` (
  `role_id` INT(11) NOT NULL,
  `role_name` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`role_id`));

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
    `role_id` INT DEFAULT 1,
    CONSTRAINT `fk_user_role`
        FOREIGN KEY (`role_id`) REFERENCES `clinicdb`.`role` (`role_id`),
    isactive INT DEFAULT 1,
    CHECK (isactive IN (1, 2))
);

-- consent and medical form

CREATE TABLE  IF NOT EXISTS `clinicdb`.`day` (
    `fulldate` DATE NOT NULL,
    PRIMARY KEY (`fulldate`),
    `year` INT NOT NULL,
    `dayname` VARCHAR(10) NOT NULL,
    CHECK (`dayname` IN ('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday')),
    `daynumber` INT NOT NULL,
    CHECK (`daynumber` > 0 AND `daynumber` <= 31),
    `monthName` VARCHAR(10) NOT NULL,
    CHECK (`monthname` IN ('January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'))
);

CREATE TABLE IF NOT EXISTS `clinicdb`.`availabletime` (
    `timeid` INT AUTO_INCREMENT,
    PRIMARY KEY (`timeid`),
    `fulldate` DATE NOT NULL,
    CONSTRAINT `fk_time_day`
        FOREIGN KEY (`fulldate`) REFERENCES `clinicdb`.`day` (`fulldate`),
    `start_time` TIME NOT NULL,
    CHECK (`start_time` >= '08:00:00' AND `start_time` < '17:00:00'),
    `end_time` TIME NOT NULL,
    CHECK (`end_time` >= '09:00:00' AND `end_time` < '18:00:00')
);

CREATE TABLE IF NOT EXISTS `clinicdb`.`service` (
    `serviceid` INT,
    PRIMARY KEY (`serviceid`),
    `serviceName` VARCHAR(30) NOT NULL
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
    `isupcoming` INT DEFAULT 1,
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
    `sendTime` DATE NOT NULL
);


CREATE TABLE  IF NOT EXISTS  `clinicdb`.`sentReminders` (
    `reminderid` INTEGER NOT NULL,
    PRIMARY KEY (`reminderid`),
    CONSTRAINT fk_sent_reminder FOREIGN KEY (`reminderid`) REFERENCES `clinicdb`.`reminder` (`reminderid`)
);



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
END//
DELIMITER ;



