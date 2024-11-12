
--1-- create databases
create database DB1;


--2-- create database if not exists 
if not exists (select * from sys.databases where name ='DB1')
begin 
create database DB1;
end


--3-- drop database 
drop database DB1;


--4-- drop databases if exists
if exists (select * from sys.databases where name ='DB1')
begin
drop database DB1;
end


--5-- create table in database 
-- Use database that you want to creat table ... like DB1 
USE DB1;
create table Table1 (
 ID int not null primary key,
 Names nvarchar(50) not null,
 Birth date,
);



--6-- drop table .. use database 
USE DB1;
drop table Table1;


--7-- Add column to Table 
alter table Table1
Add Gendore varchar(5)  null;


--8-- rename column in table 
exec sp_rename 'Table1.Gendore','Gender','column';


--9-- rename table int database
exec sp_rename 'Table1','FirstTable';


--10-- Modify column 
alter table Firsttable
alter column Gender nvarchar(10) not null;


--11-- delete column
alter table FirstTable
drop column Gender;


--12-- BackUp database 
backup database DB1
to disk = 'C:\DB1.back';


--13-- Diffrential BackUp
backup database BD1
to disk = 'C:\DB1.back'
with differential;


--14-- Restore database
restore database DB1
from disk = 'C:\DB1.back';


--15-- insert to table 
insert into FirstTable
values 
(1,'ali','1999-6-22','m');



--16-- Update value
update FirstTable
set Names ='zaid'
where ID = 1;


--17-- delete value
delete from FirstTable
where ID=1;


--18-- select into (this copy table compoment and creation new table and put this compoment insid ) 
select * into SecondTable 
from FirstTable;


--19-- insert into (copy values from table to another)
insert into SecondTable
select * from FirstTable;




--20-- auto incrament
create table ThirsdTable(

 ID int identity(1,1)  not null primary key,
 Names nvarchar(50) not null,
 Birth date,

);


--21-- Delete And Truncate
--delete all rows without reset counter identify
delete from FirstTable;
--delete all row with reset counter identify
truncate table FirstTable;



--22-- Foreign key 
-- you must have tow table to create Foreign key

create table Customers (
ID int identity(1,1) primary key not null,
Name nvarchar(50) not null,
Country varchar
);

create table Orders(
Oreder_ID int identity(1,1) primary key not null ,
Customers_ID int references Customers(ID) , --join with Customers ID in Customers Table
Item varchar

);


--23-- select statment 
--select table 
select * from FirstTable;

--select from table
select ID,Names from FirstTable;

--select one column
select * from Names;


--24--select distinct (select all element without repeats)
select distinct from FirstTable;



--25--where statment (and,or,not)

--where
select * from FirstTable
where Gender ='m';

--and
select *from FirstTable
where Gender ='m' and Names = 'ali';

--or
select *from FirstTable
where Names ='ali' or Names ='mohammed';

--not
select * from Firsttable
where not Names = 'ali';



--26--In operator
select * from Firsttable
where Names in ('ali','mohammed','zaid');



--27--Sorting (order by)
select * from FirstTable
order by Names;


--28-- select top statment
select top 5 from FirstTable;
select top 5 percent from FirstTable;



--29-- Select As
select Age = DateDiff(year,Birth,getdate()) from FirstTable;



--30-- Between
select * from FirstTable
where DateDiff(year,Birth,getdate()) between 20 and 40;








--31-- Count,Sum,Avg,Min,Max
Use HR_Database

select TotalCount = Count(MonthlySalary),
       TotalSum = Sum(MonthlySalary),
	   TotalAvg = Avg(MonthlySalary),
	   MinNumber = min(MonthlySalary),
	   MaxNumber = max(MonthlySalary)

	   from Employees;








--32-- Group By
select * from Employees
Order By DepartmentID;









--33-- Having
select DepartmentID, TotalCount=Count(MonthlySalary), 
	   TotalSum=Sum(MonthlySalary),
	   Average=Avg(MonthlySalary),
	   MinSalary=Min(MonthlySalary),
	   MaxSalary=Max(MonthlySalary) 
	   
	   from Employees
       Group By DepartmentID
	  having Count(MonthlySalary) > 100







--34-- Like

select * from Employees;

--Finds any values that start with "a"
select ID, FirstName from Employees
where FirstName like 'a%';

--Finds any values that end with "a"
select ID, FirstName from Employees
where FirstName like '%a';

--Finds any values that have "tell" in any position
select ID, FirstName from Employees
where FirstName like '%tell%';

--	Finds any values that start with "a" and ends with "a"
select ID, FirstName from Employees
where FirstName like 'a%a';

--Finds any values that have "a" in the second position
select ID, FirstName from Employees
where FirstName like '_a%';

--Finds any values that have "a" in the third position
select ID, FirstName from Employees
where FirstName like '__a%';

--Finds any values that start with "a" and are at least 3 characters in length
select ID, FirstName from Employees
where FirstName like 'a__%';

--Finds any values that start with "a" and are at least 4 characters in length
select ID, FirstName from Employees
where FirstName like 'a___%';

--Finds any values that start with "a"
select ID, FirstName from Employees
where FirstName like 'a%' or FirstName like 'b%' ;









--35-- WildCard
Use HR_Database
select FirstName from Employees
where FirstName like  'Harp[ae]r';








--36-- Join 

--(Inner join)
--Use Shop database
use Shop_Database

select Customers.CustomerID,Customers.Name,Orders.Amount 
from Customers
inner join Orders 
on Customers.CustomerID = Orders.CustomerID;

--(Left join)
select Customers.CustomerID,Customers.Name,Orders.Amount 
from Customers
left outer join Orders 
on Customers.CustomerID = Orders.CustomerID;

--(right join)
select Customers.CustomerID,Customers.Name,Orders.Amount 
from Customers
right outer join Orders 
on Customers.CustomerID = Orders.CustomerID;

--(full join)
select Customers.CustomerID,Customers.Name,Orders.Amount 
from Customers
full outer join Orders 
on Customers.CustomerID = Orders.CustomerID;










--37-- view 

create view ActivEmployees as
select * from Employees
where ExitDate is not null;

create view UnActivEmployees as
select * from Employees
where ExitDate is null;













--38--Exists 
select *from Employees E1
where 
Exists(
select top 1 x= 'x' from Employees 
where E1.MonthlySalary = 3000
);







--39-- Union 
select * from ActivEmployees
union
select * from UnActivEmployees






--40-- Case
select FirstName, ManPerson =
case when Gendor ='m' then  'male'
end ,

status = 
case 
when ExitDate is not null then 'Active'
when Exitdate is null then 'Out Of serveces'
end
from Employees;










--41-- default constraint
--on creat table
CREATE TABLE Persons (
   ID int NOT NULL,
   LastName varchar(255) NOT NULL,
   FirstName varchar(255),
   Age int,

   --default value 
   City varchar(255) DEFAULT 'Amman'
);
--on alter table
ALTER TABLE Persons
ADD CONSTRAINT df_City
DEFAULT 'Amman' FOR City;






--42-- chek constraint 

CREATE TABLE Persons2 (
   ID int NOT NULL,
   LastName varchar(255) NOT NULL,
   FirstName varchar(255),
   Age int CHECK (Age>=18)
   --for naming chek constraint use 
--CONSTRAINT CHK_Person CHECK (Age>=18 AND City='Amman')
);






--43-- Unique constraint 
CREATE TABLE Persons3 (
   ID int NOT NULL UNIQUE,
   LastName varchar(255) NOT NULL,
   FirstName varchar(255),
   Age int

   --to naming constraint use
--Constraint Uni-element (LastName)
);






--44-- Index
CREATE INDEX idx_lastname
ON Persons (LastName);



















select *from FirstTable;
select * from SecondTable;


