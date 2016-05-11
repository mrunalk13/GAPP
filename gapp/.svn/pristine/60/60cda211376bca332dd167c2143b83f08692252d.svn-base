
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

    create sequence hibernate_sequence;
