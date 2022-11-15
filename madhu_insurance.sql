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
    
    show tables;
use madhu_insurance;

insert into person values('A01','RICHARD','SHRINIVAS NAGAR');
insert into person values('A02','PRADEEP','RAJAJI NGAR');
insert into person values('A03','SMITH','ASHOK NAGAR');
insert into person values('A04','VENU','NR COLONY');
insert into person values('A05','JOHN','HANUMANTH NAGAR');

insert into car values('KA052250','INDICA','1990');
insert into car values('KA031181','LANCER','1957');
insert into car values('KA095477','TOYOTA','1998');
insert into car values('KA053408','HONDA','2008');
insert into car values('KA041702','AUDI','2005');

insert into owns values('A01','KA052250');
insert into owns values('A02','KA031181');
insert into owns values('A03','KA095477');
insert into owns values('A04','KA053408');
insert into owns values('A05','KA041702');

insert into accident values('11','01/01/03','MYSORE ROAD');
insert into accident values('12','02/02/04','SOUTH END CIRCLE');
insert into accident values('13','21/01/03','BULL TEMPLE ROAD');
insert into accident values('14','17/02/08','MYSORE ROAD');
insert into accident values('15','04/03/05','KANAKAPURA ROAD');

insert into participated values('A01','KA052250','11','10000');
insert into participated values('A02','KA031181','12','50000');
insert into participated values('A03','KA095477','13','25000');
insert into participated values('A04','KA053408','14','3000');
insert into participated values('A05','KA041702','15','5000');

select *
from car
order by year asc;

select count(report_num)
from car c,participated p
where c.reg_num=p.reg_num and c.model='LANCER';

select count(distinct driver_id)cnt
from participated a,accident b
where a.report_num=b.report_num and b.accident_date like '%08';

select *
from participated
order by damage_amount desc;

 
 























    
    
    
    