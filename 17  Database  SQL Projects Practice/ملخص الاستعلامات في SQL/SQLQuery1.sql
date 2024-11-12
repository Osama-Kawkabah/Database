-- ÇáÇÓÊÚáÇã ÇáÃæá: ÚÏÏ ÇáãÑßÈÇÊ áßá ÔÑßÉ
SELECT 
    Makes.Make, 
    COUNT(*) AS NumberOfVehicle
FROM 
    VehicleDetails
INNER JOIN
    Makes
ON 
    VehicleDetails.MakeID = Makes.MakeID
WHERE 
    VehicleDetails.Year BETWEEN 1950 AND 2000
GROUP BY 
    Makes.Make
ORDER BY  
    NumberOfVehicle DESC;

---------------------------------------------

-- ÇáÇÓÊÚáÇã ÇáËÇäí: äÓÈÉ ÚÏÏ ÇáãÑßÈÇÊ áßá ÔÑßÉ Åáì ÅÌãÇáí ÇáãÑßÈÇÊ
SELECT 
    *, 
    CAST(NumberOfVehicle AS FLOAT) / CAST(TotalVehicle AS FLOAT) AS Perc  
FROM (
    SELECT 
        Makes.Make, 
        COUNT(*) AS NumberOfVehicle,
        (SELECT COUNT(*) FROM VehicleDetails) AS TotalVehicle
    FROM 
        VehicleDetails
    INNER JOIN
        Makes ON VehicleDetails.MakeID = Makes.MakeID
    WHERE 
        VehicleDetails.Year BETWEEN 1950 AND 2000
    GROUP BY 
        Makes.Make
) R1
ORDER BY  
    NumberOfVehicle DESC;

---------------------------------------------

-- ÇáÇÓÊÚáÇã ÇáËÇáË: ÚÏÏ ÇáãÑßÈÇÊ áßá äæÚ æŞæÏ æáßá ÔÑßÉ
SELECT 
    Makes.Make, 
    FuelTypes.FuelTypeName,
    COUNT(*) AS NumberOfVehicle
FROM   
    VehicleDetails
INNER JOIN
    Makes ON VehicleDetails.MakeID = Makes.MakeID
INNER JOIN
    FuelTypes ON VehicleDetails.FuelTypeID = FuelTypes.FuelTypeID
GROUP BY 
    Makes.Make, 
    FuelTypes.FuelTypeName
ORDER BY 
    Makes.Make ASC;

---------------------------------------------

-- ÇáÇÓÊÚáÇã ÇáÑÇÈÚ: ÌáÈ ÊİÇÕíá ÇáãÑßÈÇÊ ãÚ äæÚ ÇáæŞæÏ ÇáãÍÏÏ
SELECT 
    VehicleDetails.*, 
    FuelTypes.FuelTypeName
FROM 
    VehicleDetails
INNER JOIN 
    FuelTypes ON VehicleDetails.FuelTypeID = FuelTypes.FuelTypeID
WHERE  
    FuelTypes.FuelTypeName = N'GAS';

---------------------------------------------

-- ÇáÇÓÊÚáÇã ÇáÎÇãÓ: ÌáÈ ÃÓãÇÁ ÇáÔÑßÇÊ æäæÚ ÇáæŞæÏ İŞØ ááãÑßÈÇÊ ÇáÊí ÊÚãá ÈÇáÛÇÒ
SELECT DISTINCT
    Makes.Make, 
    FuelTypes.FuelTypeName
FROM 
    VehicleDetails
INNER JOIN 
    FuelTypes ON VehicleDetails.FuelTypeID = FuelTypes.FuelTypeID
INNER JOIN 
    Makes ON VehicleDetails.MakeID = Makes.MakeID
WHERE 
    FuelTypes.FuelTypeName = N'GAS';

---------------------------------------------

-- ÇáÇÓÊÚáÇã ÇáÓÇÏÓ: ÚÏÏ ÇáÔÑßÇÊ ÇáÊí ÊÕäÚ ãÑßÈÇÊ ÊÚãá ÈÇáÛÇÒ
SELECT COUNT(*) AS TotalMarksRunsGas 
FROM (
    SELECT DISTINCT
        Makes.Make, 
        FuelTypes.FuelTypeName
    FROM 
        VehicleDetails
    INNER JOIN 
        FuelTypes ON VehicleDetails.FuelTypeID = FuelTypes.FuelTypeID
    INNER JOIN 
        Makes ON VehicleDetails.MakeID = Makes.MakeID
    WHERE 
        FuelTypes.FuelTypeName = N'GAS'
) R1;

---------------------------------------------

-- ÇáÇÓÊÚáÇã ÇáÓÇÈÚ: ÚÏÏ ÇáãÑßÈÇÊ áßá ÔÑßÉ
SELECT DISTINCT 
    Makes.Make, 
    COUNT(*) AS NumberOfVehicles
FROM   
    VehicleDetails 
INNER JOIN
    Makes ON VehicleDetails.MakeID = Makes.MakeID
GROUP BY 
    Makes.Make
ORDER BY 
    NumberOfVehicles DESC;

---------------------------------------------

-- ÇáÇÓÊÚáÇã ÇáËÇãä: ÇáÔÑßÇÊ ÇáÊí áÏíåÇ ÃßËÑ ãä 20000 ãÑßÈÉ
SELECT * 
FROM (
    SELECT DISTINCT 
        Makes.Make, 
        COUNT(*) AS NumberOfVehicles
    FROM   
        VehicleDetails 
    INNER JOIN
        Makes ON VehicleDetails.MakeID = Makes.MakeID
    GROUP BY 
        Makes.Make
) R1
WHERE 
    NumberOfVehicles > 20000
ORDER BY 
    NumberOfVehicles DESC;

---------------------------------------------

-- ÇáÇÓÊÚáÇã ÇáÊÇÓÚ: ÇáÔÑßÇÊ ÇáÊí áÏíåÇ ÃßËÑ ãä 20000 ãÑßÈÉ ÈÇÓÊÎÏÇã HAVING
SELECT DISTINCT 
    Makes.Make, 
    COUNT(*) AS NumberOfVehicles
FROM   
    VehicleDetails 
INNER JOIN
    Makes ON VehicleDetails.MakeID = Makes.MakeID
GROUP BY 
    Makes.Make
HAVING 
    COUNT(*) > 20000
ORDER BY 
    NumberOfVehicles DESC;

---------------------------------------------

-- ÇáÇÓÊÚáÇã ÇáÚÇÔÑ: ÌáÈ ÌãíÚ ÇáãÑßÈÇÊ ÇáÊí ÊÈÏÃ ÃÓãÇÄåÇ ÈÍÑİ 'B'
SELECT        
    Makes.Make 
FROM            
    Makes
WHERE 
    Makes.Make LIKE 'B%';

---------------------------------------------

-- ÇáÇÓÊÚáÇã ÇáÍÇÏí ÚÔÑ: ÌáÈ ÌãíÚ ÇáãÑßÈÇÊ ÇáÊí ÊÍÊæí ÃÓãÇÄåÇ Úáì ÇáÍÑİ 'W'
SELECT        
    Makes.Make 
FROM            
    Makes
WHERE 
    Makes.Make LIKE '%W';

---------------------------------------------

-- ÇáÇÓÊÚáÇã ÇáËÇäí ÚÔÑ: ÌáÈ ÇáÔÑßÇÊ ÇáÊí ÊÕäÚ ãÑßÈÇÊ ÈÏİÚ äæÚ FWD
SELECT DISTINCT 
    Makes.Make, 
    DriveTypes.DriveTypeName
FROM  
    DriveTypes 
INNER JOIN
    VehicleDetails ON DriveTypes.DriveTypeID = VehicleDetails.DriveTypeID
INNER JOIN
    Makes ON VehicleDetails.MakeID = Makes.MakeID
WHERE 
    DriveTypes.DriveTypeName ='FWD';

---------------------------------------------

-- ÇáÇÓÊÚáÇã ÇáËÇáË ÚÔÑ: ÚÏÏ ÇáÔÑßÇÊ ÇáÊí ÊÕäÚ ãÑßÈÇÊ ÈÏİÚ äæÚ FWD
SELECT COUNT(*) AS DriveTypeName 
FROM (
    SELECT DISTINCT 
        Makes.Make, 
        DriveTypes.DriveTypeName
    FROM  
        DriveTypes 
    INNER JOIN
        VehicleDetails ON DriveTypes.DriveTypeID = VehicleDetails.DriveTypeID
    INNER JOIN
        Makes ON VehicleDetails.MakeID = Makes.MakeID
    WHERE 
        DriveTypes.DriveTypeName ='FWD'
) R2;

---------------------------------------------

-- ÇáÇÓÊÚáÇã ÇáÑÇÈÚ ÚÔÑ: ÚÏÏ ÇáãÑßÈÇÊ áßá äæÚ ÏİÚ áßá ÔÑßÉ
SELECT DISTINCT 
    Makes.Make,
    DriveTypes.DriveTypeName,
    COUNT(*) AS Total
FROM  
    DriveTypes 
INNER JOIN
    VehicleDetails ON DriveTypes.DriveTypeID = VehicleDetails.DriveTypeID
INNER JOIN
    Makes ON VehicleDetails.MakeID = Makes.MakeID
GROUP BY  
    Makes.Make,
    DriveTypes.DriveTypeName
ORDER BY 
    Make ASC, 
    Total DESC;

---------------------------------------------

-- ÇáÇÓÊÚáÇã ÇáÎÇãÓ ÚÔÑ: ÌáÈ ãÌãæÚ ÇáãÑßÈÇÊ áßá äæÚ ÏİÚ áßá ÔÑßÉ æÊÑÊíÈåÇ ÍÓÈ ÇáÔÑßÉ Ëã ÇáÚÏÏ
SELECT DISTINCT 
    Makes.Make,
    DriveTypes.DriveTypeName,
    COUNT(*) AS Total
FROM 
    DriveTypes 
INNER JOIN
    VehicleDetails ON DriveTypes.DriveTypeID = VehicleDetails.DriveTypeID 
INNER JOIN
    Makes ON VehicleDetails.MakeID = Makes.MakeID
GROUP BY 
    Makes.Make, 
    DriveTypes.DriveTypeName
ORDER BY 
    Makes.Make ASC, 
    Total DESC;

---------------------------------------------

-- ÇáÇÓÊÚáÇã ÇáÓÇÏÓ ÚÔÑ: ÌáÈ ãÌãæÚ ÇáãÑßÈÇÊ áßá äæÚ ÏİÚ áßá ÔÑßÉ ãÚ İáÊÑÉ ÇáäÊÇÆÌ áÊÔãá İŞØ ãÇ íÒíÏ Úä 10,000 ãÑßÈÉ
SELECT DISTINCT 
    Makes.Make, 
    DriveTypes.DriveTypeName, 
    COUNT(*) AS Total
FROM 
    DriveTypes 
INNER JOIN
    VehicleDetails ON DriveTypes.DriveTypeID = VehicleDetails.DriveTypeID 
INNER JOIN
    Makes ON VehicleDetails.MakeID = Makes.MakeID
GROUP BY 
    Makes.Make, 
    DriveTypes.DriveTypeName
HAVING 
    COUNT(*) > 10000
ORDER BY 
    Make ASC, 
    Total DESC;

---------------------------------------------

-- ÇáÇÓÊÚáÇã ÇáÓÇÈÚ ÚÔÑ: ÌáÈ ÇáÔÑßÇÊ ÇáÊí áíÓ áÏíåÇ ÚÏÏ ÃÈæÇÈ ãÍÏÏ ááãÑßÈÇÊ
SELECT DISTINCT 
    Makes.Make, 
    VehicleDetails.NumDoors
FROM   
    VehicleDetails 
INNER JOIN
    Makes ON VehicleDetails.MakeID = Makes.MakeID
WHERE 
    NumDoors IS NULL;

---------------------------------------------

-- ÇáÇÓÊÚáÇã ÇáËÇãä ÚÔÑ: ÌáÈ ÌãíÚ ÇáãÑßÈÇÊ ÇáÊí áíÓ áÏíåÇ ÚÏÏ ÃÈæÇÈ ãÍÏÏ
SELECT * 
FROM 
    VehicleDetails 
WHERE 
    NumDoors IS NULL;

---------------------------------------------

-- ÇáÇÓÊÚáÇã ÇáÊÇÓÚ ÚÔÑ: äÓÈÉ ÇáãÑßÈÇÊ ÇáÊí áã íÊã ÊÍÏíÏ ÚÏÏ ÃÈæÇÈ áåÇ
SELECT 
	(
		CAST((SELECT COUNT(*) AS TotalWithNoSpecifiedDoors 
              FROM VehicleDetails
		      WHERE NumDoors IS NULL) AS FLOAT)
		/
		CAST((SELECT COUNT(*) 
              FROM VehicleDetails) AS FLOAT)
	) AS PercOfNoSpecifiedDoors;

---------------------------------------------

-- ÇáÇÓÊÚáÇã ÇáÚÇÔÑ ÚÔÑ:
-- Get MakeID , Make, SubModelName for all vehicles that have SubModelName 'Elite'

SELECT distinct VehicleDetails.MakeID, Makes.Make, SubModelName
FROM VehicleDetails 
INNER JOIN
SubModels 
ON VehicleDetails.SubModelID = SubModels.SubModelID 
INNER JOIN
Makes 
ON VehicleDetails.MakeID = Makes.MakeID
where SubModelName='Elite'
