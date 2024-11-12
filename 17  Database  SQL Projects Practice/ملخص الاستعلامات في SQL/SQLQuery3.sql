-- ������ ��� ���� �������� ���� ����� ��� ������ ���� �� 3 ����� ���� ����� ���
SELECT * 
FROM VehicleDetails
WHERE Engine_Liter_Display > 3 AND NumDoors = 2
ORDER BY VehicleDetails.Engine_Liter_Display ASC; 

-- ������ ��� �������� �������� ��������� ���� ����� ��� "OHV" �� ������ ���� 4 ��������
SELECT Makes.Make, VehicleDetails.*
FROM VehicleDetails
INNER JOIN Makes ON VehicleDetails.MakeID = Makes.MakeID
WHERE VehicleDetails.Engine LIKE '%OHV%' AND VehicleDetails.Engine_Cylinders = 4;

-- ������ ��� ���� �������� ���� �� �� ��� ���� "Sport Utility" ������ ���� �� 2020
SELECT BodyName, VehicleDetails.*
FROM VehicleDetails
INNER JOIN Bodies ON VehicleDetails.BodyID = Bodies.BodyID
WHERE BodyName = 'Sport Utility' AND Year > 2020;

-- ������ ��� ���� �������� ���� ���� ��� ������ "Coupe" �� "Hatchback" �� "Sedan"
SELECT BodyName, VehicleDetails.*
FROM VehicleDetails
INNER JOIN Bodies ON VehicleDetails.BodyID = Bodies.BodyID
WHERE BodyName IN ('Coupe', 'Hatchback', 'Sedan');

-- ������ ��� ���� �������� ���� ���� ��� ������ "Coupe" �� "Hatchback" �� "Sedan" ������ 2008 �� 2020 �� 2021
SELECT BodyName, VehicleDetails.*
FROM VehicleDetails
INNER JOIN Bodies ON VehicleDetails.BodyID = Bodies.BodyID
WHERE BodyName IN ('Coupe', 'Hatchback', 'Sedan') 
AND Year IN (2008, 2020, 2021);

-- ����� ������ 1 ��� ���� ���� �� ����� �� ������� �� ��� 1950
SELECT found = 1 
WHERE EXISTS (SELECT TOP 1 * FROM VehicleDetails WHERE Year = 1950);

-- ������ ��� ��� ������� ���� ������� ������ ���� ������ ��� �������
SELECT VehicleDetails.Vehicle_Display_Name, NumDoors,
    CASE
        WHEN NumDoors = 0 THEN 'Zero doors'
        WHEN NumDoors = 1 THEN 'One doors'
        WHEN NumDoors = 2 THEN 'Two doors'
        WHEN NumDoors = 3 THEN 'Three doors'
        WHEN NumDoors = 4 THEN 'Four doors'
        WHEN NumDoors = 5 THEN 'Five doors'
        WHEN NumDoors = 6 THEN 'Six doors'
        WHEN NumDoors = 8 THEN 'Eight doors'
        WHEN NumDoors IS NULL THEN 'Not Set'
        ELSE 'Unknown'
    END AS DOOR_Display
FROM VehicleDetails;

-- ������ ��� ��� ������� ������ ������ ���� ����� ��� ������� �� ����� ������� ��� ����� ��������
SELECT VehicleDetails.Vehicle_Display_Name, Year, Age = YEAR(GETDATE()) - VehicleDetails.Year
FROM VehicleDetails
ORDER BY Age DESC;

-- ������ ��� ��� ������� ������ ������ �������� ���� ������ ����� ��� 15 � 25 ���
SELECT *
FROM (
    SELECT VehicleDetails.Vehicle_Display_Name, Year, Age = YEAR(GETDATE()) - VehicleDetails.Year
    FROM VehicleDetails
) R1
WHERE Age BETWEEN 15 AND 25;

-- ������ ��� ���� ������ ������� �������� ���� ������ ����� ��������
SELECT MIN(Engine_CC) AS MinimumEngineCC, 
       MAX(Engine_CC) AS MaximumEngineCC, 
       AVG(Engine_CC) AS AverageEngineCC
FROM VehicleDetails;

-- ������ ��� ����� �������� ���� ����� ��� ��� ��� ����
SELECT VehicleDetails.Vehicle_Display_Name
FROM VehicleDetails
WHERE Engine_CC = (SELECT MIN(Engine_CC) FROM VehicleDetails);

-- ������ ��� ����� �������� ���� ����� ��� ���� ��� ����
SELECT VehicleDetails.Vehicle_Display_Name
FROM VehicleDetails
WHERE Engine_CC = (SELECT MAX(Engine_CC) FROM VehicleDetails);

-- ������ ��� ����� �������� ���� ����� ��� ��� ���� ��� �� �������
SELECT VehicleDetails.Vehicle_Display_Name
FROM VehicleDetails
WHERE Engine_CC < (SELECT AVG(Engine_CC) FROM VehicleDetails);

-- ������ ��� ������ ��� �������� ���� ����� ��� ��� ���� ���� �� �������
SELECT COUNT(*) AS NumberOfVehiclesAboveAverageEngineCC
FROM (
    SELECT ID, VehicleDetails.Vehicle_Display_Name
    FROM VehicleDetails
    WHERE Engine_CC > (SELECT AVG(Engine_CC) FROM VehicleDetails)
) R1;

-- ������ ��� ���� ����� ������� ���� ������ �������� ��������
SELECT DISTINCT Engine_CC 
FROM VehicleDetails
ORDER BY Engine_CC DESC;

-- ������ ��� ���� 3 ��� ���� ������
SELECT DISTINCT TOP 3 Engine_CC 
FROM VehicleDetails
ORDER BY Engine_CC DESC;

-- ������ ��� ���� �������� ���� ����� ��� ����� �� ���� 3 ��� ���� ������
SELECT Vehicle_Display_Name 
FROM VehicleDetails
WHERE Engine_CC IN (
    SELECT DISTINCT TOP 3 Engine_CC 
    FROM VehicleDetails
    ORDER BY Engine_CC DESC
);

-- ������ ��� ���� �������� �������� ���� ���� ������ ����� ��� ����� �� ���� 3 ��� ���� ������
SELECT DISTINCT Makes.Make
FROM VehicleDetails 
INNER JOIN Makes ON VehicleDetails.MakeID = Makes.MakeID
WHERE VehicleDetails.Engine_CC IN (
    SELECT DISTINCT TOP 3 Engine_CC 
    FROM VehicleDetails
    ORDER BY Engine_CC DESC
)
ORDER BY Makes.Make;

-- ������ ��� ���� ����� ��� ��� ����� ���� ������ ����� ������� ��� ��� ���� �������:
-- 0 ��� 1000 ������� = 100
-- 1001 ��� 2000 ������� = 200
-- 2001 ��� 4000 ������� = 300
-- 4001 ��� 6000 ������� = 400
-- 6001 ��� 8000 ������� = 500
-- ���� �� 8000 ������� = 600
-- ����� ��� ������� = 0
SELECT Engine_CC,
    CASE
        WHEN Engine_CC BETWEEN 0 AND 1000 THEN 100
        WHEN Engine_CC BETWEEN 1001 AND 2000 THEN 200
        WHEN Engine_CC BETWEEN 2001 AND 4000 THEN 300
        WHEN Engine_CC BETWEEN 4001 AND 6000 THEN 400
        WHEN Engine_CC BETWEEN 6001 AND 8000 THEN 500
        WHEN Engine_CC > 8000 THEN 600    
        ELSE 0
    END AS Tax
FROM (
    SELECT DISTINCT Engine_CC FROM VehicleDetails
) R1
ORDER BY Engine_CC;

-- ������ ��� ������� �������� ������� ��� ������� ������� ��� ����� ������
SELECT Makes.Make, SUM(VehicleDetails.NumDoors) AS TotalNumberOfDoors
FROM VehicleDetails 
INNER JOIN Makes 
ON VehicleDetails.MakeID = Makes.MakeID
GROUP BY Makes.Make
ORDER BY TotalNumberOfDoors DESC;


-- Get Total Number Of Doors Manufactured by 'Ford'
SELECT        Makes.Make, Sum(VehicleDetails.NumDoors) AS TotalNumberOfDoors
FROM            VehicleDetails INNER JOIN
Makes ON VehicleDetails.MakeID = Makes.MakeID
Group By Make
Having Make = 'Ford'

-- Get Number of Models Per Make
SELECT Makes.Make, COUNT(*) AS NumberOfModels
FROM  Makes INNER JOIN
MakeModels ON Makes.MakeID = MakeModels.MakeID
GROUP BY Makes.Make
Order By NumberOfModels Desc

-- Get the highest 3 manufacturers that make the highest number of models
SELECT top 3  Makes.Make, COUNT(*) AS NumberOfModels
FROM Makes INNER JOIN
 MakeModels ON Makes.MakeID = MakeModels.MakeID
GROUP BY Makes.Make
Order By NumberOfModels Desc

-- Get the highest number of models manufactured
select Max(NumberOfModels) as MaxNumberOfModels
from
(
SELECT Makes.Make, COUNT(*) AS NumberOfModels
FROM  Makes INNER JOIN
MakeModels ON Makes.MakeID = MakeModels.MakeID
GROUP BY Makes.Make
) R1


SELECT Makes.MaxNumberOfModels FROM (
select Max(NumberOfModels) as MaxNumberOfModels
from
(
SELECT Makes.Make, COUNT(*) AS NumberOfModels
FROM  Makes INNER JOIN
MakeModels ON Makes.MakeID = MakeModels.MakeID
GROUP BY Makes.Make
) R1

)Makes


-- Get the highest Manufacturers manufactured the highest number of models , 
-- remember that they could be more than one manufacturer have the same high number of models

