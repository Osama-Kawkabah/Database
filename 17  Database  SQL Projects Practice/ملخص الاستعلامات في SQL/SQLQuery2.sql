-- ÌבÈ ÌדםÚ ÇבדזÙÝםה ÇבÐםה בÏםוד דÏםÑ דÚ ÇÓד ÇבדÏםÑ
-- וÐÇ ÇבÇÓÊÚבÇד ÓםÞזד ÈÌבÈ ÌדםÚ ÇבÈםÇהÇÊ דה ÌÏזב ÇבדזÙÝםה ÇבÐםה םÏםÑוד ÔÎÕ דÇ דÚ ÇÓד ÇבדÏםÑ
-- ÇבדזÙÝםה ÇבÐםה בםÓ בÏםוד דÏםÑ בה םÊד ÇÎÊםÇÑוד בÃההÇ ÇÓÊÎÏדהÇ INNER JOIN
-- דבÇÍÙÉ: ÇÓÊÎÏדהÇ INNER JOIN Úבל הÝÓ ÇבÌÏזב דÚ ÊÓדםÉ דÎÊבÝÉ

SELECT 
    Employees.Name, -- ÇÓד ÇבדזÙÝ
    Employees.ManagerID, -- דÚÑÝ ÇבדÏםÑ ÇבÎÇÕ ÈÇבדזÙÝ
    Employees.Salary, -- ÑÇÊÈ ÇבדזÙÝ
    Managers.Name AS ManagerName -- ÇÓד ÇבדÏםÑ זםÊד ÊÓדםÉ וÐÇ ÇבÚדזÏ ÈÜ ManagerName
FROM 
    Employees 
INNER JOIN 
    Employees AS Managers -- ÇבÑÈØ דÚ הÝÓ ÇבÌÏזב זב‗ה ÈÊÓדםÉ דÎÊבÝÉ (Managers)
ON 
    Employees.ManagerID = Managers.EmployeeID -- ÔÑØ ÇבÑÈØ: דÚÑÝ ÇבדÏםÑ Ýם ÇבÌÏזב ÇבÃזב םÌÈ Ãה םÓÇזם דÚÑÝ ÇבדזÙÝ Ýם ÇבÌÏזב ÇבËÇהם

-----------------------------------------------------

-- ÌבÈ ÌדםÚ ÇבדזÙÝםה דÚ דÏÑÇÆוד ÍÊל זבז בד ם‗ה בÏםוד דÏםÑ
-- וÐÇ ÇבÇÓÊÚבÇד ÓםÞזד ÈÌבÈ ÌדםÚ ÇבÈםÇהÇÊ דה ÌÏזב ÇבדזÙÝםה דÚ ÅÙוÇÑ ÇÓד ÇבדÏםÑ Åה זÌÏ
-- ÇבדזÙÝםה ÇבÐםה בםÓ בÏםוד דÏםÑ ÓםÊד ÚÑÖוד דÚ ÞםדÉ NULL Ýם ÚדזÏ ManagerName
-- ÇÓÊÎÏדהÇ LEFT JOIN בÖדÇה ÌבÈ ÌדםÚ ÇבדזÙÝםה ÍÊל ÇבÐםה בםÓ בÏםוד דÏםÑ

SELECT 
    Employees.Name, -- ÇÓד ÇבדזÙÝ
    Employees.ManagerID, -- דÚÑÝ ÇבדÏםÑ ÇבÎÇÕ ÈÇבדזÙÝ
    Employees.Salary, -- ÑÇÊÈ ÇבדזÙÝ
    Managers.Name AS ManagerName -- ÇÓד ÇבדÏםÑ זםÊד ÊÓדםÉ וÐÇ ÇבÚדזÏ ÈÜ ManagerName
FROM 
    Employees 
LEFT JOIN 
    Employees AS Managers -- ÇבÑÈØ דÚ הÝÓ ÇבÌÏזב זב‗ה ÈÊÓדםÉ דÎÊבÝÉ (Managers)
ON 
    Employees.ManagerID = Managers.EmployeeID -- ÔÑØ ÇבÑÈØ: דÚÑÝ ÇבדÏםÑ Ýם ÇבÌÏזב ÇבÃזב םÌÈ Ãה םÓÇזם דÚÑÝ ÇבדזÙÝ Ýם ÇבÌÏזב ÇבËÇהם

-----------------------------------------------------

-- ÌבÈ ÌדםÚ ÇבדזÙÝםה דÚ דÏÑÇÆוד¡ זÚÑÖ ÇÓד ÇבדזÙÝ ‗ÇÓד ÇבדÏםÑ ÅÐÇ בד ם‗ה בÏםוד דÏםÑ
-- וÐÇ ÇבÇÓÊÚבÇד ÓםÞזד ÈÌבÈ ÌדםÚ ÇבÈםÇהÇÊ דה ÌÏזב ÇבדזÙÝםה דÚ ÅÙוÇÑ ÇÓד ÇבדÏםÑ Åה זÌÏ
-- ÅÐÇ בד ם‗ה בÏל ÇבדזÙÝ דÏםÑ¡ ÓםÊד ÚÑÖ ÇÓד ÇבדזÙÝ ‗ÇÓד ÇבדÏםÑ Ýם ÚדזÏ ManagerName

SELECT 
    Employees.Name, -- ÇÓד ÇבדזÙÝ
    Employees.ManagerID, -- דÚÑÝ ÇבדÏםÑ ÇבÎÇÕ ÈÇבדזÙÝ
    Employees.Salary, -- ÑÇÊÈ ÇבדזÙÝ
    CASE 
        WHEN Managers.Name IS NULL THEN Employees.Name -- ÅÐÇ בד ם‗ה והÇ‗ דÏםÑ¡ םÊד ÚÑÖ ÇÓד ÇבדזÙÝ ‗ÇÓד ÇבדÏםÑ
        ELSE Managers.Name -- ÎבÇÝ Ðב‗¡ םÊד ÚÑÖ ÇÓד ÇבדÏםÑ
    END AS ManagerName -- ÇÓד ÇבדÏםÑ זםÊד ÊÓדםÊו ÈÜ ManagerName
FROM 
    Employees 
LEFT JOIN 
    Employees AS Managers -- ÇבÑÈØ דÚ הÝÓ ÇבÌÏזב זב‗ה ÈÊÓדםÉ דÎÊבÝÉ (Managers)
ON 
    Employees.ManagerID = Managers.EmployeeID -- ÔÑØ ÇבÑÈØ: דÚÑÝ ÇבדÏםÑ Ýם ÇבÌÏזב ÇבÃזב םÌÈ Ãה םÓÇזם דÚÑÝ ÇבדזÙÝ Ýם ÇבÌÏזב ÇבËÇהם

-----------------------------------------------------

-- ÌבÈ ÌדםÚ ÇבדזÙÝםה ÇבÐםה םÏםÑוד ÔÎÕ ÈÇÓד 'Mohammed'
-- וÐÇ ÇבÇÓÊÚבÇד ÓםÞזד ÈÌבÈ ÌדםÚ ÇבÈםÇהÇÊ דה ÌÏזב ÇבדזÙÝםה ÇבÐםה בÏםוד דÏםÑ ÈÇÓד 'Mohammed'

SELECT 
    Employees.Name, -- ÇÓד ÇבדזÙÝ
    Employees.ManagerID, -- דÚÑÝ ÇבדÏםÑ ÇבÎÇÕ ÈÇבדזÙÝ
    Employees.Salary, -- ÑÇÊÈ ÇבדזÙÝ
    Managers.Name AS ManagerName -- ÇÓד ÇבדÏםÑ זםÊד ÊÓדםÊו ÈÜ ManagerName
FROM 
    Employees 
INNER JOIN 
    Employees AS Managers -- ÇבÑÈØ דÚ הÝÓ ÇבÌÏזב זב‗ה ÈÊÓדםÉ דÎÊבÝÉ (Managers)
ON 
    Employees.ManagerID = Managers.EmployeeID -- ÔÑØ ÇבÑÈØ: דÚÑÝ ÇבדÏםÑ Ýם ÇבÌÏזב ÇבÃזב םÌÈ Ãה םÓÇזם דÚÑÝ ÇבדזÙÝ Ýם ÇבÌÏזב ÇבËÇהם
WHERE 
    Managers.Name = 'Mohammed' -- ÇÎÊםÇÑ ÇבדזÙÝםה ÇבÐםה בÏםוד דÏםÑ ÈÇÓד 'Mohammed'
