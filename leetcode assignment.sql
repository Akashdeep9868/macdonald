create database subject;
use subject;

create table Teacher(
teacher_id int,
subject_id int,
dept_id int
);

insert into Teacher values(1,2,3);
insert into Teacher values(1,2,4);
insert into Teacher values(1,3,3);
insert into Teacher values(2,1,1);
insert into Teacher values(2,2,1);
insert into Teacher values(2,3,1);
insert into Teacher values(2,4,1);

select * from Teacher;


select teacher_id,count(distinct subject_id) as cnt
from Teacher
group by teacher_id;


create table Olympic(
country varchar(20),
gold_medals int,
silver_medals int,
bronze_medals int
);

insert into Olympic values('China',10,10,20);
insert into Olympic values('South sudan',0,0,1);
insert into Olympic values('USA',10,10,20);
insert into Olympic values('Israel',2,2,3);
insert into Olympic values('Egypt',2,2,2);

select * from Olympic;

select * from Olympic
order by gold_medals desc, silver_medals desc,bronze_medals desc,country asc;

create table Elements(
symbol varchar(20),
type varchar(20),
electrons int
);

insert into Elements values('He','Nobal',0);
insert into Elements values('Na','Metal',1);
insert into Elements values('Ca','Metal',2);
insert into Elements values('La','Metal',3);
insert into Elements values('Cl','Non-Metal',1);
insert into Elements values('O','Non-Metal',2);
insert into Elements values('N','Non-Metal',3);

select * from Elements

select e1.symbol as 'Metal',e2.symbol as 'Non-metal'
from Elements e1
inner join Elements e2 on e1.symbol<>e2.symbol
where e1.type='Metal' and e2.type='Non-Metal';

create table Person(
person_id int,
name varchar(20),
profession varchar(20)
);

insert into Person values(1,'Alex','Singer');
insert into Person values(3,'Alice','Actor');
insert into Person values(2,'Bob','Player');
insert into Person values(4,'Messi','Doctor');
insert into Person values(6,'Tyson','Engineer');
insert into Person values(5,'Meir','Lawyer');

SELECT person_id, CONCAT(name, '(', substring(profession, 1, 1), ')') AS name
FROM Person
ORDER BY person_id DESC;

create table Bikes(
ride_id int,
bike_number varchar(20),
start_time datetime,
end_time datetime
);

insert into Bikes values (1,'W00576','2012-03-25 11:30:00','2012-03-25 12:40:00');
insert into Bikes values (2,'W00300','2012-03-25 10:30:00','2012-03-25 10:50:00');
insert into Bikes values (3,'W00455','2012-03-26 14:30:00','2012-03-26 17:40:00');
insert into Bikes values (4,'W00576','2012-03-25 12:30:00','2012-03-25 13:40:00');
insert into Bikes values (5,'W00576','2012-03-25 08:10:00','2012-03-25 09:10:00');
insert into Bikes values (6,'W00576','2012-03-28 02:30:00','2012-03-28 02:50:00');

select * from Bikes;

select bike_number,max(end_time) as end_time
from Bikes
group by bike_number
order by bike_number desc;

(select bike_number,max(end_time) as end_time
from Bikes
where end_time)


create table Employee(
employee_id int,
department_id int,
primary_flag varchar(10)
);

insert into Employee values(1,1,'N');
insert into Employee values(2,1,'Y');
insert into Employee values(2,2,'N');
insert into Employee values(3,3,'N');
insert into Employee values(4,2,'N');
insert into Employee values(4,3,'Y');
insert into Employee values(4,4,'N');

SELECT * from Employee;

select employee_id, department_id 
from Employee 
where primary_flag = 'Y'
union
select employee_id, department_id 
from Employee
group by employee_id

having count(department_id) = 1;

create table Playback(
session_id int,
customer_id int,
start_time int,
end_time int

) 

insert into Playback values(1,1,1,5);
insert into Playback values(2,1,15,23);
insert into Playback values(3,2,10,12);
insert into Playback values(4,2,17,28);
insert into Playback values(5,2,2,8);

select * from Playback;


create table Ads(
ad_id int,
customer_id int,
timestamp int)

insert into Ads values(1,1,15);
insert into Ads values(2,2,17);
insert into Ads values(3,2,20);

select * from Ads;

select session_id
from Playback p
left join Ads a
on p.customer_id=a.customer_id
where p.start_time <= a.timestamp and
    a.timestamp <= p.end_time
group by session_id;

select session_id from Playback p 
left join Ads a on
    p.customer_id = a.customer_id and
    p.start_time <= a.timestamp and
    a.timestamp <= p.end_time
where a.ad_id is NULL

create table Days(
day date
);

insert into days values('2022-04-12');
insert into days values('2021-08-09');
insert into days values('2020-06-26');

select * from Days

extract (day from days);

extract(day), extract(month),
extract(date),extract(year) from days;


select problem_id
from Problems
where round(100*likes/sum(likes,dislikes),2)<60
order by problem_id asc;

create table NewYork(
student_id int,
score int
);

insert into NewYork values(1,90);
insert into NewYork values(2,87);

select * from NewYork;

create table California(
student_id int,
score int
);


insert into California values(2,89);
insert into California values(3,88);

select * from California;


case 
when score >=90 then Newyork University
else 
end as winner
from NewYork;

SELECT
    CASE
        WHEN n1.cnt > n2.cnt THEN 'New York University'
        WHEN n1.cnt < n2.cnt THEN 'California University'
        ELSE 'No Winner' 
    END AS winner
FROM
    (SELECT count(1) cnt FROM NewYork WHERE score >= 90) n1,
    (SELECT COUNT(1) cnt FROM California WHERE score >= 90) n2;

	drop table Employees;

	create table Employees(
	id int,
	name varchar(20)
	);

	insert into Employees values(1,'Alice');
		insert into Employees values(7,'Bob');
			insert into Employees values(11,'Meir');	
			insert into Employees values(90,'Winston');
				insert into Employees values(3,'Jonathan');

				select * from Employees;


create table EmployeeUNI(
id int,
unique_id int
);

insert into EmployeeUNI values(3,1);
insert into EmployeeUNI values(11,2);
insert into EmployeeUNI values(90,3);

select * from EmployeeUNI;
select unique_id,name
from  Employees e
inner join EmployeeUNI eu
on e.id=eu.id 


select unique_id, name
from Employees
left join EmployeeUNI
on if (Employees.id = EmployeeUNI.id, Employees.id, null)

select unique_id, name from Employees 
left join EmployeeUNI on Employees.id = EmployeeUNI.id;


create table Patients(
patient_id int,
patient_name varchar(20),
conditions varchar(20)
);


insert into Patients values(1,'Daniel','YFEV COUGH');
insert into Patients values(2,'Alice','  ');
insert into Patients values(3,'Bob','DIAB100 MYOP');
insert into Patients values(4,'George','ACNE DIAB100');
insert into Patients values(5,'Alain','DIAB201');

select * from Patients;

TRUNCATE TABLE Patients;

select * from Patients 
where conditions like '%DIAB1%';

CREATE TABLE TWEETS(
tweet_id int,
content varchar(50)

);

insert into tweets values (1,'Vote for Biden');
insert into tweets values (2,'Let us make America great again!');

select * from tweets;

select tweet_id
from tweets
where length(content) > 15;