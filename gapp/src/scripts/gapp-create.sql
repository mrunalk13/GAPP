 
    create table additionalField (
        field_id int4 not null,
        name varchar(255),
        required boolean,
        type varchar(255),
        dept_dept_id int4,
        primary key (field_id)
    );

    create table additionalFieldValue (
        fieldValue_id int4 not null,
        file bytea,
        value varchar(255),
        application_application_id int4,
        field_field_id int4,
        primary key (fieldValue_id)
    );

    create table applications (
        application_id int4 not null,
        cin int4,
        citizenship varchar(255),
        dob timestamp,
        email varchar(255),
        first_name varchar(255),
        gender varchar(255),
        last_name varchar(255),
        submitted_date timestamp,
        toefl int4,
        dept_dept_id int4,
        program_program_id int4,
        status_status_id int4,
        term_term_id int4,
        user_user_id int4,
        primary key (application_id)
    );

    create table degrees (
        degree_id int4 not null,
        GPA float4,
        college varchar(255),
        degree varchar(255),
        major varchar(255),
        time_period varchar(255),
        transcript bytea,
        transcript_name varchar(255),
        application_application_id int4,
        primary key (degree_id)
    );

    create table departments (
        dept_id int4 not null,
        name varchar(255),
        primary key (dept_id)
    );

    create table gappUsers (
        user_id int4 not null,
        email varchar(255),
        enabled boolean,
        first_name varchar(255),
        last_name varchar(255),
        password varchar(255),
        role_role_id int4,
        primary key (user_id)
    );

    create table programs (
        program_id int4 not null,
        name varchar(255),
        dept_dept_id int4,
        primary key (program_id)
    );

    create table roles (
        role_id int4 not null,
        role_type varchar(255),
        primary key (role_id)
    );

    create table status (
        status_id int4 not null,
        status varchar(255),
        primary key (status_id)
    );

    create table statusLog (
        id int4 not null,
        comment varchar(255),
        date timestamp,
        application_application_id int4,
        sts_status_id int4,
        user_user_id int4,
        primary key (id)
    );

    create table terms (
        term_id int4 not null,
        term varchar(255),
        primary key (term_id)
    );

    alter table additionalField 
        add constraint FK_8mfsbw4jtl4wtatbfdxk3pui8 
        foreign key (dept_dept_id) 
        references departments;

    alter table additionalFieldValue 
        add constraint FK_keuvrj2wymkff3ur4mgqfuq4t 
        foreign key (application_application_id) 
        references applications;

    alter table additionalFieldValue 
        add constraint FK_4kvi5jdng2xyn7tmhdcq3vaqm 
        foreign key (field_field_id) 
        references additionalField;

    alter table applications 
        add constraint FK_hjxk94sfig4051etpwlkhmovo 
        foreign key (dept_dept_id) 
        references departments;

    alter table applications 
        add constraint FK_pyk1en13i54d1kqesfvrrwdc1 
        foreign key (program_program_id) 
        references programs;

    alter table applications 
        add constraint FK_kcvgm8wkufnd1xp5xd4bxkqof 
        foreign key (status_status_id) 
        references status;

    alter table applications 
        add constraint FK_r7tsf5girf3c3q93ria2k57cu 
        foreign key (term_term_id) 
        references terms;

    alter table applications 
        add constraint FK_bluanikenmrafi5adj9w2oivc 
        foreign key (user_user_id) 
        references gappUsers;

    alter table degrees 
        add constraint FK_15by4fik7nk18bs89i5phh9m1 
        foreign key (application_application_id) 
        references applications;

    alter table gappUsers 
        add constraint FK_1f4xf9n41phwwyll9i34oacei 
        foreign key (role_role_id) 
        references roles;

    alter table programs 
        add constraint FK_bvnv211p91vsohkggjqtvq7kx 
        foreign key (dept_dept_id) 
        references departments;

    alter table statusLog 
        add constraint FK_hqv5t6ahrx5vkjwm4ofnraie4 
        foreign key (application_application_id) 
        references applications;

    alter table statusLog 
        add constraint FK_4v6glqpmoltdx92h55tl9t6h9 
        foreign key (sts_status_id) 
        references status;

    alter table statusLog 
        add constraint FK_fm6jn2788xo14md0a1css7lt5 
        foreign key (user_user_id) 
        references gappUsers;

    create sequence hibernate_sequence minValue 100;

 
INSERT INTO roles VALUES (1,'admin');
INSERT INTO roles VALUES (2,'staff');
INSERT INTO roles VALUES (3,'student');

INSERT INTO gappusers VALUES (1,'admin@localhost.localdomain', true, 'admin', null , 'abcd', 1 );
INSERT INTO gappusers VALUES (2,'staff1@localhost.localdomain', true, 'Ned', 'Stak', 'abcd', 2 );
INSERT INTO gappusers VALUES (3,'staff2@localhost.localdomain', true, 'Cat', 'Stak', 'abcd', 2 );
INSERT INTO gappusers VALUES (4,'student1@localhost.localdomain', true, 'John', 'Snow', 'abcd', 3 );
INSERT INTO gappusers VALUES (5,'student2@localhost.localdomain', true, 'Danerys', 'Tagerian', 'abcd', 3 );

INSERT INTO departments VALUES (1,'Accounting');
INSERT INTO departments VALUES (2,'Computer Science');
INSERT INTO departments VALUES (3,'Bussiness');

INSERT INTO programs VALUES (1,'MS in Accounting', 1);
INSERT INTO programs VALUES (2,'MS in Computer Science', 2);
INSERT INTO programs VALUES (3,'BS in Accounting', 1);
INSERT INTO programs VALUES (4,'BS in Computer Science', 2);
INSERT INTO programs VALUES (5,'MS in Information Technology', 2);
INSERT INTO programs VALUES (6,'MBA', 3);


INSERT INTO additionalfield VALUES (1,'GMAT', true, 'Number', 1);
INSERT INTO additionalfield VALUES (2,'LOR', true, 'File', 1);
INSERT INTO additionalfield VALUES (3,'IELTS', false, 'Number', 1);
INSERT INTO additionalfield VALUES (4,'GRE', true, 'Number', 2);
INSERT INTO additionalfield VALUES (5,'SOP', true, 'File', 2);


INSERT INTO terms VALUES (1,'Fall 2016');
INSERT INTO terms VALUES (2,'Spring 2017');
INSERT INTO terms VALUES (3,'Fall 2017');
INSERT INTO terms VALUES (4,'Spring 2018');

INSERT INTO status VALUES (1,'Submitted');
INSERT INTO status VALUES (2,'Pending Review');
INSERT INTO status VALUES (3,'Denied');
INSERT INTO status VALUES (4,'Recommend Admit');
INSERT INTO status VALUES (5,'Recommend Admit w/ Condition');
INSERT INTO status VALUES (6,'Not Submitted');


INSERT INTO applications VALUES (1, 301, 'USA', '05-13-1990','johnsnow@gmail.com','John', 'Male','Snow', '05-31-2015', 120, 1, 1, 1, 1, 4);
INSERT INTO applications VALUES (2, 301, 'USA', '05-13-1990','johnsnow@gmail.com','John', 'Male','Snow', null, 120, 2, 2, 6, 1, 4);
INSERT INTO applications VALUES (3, 301, 'USA', '05-13-1990','johnsnow@gmail.com','John', 'Male','S', '05-31-2015', 120, 2, 5, 2, 1, 4);
INSERT INTO applications VALUES (4, 302, 'USA', '04-24-1993','Danerys@gmail.com','Danerys', 'Female','Tagerian', '05-31-2015', 110, 2, 2, 1, 2, 5);
INSERT INTO applications VALUES (5, 302, 'USA', '04-24-1993','student2@localhost.localdomain','Danerys', 'Female','T',null, 110, 2, 5, 6, 2, 5);
INSERT INTO applications VALUES (6, 302, 'USA', '04-24-1993','Danerys@gmail.com','Danerys', 'Female','T', '05-31-2015',110, 3, 6, 1, 2, 5);


INSERT INTO additionalfieldvalue VALUES (1, null, '600', 1, 1);
INSERT INTO additionalfieldvalue VALUES (2, null, '320', 1, 2);

INSERT INTO degrees VALUES (1,3.9, 'University of California LA', 'HSC','Science', '2005-2007', null, null, 1);
INSERT INTO degrees VALUES (2,4, 'University of California LA', 'B.E','Computer Science', '2007-2011', null, null, 1);

