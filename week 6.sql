create database employee_new;
use employee_new;

create table dept(
deptno int,
dname varchar(20),
dloc varchar(10),
primary key (deptno)
);

insert into dept
values(1,'Logistics','Bengaluru'),
(2,'Statistics','Mysuru'),
(3,'Marketing','Hyderabad'),
(4,'Design','Bengaluru'),
(5,'Management','Mysuru'),
(6,'Finance','Bombay');


select * from dept;

create table project(
pno int,
ploc varchar(20),
pname varchar(20),
primary key (pno)
);

insert into project
values(01,'Hyderabad','Project_Zero'),
(02,'Mysuru','Project_Alpha'),
(03,'Hyderabad','Project_Bozo'),
(04,'Bengaluru','Project_Waaris'),
(05,'Bombay','Project_Onslaught'),
(06,'Mysuru','Project_DivideBY');

select * from project;

create table incentives(
empno int,
incentive_date date,
incentive_amount int,
primary key (empno,incentive_date)
);

insert into incentives
values(7698,'2022-10-01',5000),
(7566,'2022-11-02',7000),
(7421,'2022-05-03',5000),
(7854,'2022-07-05',5000),
(7213,'2022-08-07',9000);

select * from incentives;

create table employee(
empno int,
ename varchar(20),
mgr_no int,
hiredate date,
sal int,
deptno int,
primary key (empno),
foreign key (deptno) references dept (deptno)
on delete cascade on update cascade
);

insert into employee
values(7499,'Avinash',7698,'2021-10-09',56000,1),
(7521,'Dinesh',7698,'2021-03-07',96000,1),
(7566,'Balaji',7839,'2021-10-08',66000,1),
(7654,'Sovesh',7698,'2021-02-09',42000,2),
(7698,'Sordelu',7839,'2021-03-04',76000,2),
(7782,'Hasbulla',7839,'2022-01-05',47900,3),
(7788,'Tacitus Kilgore',7566,'2021-11-19',420000,4),
(7839,'Govardhan Prasad',null,'2021-02-13',327100,5),
(7876,'Champika',7788,'2021-07-14',87600,5),
(7902,'Robin',7566,'2021-12-31',123000,5);

select * from employee;

create table assigned_to(
empno int,
pno int,
job_role varchar(20),
primary key(empno,pno),
foreign key(empno) references employee(empno),
foreign key(pno) references project(pno)
on delete cascade on update cascade 
);

insert into assigned_to
values(7698,01,'Developer'),
(7566,04,'Tester'),
(7654,05,'Manager'),
(7788,03,'Supervisor'),
(7839,02,'Team Leader'),
(7902,06,'Executive Manager');

select * from assigned_to;

#q3

select m.ename,count(*) 
from employee e,employee m 
where e.mgr_no=m.empno 
group by m.ename 
having count(*)=(select max(mycount) 
					from (select count(*) mycount 
                    from employee 
                    group by mgr_no) a);
                    
#q4
select E.ename 
from employee E 
where E.empno in (select P.mgr_no 
					from employee P 
                    where sal>(select avg(sal) 
								from employee G 
								where G.mgr_no=E.empno));
                                
#q5
select E.ename 
from employee E,employee M 
where E.mgr_no=M.empno and M.deptno=E.deptno;

#q6
select E.empno,E.ename,E.deptno 
from employee E,incentives I 
where E.empno=I.empno and incentive_date like '2022-10%';
