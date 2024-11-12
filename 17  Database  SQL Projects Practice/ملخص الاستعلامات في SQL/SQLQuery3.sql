-- ÇáÍÕæá Úáì ÌãíÚ ÇáÓíÇÑÇÊ ÇáÊí ÊÍÊæí Úáì ãÍÑßÇÊ ÃßÈÑ ãä 3 áÊÑÇÊ æáåÇ ÈÇÈÇä İŞØ
SELECT * 
FROM VehicleDetails
WHERE Engine_Liter_Display > 3 AND NumDoors = 2
ORDER BY VehicleDetails.Engine_Liter_Display ASC; 

-- ÇáÍÕæá Úáì ÇáÚáÇãÇÊ ÇáÊÌÇÑíÉ æÇáãÑßÈÇÊ ÇáÊí ÊÍÊæí Úáì "OHV" İí ÇáãÍÑß æáåÇ 4 ÃÓØæÇäÇÊ
SELECT Makes.Make, VehicleDetails.*
FROM VehicleDetails
INNER JOIN Makes ON VehicleDetails.MakeID = Makes.MakeID
WHERE VehicleDetails.Engine LIKE '%OHV%' AND VehicleDetails.Engine_Cylinders = 4;

-- ÇáÍÕæá Úáì ÌãíÚ ÇáÓíÇÑÇÊ ÇáÊí åí ãä äæÚ åíßá "Sport Utility" æÓäÊåÇ ÃßÈÑ ãä 2020
SELECT BodyName, VehicleDetails.*
FROM VehicleDetails
INNER JOIN Bodies ON VehicleDetails.BodyID = Bodies.BodyID
WHERE BodyName = 'Sport Utility' AND Year > 2020;

-- ÇáÍÕæá Úáì ÌãíÚ ÇáÓíÇÑÇÊ ÇáÊí íßæä äæÚ åíßáåÇ "Coupe" Ãæ "Hatchback" Ãæ "Sedan"
SELECT BodyName, VehicleDetails.*
FROM VehicleDetails
INNER JOIN Bodies ON VehicleDetails.BodyID = Bodies.BodyID
WHERE BodyName IN ('Coupe', 'Hatchback', 'Sedan');

-- ÇáÍÕæá Úáì ÌãíÚ ÇáÓíÇÑÇÊ ÇáÊí íßæä äæÚ åíßáåÇ "Coupe" Ãæ "Hatchback" Ãæ "Sedan" æÓäÊåÇ 2008 Ãæ 2020 Ãæ 2021
SELECT BodyName, VehicleDetails.*
FROM VehicleDetails
INNER JOIN Bodies ON VehicleDetails.BodyID = Bodies.BodyID
WHERE BodyName IN ('Coupe', 'Hatchback', 'Sedan') 
AND Year IN (2008, 2020, 2021);

-- ÅÑÌÇÚ ÇáŞíãÉ 1 ÅĞÇ ßÇäÊ åäÇß Ãí ÓíÇÑÉ Êã ÊÕäíÚåÇ İí ÚÇã 1950
SELECT found = 1 
WHERE EXISTS (SELECT TOP 1 * FROM VehicleDetails WHERE Year = 1950);

-- ÇáÍÕæá Úáì ÇÓã ÇáÓíÇÑÉ æÚÏÏ ÇáÃÈæÇÈ æÅÖÇİÉ ÚãæÏ áÊÕäíİ ÚÏÏ ÇáÃÈæÇÈ
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

-- ÇáÍÕæá Úáì ÇÓã ÇáÓíÇÑÉ æÓäÊåÇ æÅÖÇİÉ ÚãæÏ áÍÓÇÈ ÚãÑ ÇáÓíÇÑÉ Ëã ÊÑÊíÈ ÇáäÊÇÆÌ ÍÓÈ ÇáÚãÑ ÊäÇÒáíğÇ
SELECT VehicleDetails.Vehicle_Display_Name, Year, Age = YEAR(GETDATE()) - VehicleDetails.Year
FROM VehicleDetails
ORDER BY Age DESC;

-- ÇáÍÕæá Úáì ÇÓã ÇáÓíÇÑÉ æÓäÊåÇ æÚãÑåÇ ááÓíÇÑÇÊ ÇáÊí íÊÑÇæÍ ÚãÑåÇ Èíä 15 æ 25 ÓäÉ
SELECT *
FROM (
    SELECT VehicleDetails.Vehicle_Display_Name, Year, Age = YEAR(GETDATE()) - VehicleDetails.Year
    FROM VehicleDetails
) R1
WHERE Age BETWEEN 15 AND 25;

-- ÇáÍÕæá Úáì ÇáÍÏ ÇáÃÏäì æÇáÃŞÕì æÇáãÊæÓØ áÓÚÉ ÇáãÍÑß áÌãíÚ ÇáÓíÇÑÇÊ
SELECT MIN(Engine_CC) AS MinimumEngineCC, 
       MAX(Engine_CC) AS MaximumEngineCC, 
       AVG(Engine_CC) AS AverageEngineCC
FROM VehicleDetails;

-- ÇáÍÕæá Úáì ÃÓãÇÁ ÇáÓíÇÑÇÊ ÇáÊí ÊÍÊæí Úáì ÃŞá ÓÚÉ ãÍÑß
SELECT VehicleDetails.Vehicle_Display_Name
FROM VehicleDetails
WHERE Engine_CC = (SELECT MIN(Engine_CC) FROM VehicleDetails);

-- ÇáÍÕæá Úáì ÃÓãÇÁ ÇáÓíÇÑÇÊ ÇáÊí ÊÍÊæí Úáì ÃÚáì ÓÚÉ ãÍÑß
SELECT VehicleDetails.Vehicle_Display_Name
FROM VehicleDetails
WHERE Engine_CC = (SELECT MAX(Engine_CC) FROM VehicleDetails);

-- ÇáÍÕæá Úáì ÃÓãÇÁ ÇáÓíÇÑÇÊ ÇáÊí ÊÍÊæí Úáì ÓÚÉ ãÍÑß ÃŞá ãä ÇáãÊæÓØ
SELECT VehicleDetails.Vehicle_Display_Name
FROM VehicleDetails
WHERE Engine_CC < (SELECT AVG(Engine_CC) FROM VehicleDetails);

-- ÇáÍÕæá Úáì ÅÌãÇáí ÚÏÏ ÇáÓíÇÑÇÊ ÇáÊí ÊÍÊæí Úáì ÓÚÉ ãÍÑß ÃÚáì ãä ÇáãÊæÓØ
SELECT COUNT(*) AS NumberOfVehiclesAboveAverageEngineCC
FROM (
    SELECT ID, VehicleDetails.Vehicle_Display_Name
    FROM VehicleDetails
    WHERE Engine_CC > (SELECT AVG(Engine_CC) FROM VehicleDetails)
) R1;

-- ÇáÍÕæá Úáì ÌãíÚ ÇáŞíã ÇáİÑíÏÉ áÓÚÉ ÇáãÍÑß æÊÑÊíÈåÇ ÊäÇÒáíğÇ
SELECT DISTINCT Engine_CC 
FROM VehicleDetails
ORDER BY Engine_CC DESC;

-- ÇáÍÕæá Úáì ÃÚáì 3 Şíã áÓÚÉ ÇáãÍÑß
SELECT DISTINCT TOP 3 Engine_CC 
FROM VehicleDetails
ORDER BY Engine_CC DESC;

-- ÇáÍÕæá Úáì ÌãíÚ ÇáÓíÇÑÇÊ ÇáÊí ÊÍÊæí Úáì æÇÍÏÉ ãä ÃÚáì 3 Şíã áÓÚÉ ÇáãÍÑß
SELECT Vehicle_Display_Name 
FROM VehicleDetails
WHERE Engine_CC IN (
    SELECT DISTINCT TOP 3 Engine_CC 
    FROM VehicleDetails
    ORDER BY Engine_CC DESC
);

-- ÇáÍÕæá Úáì ÌãíÚ ÇáÚáÇãÇÊ ÇáÊÌÇÑíÉ ÇáÊí ÊÕäÚ ÓíÇÑÇÊ ÊÍÊæí Úáì æÇÍÏÉ ãä ÃÚáì 3 Şíã áÓÚÉ ÇáãÍÑß
SELECT DISTINCT Makes.Make
FROM VehicleDetails 
INNER JOIN Makes ON VehicleDetails.MakeID = Makes.MakeID
WHERE VehicleDetails.Engine_CC IN (
    SELECT DISTINCT TOP 3 Engine_CC 
    FROM VehicleDetails
    ORDER BY Engine_CC DESC
)
ORDER BY Makes.Make;

-- ÇáÍÕæá Úáì ÌÏæá íÍÊæí Úáì Şíã İÑíÏÉ áÓÚÉ ÇáãÍÑß æÍÓÇÈ ÇáÖÑíÈÉ áßá ÓÚÉ ãÍÑß ßÇáÊÇáí:
-- 0 Åáì 1000 ÇáÖÑíÈÉ = 100
-- 1001 Åáì 2000 ÇáÖÑíÈÉ = 200
-- 2001 Åáì 4000 ÇáÖÑíÈÉ = 300
-- 4001 Åáì 6000 ÇáÖÑíÈÉ = 400
-- 6001 Åáì 8000 ÇáÖÑíÈÉ = 500
-- ÃßËÑ ãä 8000 ÇáÖÑíÈÉ = 600
-- ÈÎáÇİ Ğáß ÇáÖÑíÈÉ = 0
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

-- ÇáÍÕæá Úáì ÇáÚáÇãÉ ÇáÊÌÇÑíÉ æÅÌãÇáí ÚÏÏ ÇáÃÈæÇÈ ÇáãÕäÚÉ áßá ÚáÇãÉ ÊÌÇÑíÉ
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

