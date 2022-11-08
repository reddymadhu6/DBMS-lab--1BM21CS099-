create database madhu_insurance;
use madhu_insurance;
create table person(
    driver_id varchar(30),
    Name varchar(30) not null,
    Address varchar(50),
    primary key(driver_id)
);

create table Car(
	reg_num varchar(40),
    model varchar(40) not null,
    year varchar(4) not null,
    primary key(reg_num)
    );

create table owns(
	driver_id varchar(40),
    reg_num varchar(40),
    primary key(driver_id,reg_num),
    foreign key(driver_id)references person(driver_id),
    foreign key(reg_num)references car(reg_num)
    );
    
create table Accident(
	report_num varchar(40),
    accident_date varchar(40),
    location varchar(100),
    primary key(report_num)
    );
    
create table Participated(
	driver_id varchar(40),
    reg_num varchar(40),
    report_num varchar(40),
    Damage_Amount int,
    primary key(driver_id,reg_num,report_num),
    foreign key(driver_id)references person(driver_id),
    foreign key(reg_num)references car(reg_num),
    foreign key(report_num)references Accident(report_num)
    );
    
    desc person
    
    Insert into person
    values("1BM21CS099",
    
    
    
    
    
    
    
    