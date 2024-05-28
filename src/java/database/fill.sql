delete from sentreminders;
delete from reminder;
delete from appointment;
delete from availabletime;
delete from day;
delete from medicalform;
delete from consentform;
delete from user;
delete from passwordtokens;
delete from validatetokens;
delete from role;
delete from service;



insert into role values(1,'default user');
insert into role values(2, 'system admin');

insert into user (firstname, lastname, email_address, phone_number, password, salt, isvalid, roleid, isactive) values('sunny', 'gym', 'lisalisa@gmail.com', '4031234560', '9643f56bfa8f4b5ecaba6080b99f3c6aad7b00f31421b4d87a50063184bda852', 'ib1LqMfjfBUB5W2GGAGg/R9kk/KgRfRKKe0Fzh8pjxA=', '1', '2', '1');
insert into user (firstname, lastname, email_address, phone_number, password, roleid, isactive) values('Bob','Banana','bob123@gmail.com','4031112345','password',1,1);
-- password = password1

INSERT INTO user (firstname, lastname, email_address, phone_number, password, salt, isvalid,  roleid, isactive) values('gyu', 'park', 'new@gmail.com', '1234565644', '97a27ffe14eaeb0682e8b7a99f97f1ee34121a2220249cb35533d7d338173ac6', '/k5rGkAHAIyCNghCCfU3akK9j6wvoboqpF8XEIsGhKw=', '1', '1', '1');


-- insert into medicalform(userid,pdfFile,timeAdded) VALUES(1,'res%2Fmedical.pdf',NOW());
-- insert into consentform(userid,pdfFile,timeAdded) VALUES(1,'res%2Fconsent.pdf',NOW()); 


insert into service values(1, 1,'Acupuncture Treatment ', 'Acupuncture involves inserting very thin needles into the body at different locations and depths. It aims to balance the life forces known as Qi that are responsible for different health issues. Acupuncture can help relieve pain and treat a range of other complaints.');
insert into service values(2, 1,'Moxibustion ', 'Moxibustion is a form of therapy that entails the burning of mugwort leaves. This is a small, spongy herb that is believed to enhance healing with acupuncture. As such, the leaves are burnt close to the skin’s surface using a stick to apply heat.');
insert into service values(3, 1,'Tui Na Massage', 'Tui Na (pronounced “tween-uh”) is the oldest known form of massage. Tuina practitioners use massage and manipulation techniques to achieve a therapeutic effect. The massage aims to balance theC flow of qi through a person, which proponents claim encourages natural self-healing within the body. ');
insert into service values(4, 1,'Gua Sha Massage and Demo', 'Gua sha (pronounced “gwah-shah”) is the practice of using a tool to apply pressure and scrape the skin to relieve pain and tension. This action causes light bruising, which often appears as purple or red spots known as petechiae or sha. Tai Yang Clinic offers demo sessions for at-home Gua Sha techniques. ');
insert into service values(5, 1, 'Cupping ', 'Cupping Is a type of deep-tissue massage that involves putting special cups on the patient’s skin for a few minutes to create suction. Cupping helps with pain, inflammation, blood flow, relaxation and well-being.   ');
insert into service values(6, 1, 'Herbal Formula prescriptions', 'Tai Yang Clinic provides prescriptions and sells herbal formulas to help our patients in their holistic medical journey.');
insert into service values(7, 1,'Korean Beauty Acupuncture (Facial Rejuvenation Acupuncture)', 'Sometimes called an "acupuncture face-lift," this specialized technique involves the use of very fine needles applied to the face, scalp and neck. Rejuvenation Acupuncture technique helps to relax muscle tension, smooth lines, gently promote collagen production and stimulate healthy circulation and lymphatic flow.');
insert into service values(8, 1,'Lifestyle / Diet Therapy consulting (English, Korean & Japanese)', 'Tai Yang Clinic is happy to provide consulting sessions regarding lifestyle and diet therapy advices in order to maximize the effects of acupuncture treatments in 3 different languages, which are: English, Korean and Japanese ');


        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-05-13', 2023, 'Saturday', 13, 'May');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-05-14', 2023, 'Sunday', 14, 'May');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-05-15', 2023, 'Monday', 15, 'May');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-05-16', 2023, 'Tuesday', 16, 'May');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-05-17', 2023, 'Wednesday', 17, 'May');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-05-18', 2023, 'Thursday', 18, 'May');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-05-19', 2023, 'Friday', 19, 'May');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-05-20', 2023, 'Saturday', 20, 'May');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-05-21', 2023, 'Sunday', 21, 'May');    
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-05-22', 2023, 'Monday', 22, 'May');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-05-23', 2023, 'Tuesday', 23, 'May');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-05-24', 2023, 'Wednesday', 24, 'May');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-05-25', 2023, 'Thursday', 25, 'May');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-05-26', 2023, 'Friday', 26, 'May');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-05-27', 2023, 'Saturday', 27, 'May');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-05-28', 2023, 'Sunday', 28, 'May');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-05-29', 2023, 'Monday', 29, 'May');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-05-30', 2023, 'Tuesday', 30, 'May');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-05-31', 2023, 'Wednesday', 31, 'May');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-06-01', 2023, 'Thursday', 1, 'June');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-06-02', 2023, 'Friday', 2, 'June');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-06-03', 2023, 'Saturday', 3, 'June');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-06-04', 2023, 'Sunday', 4, 'June');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-06-05', 2023, 'Monday', 5, 'June');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-06-06', 2023, 'Tuesday', 6, 'June');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-06-07', 2023, 'Wednesday', 7, 'June');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-06-08', 2023, 'Thursday', 8, 'June');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-06-09', 2023, 'Friday', 9, 'June');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-06-10', 2023, 'Saturday', 10, 'June');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-06-11', 2023, 'Sunday', 11, 'June');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-06-12', 2023, 'Monday', 12, 'June');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-06-13', 2023, 'Tuesday', 13, 'June');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-06-14', 2023, 'Wednesday', 14, 'June');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-06-15', 2023, 'Thursday', 15, 'June');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-06-16', 2023, 'Friday', 16, 'June');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-06-17', 2023, 'Saturday', 17, 'June');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-06-18', 2023, 'Sunday', 18, 'June');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-06-19', 2023, 'Monday', 19, 'June');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-06-20', 2023, 'Tuesday', 20, 'June');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-06-21', 2023, 'Wednesday', 21, 'June');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-06-22', 2023, 'Thursday', 22, 'June');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-06-23', 2023, 'Friday', 23, 'June');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-06-24', 2023, 'Saturday', 24, 'June');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-06-25', 2023, 'Sunday', 25, 'June');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-06-26', 2023, 'Monday', 26, 'June');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-06-27', 2023, 'Tuesday', 27, 'June');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-06-28', 2023, 'Wednesday', 28, 'June');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-06-29', 2023, 'Thursday', 29, 'June');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-06-30', 2023, 'Friday', 30, 'June');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-07-01', 2023, 'Saturday', 1, 'July');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-07-02', 2023, 'Sunday', 2, 'July');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-07-03', 2023, 'Monday', 3, 'July');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-07-04', 2023, 'Tuesday', 4, 'July');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-07-05', 2023, 'Wednesday', 5, 'July');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-07-06', 2023, 'Thursday', 6, 'July');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-07-07', 2023, 'Friday', 7, 'July');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-07-08', 2023, 'Saturday', 8, 'July');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-07-09', 2023, 'Sunday', 9, 'July');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-07-10', 2023, 'Monday', 10, 'July');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-07-11', 2023, 'Tuesday', 11, 'July');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-07-12', 2023, 'Wednesday', 12, 'July');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-07-13', 2023, 'Thursday', 13, 'July');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-07-14', 2023, 'Friday', 14, 'July');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-07-15', 2023, 'Saturday', 15, 'July');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-07-16', 2023, 'Sunday', 16, 'July');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-07-17', 2023, 'Monday', 17, 'July');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-07-18', 2023, 'Tuesday', 18, 'July');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-07-19', 2023, 'Wednesday', 19, 'July');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-07-20', 2023, 'Thursday', 20, 'July');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-07-21', 2023, 'Friday', 21, 'July');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-07-22', 2023, 'Saturday', 22, 'July');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-07-23', 2023, 'Sunday', 23, 'July');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-07-24', 2023, 'Monday', 24, 'July');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-07-25', 2023, 'Tuesday', 25, 'July');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-07-26', 2023, 'Wednesday', 26, 'July');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-07-27', 2023, 'Thursday', 27, 'July');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-07-28', 2023, 'Friday', 28, 'July');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-07-29', 2023, 'Saturday', 29, 'July');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-07-30', 2023, 'Sunday', 30, 'July');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-07-31', 2023, 'Monday', 31, 'July');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-08-01', 2023, 'Tuesday', 1, 'August');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-08-02', 2023, 'Wednesday', 2, 'August');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-08-03', 2023, 'Thursday', 3, 'August');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-08-04', 2023, 'Friday', 4, 'August');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-08-05', 2023, 'Saturday', 5, 'August');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-08-06', 2023, 'Sunday', 6, 'August');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-08-07', 2023, 'Monday', 7, 'August');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-08-08', 2023, 'Tuesday', 8, 'August');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-08-09', 2023, 'Wednesday', 9, 'August');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-08-10', 2023, 'Thursday', 10, 'August');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-08-11', 2023, 'Friday', 11, 'August');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-08-12', 2023, 'Saturday', 12, 'August');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-08-13', 2023, 'Sunday', 13, 'August');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-08-14', 2023, 'Monday', 14, 'August');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-08-15', 2023, 'Tuesday', 15, 'August');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-08-16', 2023, 'Wednesday', 16, 'August');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-08-17', 2023, 'Thursday', 17, 'August');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-08-18', 2023, 'Friday', 18, 'August');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-08-19', 2023, 'Saturday', 19, 'August');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-08-20', 2023, 'Sunday', 20, 'August');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-08-21', 2023, 'Monday', 21, 'August');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-08-22', 2023, 'Tuesday', 22, 'August');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-08-23', 2023, 'Wednesday', 23, 'August');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-08-24', 2023, 'Thursday', 24, 'August');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-08-25', 2023, 'Friday', 25, 'August');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-08-26', 2023, 'Saturday', 26, 'August');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-08-27', 2023, 'Sunday', 27, 'August');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-08-28', 2023, 'Monday', 28, 'August');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-08-29', 2023, 'Tuesday', 29, 'August');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-08-30', 2023, 'Wednesday', 30, 'August');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-08-31', 2023, 'Thursday', 31, 'August');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-09-01', 2023, 'Friday', 1, 'September');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-09-02', 2023, 'Saturday', 2, 'September');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-09-03', 2023, 'Sunday', 3, 'September');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-09-04', 2023, 'Monday', 4, 'September');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-09-05', 2023, 'Tuesday', 5, 'September');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-09-06', 2023, 'Wednesday', 6, 'September');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-09-07', 2023, 'Thursday', 7, 'September');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-09-08', 2023, 'Friday', 8, 'September');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-09-09', 2023, 'Saturday', 9, 'September');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-09-10', 2023, 'Sunday', 10, 'September');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-09-11', 2023, 'Monday', 11, 'September');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-09-12', 2023, 'Tuesday', 12, 'September');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-09-13', 2023, 'Wednesday', 13, 'September');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-09-14', 2023, 'Thursday', 14, 'September');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-09-15', 2023, 'Friday', 15, 'September');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-09-16', 2023, 'Saturday', 16, 'September');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-09-17', 2023, 'Sunday', 17, 'September');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-09-18', 2023, 'Monday', 18, 'September');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-09-19', 2023, 'Tuesday', 19, 'September');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-09-20', 2023, 'Wednesday', 20, 'September');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-09-21', 2023, 'Thursday', 21, 'September');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-09-22', 2023, 'Friday', 22, 'September');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-09-23', 2023, 'Saturday', 23, 'September');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-09-24', 2023, 'Sunday', 24, 'September');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-09-25', 2023, 'Monday', 25, 'September');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-09-26', 2023, 'Tuesday', 26, 'September');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-09-27', 2023, 'Wednesday', 27, 'September');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-09-28', 2023, 'Thursday', 28, 'September');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-09-29', 2023, 'Friday', 29, 'September');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-09-30', 2023, 'Saturday', 30, 'September');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-10-01', 2023, 'Sunday', 1, 'October');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-10-02', 2023, 'Monday', 2, 'October');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-10-03', 2023, 'Tuesday', 3, 'October');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-10-04', 2023, 'Wednesday', 4, 'October');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-10-05', 2023, 'Thursday', 5, 'October');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-10-06', 2023, 'Friday', 6, 'October');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-10-07', 2023, 'Saturday', 7, 'October');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-10-08', 2023, 'Sunday', 8, 'October');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-10-09', 2023, 'Monday', 9, 'October');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-10-10', 2023, 'Tuesday', 10, 'October');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-10-11', 2023, 'Wednesday', 11, 'October');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-10-12', 2023, 'Thursday', 12, 'October');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-10-13', 2023, 'Friday', 13, 'October');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-10-14', 2023, 'Saturday', 14, 'October');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-10-15', 2023, 'Sunday', 15, 'October');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-10-16', 2023, 'Monday', 16, 'October');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-10-17', 2023, 'Tuesday', 17, 'October');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-10-18', 2023, 'Wednesday', 18, 'October');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-10-19', 2023, 'Thursday', 19, 'October');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-10-20', 2023, 'Friday', 20, 'October');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-10-21', 2023, 'Saturday', 21, 'October');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-10-22', 2023, 'Sunday', 22, 'October');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-10-23', 2023, 'Monday', 23, 'October');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-10-24', 2023, 'Tuesday', 24, 'October');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-10-25', 2023, 'Wednesday', 25, 'October');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-10-26', 2023, 'Thursday', 26, 'October');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-10-27', 2023, 'Friday', 27, 'October');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-10-28', 2023, 'Saturday', 28, 'October');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-10-29', 2023, 'Sunday', 29, 'October');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-10-30', 2023, 'Monday', 30, 'October');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-10-31', 2023, 'Tuesday', 31, 'October');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-11-01', 2023, 'Wednesday', 1, 'November');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-11-02', 2023, 'Thursday', 2, 'November');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-11-03', 2023, 'Friday', 3, 'November');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-11-04', 2023, 'Saturday', 4, 'November');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-11-05', 2023, 'Sunday', 5, 'November');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-11-06', 2023, 'Monday', 6, 'November');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-11-07', 2023, 'Tuesday', 7, 'November');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-11-08', 2023, 'Wednesday', 8, 'November');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-11-09', 2023, 'Thursday', 9, 'November');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-11-10', 2023, 'Friday', 10, 'November');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-11-11', 2023, 'Saturday', 11, 'November');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-11-12', 2023, 'Sunday', 12, 'November');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-11-13', 2023, 'Monday', 13, 'November');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-11-14', 2023, 'Tuesday', 14, 'November');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-11-15', 2023, 'Wednesday', 15, 'November');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-11-16', 2023, 'Thursday', 16, 'November');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-11-17', 2023, 'Friday', 17, 'November');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-11-18', 2023, 'Saturday', 18, 'November');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-11-19', 2023, 'Sunday', 19, 'November');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-11-20', 2023, 'Monday', 20, 'November');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-11-21', 2023, 'Tuesday', 21, 'November');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-11-22', 2023, 'Wednesday', 22, 'November');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-11-23', 2023, 'Thursday', 23, 'November');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-11-24', 2023, 'Friday', 24, 'November');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-11-25', 2023, 'Saturday', 25, 'November');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-11-26', 2023, 'Sunday', 26, 'November');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-11-27', 2023, 'Monday', 27, 'November');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-11-28', 2023, 'Tuesday', 28, 'November');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-11-29', 2023, 'Wednesday', 29, 'November');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-11-30', 2023, 'Thursday', 30, 'November');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-12-01', 2023, 'Friday', 1, 'December');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-12-02', 2023, 'Saturday', 2, 'December');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-12-03', 2023, 'Sunday', 3, 'December');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-12-04', 2023, 'Monday', 4, 'December');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-12-05', 2023, 'Tuesday', 5, 'December');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-12-06', 2023, 'Wednesday', 6, 'December');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-12-07', 2023, 'Thursday', 7, 'December');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-12-08', 2023, 'Friday', 8, 'December');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-12-09', 2023, 'Saturday', 9, 'December');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-12-10', 2023, 'Sunday', 10, 'December');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-12-11', 2023, 'Monday', 11, 'December');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-12-12', 2023, 'Tuesday', 12, 'December');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-12-13', 2023, 'Wednesday', 13, 'December');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-12-14', 2023, 'Thursday', 14, 'December');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-12-15', 2023, 'Friday', 15, 'December');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-12-16', 2023, 'Saturday', 16, 'December');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-12-17', 2023, 'Sunday', 17, 'December');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-12-18', 2023, 'Monday', 18, 'December');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-12-19', 2023, 'Tuesday', 19, 'December');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-12-20', 2023, 'Wednesday', 20, 'December');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-12-21', 2023, 'Thursday', 21, 'December');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-12-22', 2023, 'Friday', 22, 'December');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-12-23', 2023, 'Saturday', 23, 'December');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-12-24', 2023, 'Sunday', 24, 'December');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-12-25', 2023, 'Monday', 25, 'December');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-12-26', 2023, 'Tuesday', 26, 'December');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-12-27', 2023, 'Wednesday', 27, 'December');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-12-28', 2023, 'Thursday', 28, 'December');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-12-29', 2023, 'Friday', 29, 'December');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-12-30', 2023, 'Saturday', 30, 'December');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2023-12-31', 2023, 'Sunday', 31, 'December');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-01-01', 2024, 'Monday', 1, 'January');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-01-02', 2024, 'Tuesday', 2, 'January');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-01-03', 2024, 'Wednesday', 3, 'January');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-01-04', 2024, 'Thursday', 4, 'January');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-01-05', 2024, 'Friday', 5, 'January');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-01-06', 2024, 'Saturday', 6, 'January');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-01-07', 2024, 'Sunday', 7, 'January');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-01-08', 2024, 'Monday', 8, 'January');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-01-09', 2024, 'Tuesday', 9, 'January');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-01-10', 2024, 'Wednesday', 10, 'January');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-01-11', 2024, 'Thursday', 11, 'January');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-01-12', 2024, 'Friday', 12, 'January');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-01-13', 2024, 'Saturday', 13, 'January');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-01-14', 2024, 'Sunday', 14, 'January');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-01-15', 2024, 'Monday', 15, 'January');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-01-16', 2024, 'Tuesday', 16, 'January');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-01-17', 2024, 'Wednesday', 17, 'January');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-01-18', 2024, 'Thursday', 18, 'January');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-01-19', 2024, 'Friday', 19, 'January');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-01-20', 2024, 'Saturday', 20, 'January');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-01-21', 2024, 'Sunday', 21, 'January');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-01-22', 2024, 'Monday', 22, 'January');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-01-23', 2024, 'Tuesday', 23, 'January');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-01-24', 2024, 'Wednesday', 24, 'January');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-01-25', 2024, 'Thursday', 25, 'January');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-01-26', 2024, 'Friday', 26, 'January');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-01-27', 2024, 'Saturday', 27, 'January');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-01-28', 2024, 'Sunday', 28, 'January');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-01-29', 2024, 'Monday', 29, 'January');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-01-30', 2024, 'Tuesday', 30, 'January');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-01-31', 2024, 'Wednesday', 31, 'January');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-02-01', 2024, 'Thursday', 1, 'February');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-02-02', 2024, 'Friday', 2, 'February');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-02-03', 2024, 'Saturday', 3, 'February');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-02-04', 2024, 'Sunday', 4, 'February');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-02-05', 2024, 'Monday', 5, 'February');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-02-06', 2024, 'Tuesday', 6, 'February');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-02-07', 2024, 'Wednesday', 7, 'February');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-02-08', 2024, 'Thursday', 8, 'February');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-02-09', 2024, 'Friday', 9, 'February');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-02-10', 2024, 'Saturday', 10, 'February');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-02-11', 2024, 'Sunday', 11, 'February');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-02-12', 2024, 'Monday', 12, 'February');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-02-13', 2024, 'Tuesday', 13, 'February');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-02-14', 2024, 'Wednesday', 14, 'February');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-02-15', 2024, 'Thursday', 15, 'February');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-02-16', 2024, 'Friday', 16, 'February');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-02-17', 2024, 'Saturday', 17, 'February');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-02-18', 2024, 'Sunday', 18, 'February');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-02-19', 2024, 'Monday', 19, 'February');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-02-20', 2024, 'Tuesday', 20, 'February');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-02-21', 2024, 'Wednesday', 21, 'February');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-02-22', 2024, 'Thursday', 22, 'February');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-02-23', 2024, 'Friday', 23, 'February');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-02-24', 2024, 'Saturday', 24, 'February');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-02-25', 2024, 'Sunday', 25, 'February');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-02-26', 2024, 'Monday', 26, 'February');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-02-27', 2024, 'Tuesday', 27, 'February');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-02-28', 2024, 'Wednesday', 28, 'February');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-02-29', 2024, 'Thursday', 29, 'February');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-03-01', 2024, 'Friday', 1, 'March');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-03-02', 2024, 'Saturday', 2, 'March');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-03-03', 2024, 'Sunday', 3, 'March');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-03-04', 2024, 'Monday', 4, 'March');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-03-05', 2024, 'Tuesday', 5, 'March');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-03-06', 2024, 'Wednesday', 6, 'March');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-03-07', 2024, 'Thursday', 7, 'March');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-03-08', 2024, 'Friday', 8, 'March');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-03-09', 2024, 'Saturday', 9, 'March');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-03-10', 2024, 'Sunday', 10, 'March');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-03-11', 2024, 'Monday', 11, 'March');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-03-12', 2024, 'Tuesday', 12, 'March');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-03-13', 2024, 'Wednesday', 13, 'March');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-03-14', 2024, 'Thursday', 14, 'March');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-03-15', 2024, 'Friday', 15, 'March');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-03-16', 2024, 'Saturday', 16, 'March');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-03-17', 2024, 'Sunday', 17, 'March');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-03-18', 2024, 'Monday', 18, 'March');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-03-19', 2024, 'Tuesday', 19, 'March');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-03-20', 2024, 'Wednesday', 20, 'March');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-03-21', 2024, 'Thursday', 21, 'March');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-03-22', 2024, 'Friday', 22, 'March');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-03-23', 2024, 'Saturday', 23, 'March');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-03-24', 2024, 'Sunday', 24, 'March');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-03-25', 2024, 'Monday', 25, 'March');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-03-26', 2024, 'Tuesday', 26, 'March');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-03-27', 2024, 'Wednesday', 27, 'March');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-03-28', 2024, 'Thursday', 28, 'March');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-03-29', 2024, 'Friday', 29, 'March');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-03-30', 2024, 'Saturday', 30, 'March');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-03-31', 2024, 'Sunday', 31, 'March');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-04-01', 2024, 'Monday', 1, 'April');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-04-02', 2024, 'Tuesday', 2, 'April');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-04-03', 2024, 'Wednesday', 3, 'April');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-04-04', 2024, 'Thursday', 4, 'April');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-04-05', 2024, 'Friday', 5, 'April');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-04-06', 2024, 'Saturday', 6, 'April');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-04-07', 2024, 'Sunday', 7, 'April');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-04-08', 2024, 'Monday', 8, 'April');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-04-09', 2024, 'Tuesday', 9, 'April');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-04-10', 2024, 'Wednesday', 10, 'April');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-04-11', 2024, 'Thursday', 11, 'April');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-04-12', 2024, 'Friday', 12, 'April');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-04-13', 2024, 'Saturday', 13, 'April');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-04-14', 2024, 'Sunday', 14, 'April');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-04-15', 2024, 'Monday', 15, 'April');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-04-16', 2024, 'Tuesday', 16, 'April');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-04-17', 2024, 'Wednesday', 17, 'April');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-04-18', 2024, 'Thursday', 18, 'April');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-04-19', 2024, 'Friday', 19, 'April');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-04-20', 2024, 'Saturday', 20, 'April');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-04-21', 2024, 'Sunday', 21, 'April');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-04-22', 2024, 'Monday', 22, 'April');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-04-23', 2024, 'Tuesday', 23, 'April');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-04-24', 2024, 'Wednesday', 24, 'April');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-04-25', 2024, 'Thursday', 25, 'April');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-04-26', 2024, 'Friday', 26, 'April');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-04-27', 2024, 'Saturday', 27, 'April');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-04-28', 2024, 'Sunday', 28, 'April');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-04-29', 2024, 'Monday', 29, 'April');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-04-30', 2024, 'Tuesday', 30, 'April');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-05-01', 2024, 'Wednesday', 1, 'May');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-05-02', 2024, 'Thursday', 2, 'May');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-05-03', 2024, 'Friday', 3, 'May');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-05-04', 2024, 'Saturday', 4, 'May');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-05-05', 2024, 'Sunday', 5, 'May');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-05-06', 2024, 'Monday', 6, 'May');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-05-07', 2024, 'Tuesday', 7, 'May');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-05-08', 2024, 'Wednesday', 8, 'May');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-05-09', 2024, 'Thursday', 9, 'May');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-05-10', 2024, 'Friday', 10, 'May');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-05-11', 2024, 'Saturday', 11, 'May');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-05-12', 2024, 'Sunday', 12, 'May');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-05-13', 2024, 'Monday', 13, 'May');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-05-14', 2024, 'Tuesday', 14, 'May');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-05-15', 2024, 'Wednesday', 15, 'May');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-05-16', 2024, 'Thursday', 16, 'May');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-05-17', 2024, 'Friday', 17, 'May');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-05-18', 2024, 'Saturday', 18, 'May');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-05-19', 2024, 'Sunday', 19, 'May');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-05-20', 2024, 'Monday', 20, 'May');
        insert into day(fulldate,year, dayname, daynumber, month_name) values(DATE '2024-05-21', 2024, 'Tuesday', 21, 'May');
insert into day(fulldate,year, dayname, daynumber, month_name) values
(DATE '2024-05-22', 2024, 'Wednesday', 22, 'May'),
(DATE '2024-05-23', 2024, 'Thursday', 23, 'May'),
(DATE '2024-05-24', 2024, 'Friday', 24, 'May'),
(DATE '2024-05-25', 2024, 'Saturday', 25, 'May'),
(DATE '2024-05-26', 2024, 'Sunday', 26, 'May'),
(DATE '2024-05-27', 2024, 'Monday', 27, 'May'),
(DATE '2024-05-28', 2024, 'Tuesday', 28, 'May'),
(DATE '2024-05-29', 2024, 'Wednesday', 29, 'May'),
(DATE '2024-05-30', 2024, 'Thursday', 30, 'May'),
(DATE '2024-05-31', 2024, 'Friday', 31, 'May'),
(DATE '2024-06-01', 2024, 'Saturday', 1, 'June'),
(DATE '2024-06-02', 2024, 'Sunday', 2, 'June'),
(DATE '2024-06-03', 2024, 'Monday', 3, 'June'),
(DATE '2024-06-04', 2024, 'Tuesday', 4, 'June'),
(DATE '2024-06-05', 2024, 'Wednesday', 5, 'June'),
(DATE '2024-06-06', 2024, 'Thursday', 6, 'June'),
(DATE '2024-06-07', 2024, 'Friday', 7, 'June'),
(DATE '2024-06-08', 2024, 'Saturday', 8, 'June'),
(DATE '2024-06-09', 2024, 'Sunday', 9, 'June'),
(DATE '2024-06-10', 2024, 'Monday', 10, 'June'),
(DATE '2024-06-11', 2024, 'Tuesday', 11, 'June'),
(DATE '2024-06-12', 2024, 'Wednesday', 12, 'June'),
(DATE '2024-06-13', 2024, 'Thursday', 13, 'June'),
(DATE '2024-06-14', 2024, 'Friday', 14, 'June'),
(DATE '2024-06-15', 2024, 'Saturday', 15, 'June'),
(DATE '2024-06-16', 2024, 'Sunday', 16, 'June'),
(DATE '2024-06-17', 2024, 'Monday', 17, 'June'),
(DATE '2024-06-18', 2024, 'Tuesday', 18, 'June'),
(DATE '2024-06-19', 2024, 'Wednesday', 19, 'June'),
(DATE '2024-06-20', 2024, 'Thursday', 20, 'June'),
(DATE '2024-06-21', 2024, 'Friday', 21, 'June'),
(DATE '2024-06-22', 2024, 'Saturday', 22, 'June'),
(DATE '2024-06-23', 2024, 'Sunday', 23, 'June'),
(DATE '2024-06-24', 2024, 'Monday', 24, 'June'),
(DATE '2024-06-25', 2024, 'Tuesday', 25, 'June'),
(DATE '2024-06-26', 2024, 'Wednesday', 26, 'June'),
(DATE '2024-06-27', 2024, 'Thursday', 27, 'June'),
(DATE '2024-06-28', 2024, 'Friday', 28, 'June'),
(DATE '2024-06-29', 2024, 'Saturday', 29, 'June')


