-- ��������� �����: ��� �������� ��� ����
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

-- ��������� ������: ���� ��� �������� ��� ���� ��� ������ ��������
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

-- ��������� ������: ��� �������� ��� ��� ���� ���� ����
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

-- ��������� ������: ��� ������ �������� �� ��� ������ ������
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

-- ��������� ������: ��� ����� ������� ���� ������ ��� �������� ���� ���� ������
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

-- ��������� ������: ��� ������� ���� ���� ������ ���� ������
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

-- ��������� ������: ��� �������� ��� ����
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

-- ��������� ������: ������� ���� ����� ���� �� 20000 �����
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

-- ��������� ������: ������� ���� ����� ���� �� 20000 ����� �������� HAVING
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

-- ��������� ������: ��� ���� �������� ���� ���� ������� ���� 'B'
SELECT        
    Makes.Make 
FROM            
    Makes
WHERE 
    Makes.Make LIKE 'B%';

---------------------------------------------

-- ��������� ������ ���: ��� ���� �������� ���� ����� ������� ��� ����� 'W'
SELECT        
    Makes.Make 
FROM            
    Makes
WHERE 
    Makes.Make LIKE '%W';

---------------------------------------------

-- ��������� ������ ���: ��� ������� ���� ���� ������ ���� ��� FWD
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

-- ��������� ������ ���: ��� ������� ���� ���� ������ ���� ��� FWD
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

-- ��������� ������ ���: ��� �������� ��� ��� ��� ��� ����
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

-- ��������� ������ ���: ��� ����� �������� ��� ��� ��� ��� ���� �������� ��� ������ �� �����
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

-- ��������� ������ ���: ��� ����� �������� ��� ��� ��� ��� ���� �� ����� ������� ����� ��� �� ���� �� 10,000 �����
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

-- ��������� ������ ���: ��� ������� ���� ��� ����� ��� ����� ���� ��������
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

-- ��������� ������ ���: ��� ���� �������� ���� ��� ����� ��� ����� ����
SELECT * 
FROM 
    VehicleDetails 
WHERE 
    NumDoors IS NULL;

---------------------------------------------

-- ��������� ������ ���: ���� �������� ���� �� ��� ����� ��� ����� ���
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

-- ��������� ������ ���:
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
