/*
Level 15 - Database Level 1 - SQL (Concepts and Practice)
*/

--Select Statement
select * from VehicleDetails;
select * from Makes;
select * from MakeModels;
select * from subModels;
select * from DriveTypes;
select * from FuelTypes;
select * from Bodies;

--Select Distinct Statement
select  distinct ModelId from VehicleDetails;

--Where Statement + AND , OR, NOT
select * 
from VehicleDetails
where MakeID = 2;

select * 
from VehicleDetails
where MakeID = 3 and ModelId = 29;

select * 
from VehicleDetails
where MakeID = 3 Or MakeID = 2;

select * 
from VehicleDetails
where Not (MakeID = 3 Or MakeID = 2);

--"In" Operator
select * 
from VehicleDetails
where BodyID in (16, 15,17,57);

--Sorting : Order By
select * 
from VehicleDetails
order by Id;

select * 
from VehicleDetails
order by Id desc;

--Select Top Statement
select top(10) *
from VehicleDetails;

--Select As
select Id as 'VehicleDetailsId', year as 'Made At'
from VehicleDetails;

--Between Operator
select  * 
from VehicleDetails
where year between 1990 and 2000;

--Count, Sum, Avg, Min, Max Functions
select count(*) AS VehicleDetails_Count
from VehicleDetails;

select min(ID)  AS VehicleDetails_min
from VehicleDetails;

select max(ID) AS VehicleDetails_max
from VehicleDetails;

--Group By
select MakeID,  count(*)
from VehicleDetails
group by MakeId
order by MakeID ;

select ModelID, count(*)
from VehicleDetails
group by ModelID ;

--Having
select MakeID, count(*)
from VehicleDetails
group by MakeId
having count(*) between 6 and 8
order by 2;

--Like
select *
from VehicleDetails
where Vehicle_Display_Name like 'AC%'
order by ID;

select *
from VehicleDetails
where Vehicle_Display_Name like 'Acur_ %'
order by ID;


--WildCards
select ID, Vehicle_display_name 
from VehicleDetails
Where Vehicle_display_name like 'Acura RSX 200[36] Base';

--Joins
select m.MakeID, m.Make, v.Engine
from VehicleDetails v
join Makes m
on v.MakeID = m.MakeID
where m.MakeID = 2
order by M.MakeID;

select b.BodyID, b.BodyName, v.NumDoors
from VehicleDetails v
join Bodies b
on v.BodyID = b.BodyID
where  b.BodyID = 2 and v.NumDoors is not null
order by b.BodyID;

--Views
--You can use any qury from the above and make a view :)


--Exists
SELECT ID,Engine
FROM VehicleDetails
WHERE EXISTS (SELECT fueltypeid FROM FuelTypes WHERE  FuelTypes.FuelTypeID = VehicleDetails.FuelTypeID AND fueltypeid  = 1)
order by Id;

--UNION
SELECT Engine FROM VehicleDetails where Id = 1
UNION
SELECT Engine FROM VehicleDetails where Id = 3;

--Case
SELECT Id,
	   MakeId,
	   case when NumDoors is null then 0 else NumDoors end  as 'Number Of Doors'
FROM VehicleDetails
where makeid= 1 or makeid= 4
order by makeid desc;