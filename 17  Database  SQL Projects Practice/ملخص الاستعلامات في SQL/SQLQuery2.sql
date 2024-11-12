-- ��� ���� �������� ����� ����� ���� �� ��� ������
-- ��� ��������� ����� ���� ���� �������� �� ���� �������� ����� ������ ��� �� �� ��� ������
-- �������� ����� ��� ����� ���� �� ��� �������� ����� �������� INNER JOIN
-- ������: �������� INNER JOIN ��� ��� ������ �� ����� ������

SELECT 
    Employees.Name, -- ��� ������
    Employees.ManagerID, -- ���� ������ ����� �������
    Employees.Salary, -- ���� ������
    Managers.Name AS ManagerName -- ��� ������ ���� ����� ��� ������ �� ManagerName
FROM 
    Employees 
INNER JOIN 
    Employees AS Managers -- ����� �� ��� ������ ���� ������ ������ (Managers)
ON 
    Employees.ManagerID = Managers.EmployeeID -- ��� �����: ���� ������ �� ������ ����� ��� �� ����� ���� ������ �� ������ ������

-----------------------------------------------------

-- ��� ���� �������� �� ������� ��� ��� �� ��� ����� ����
-- ��� ��������� ����� ���� ���� �������� �� ���� �������� �� ����� ��� ������ �� ���
-- �������� ����� ��� ����� ���� ���� ����� �� ���� NULL �� ���� ManagerName
-- �������� LEFT JOIN ����� ��� ���� �������� ��� ����� ��� ����� ����

SELECT 
    Employees.Name, -- ��� ������
    Employees.ManagerID, -- ���� ������ ����� �������
    Employees.Salary, -- ���� ������
    Managers.Name AS ManagerName -- ��� ������ ���� ����� ��� ������ �� ManagerName
FROM 
    Employees 
LEFT JOIN 
    Employees AS Managers -- ����� �� ��� ������ ���� ������ ������ (Managers)
ON 
    Employees.ManagerID = Managers.EmployeeID -- ��� �����: ���� ������ �� ������ ����� ��� �� ����� ���� ������ �� ������ ������

-----------------------------------------------------

-- ��� ���� �������� �� ������� ���� ��� ������ ���� ������ ��� �� ��� ����� ����
-- ��� ��������� ����� ���� ���� �������� �� ���� �������� �� ����� ��� ������ �� ���
-- ��� �� ��� ��� ������ ���ѡ ���� ��� ��� ������ ���� ������ �� ���� ManagerName

SELECT 
    Employees.Name, -- ��� ������
    Employees.ManagerID, -- ���� ������ ����� �������
    Employees.Salary, -- ���� ������
    CASE 
        WHEN Managers.Name IS NULL THEN Employees.Name -- ��� �� ��� ���� ���ѡ ��� ��� ��� ������ ���� ������
        ELSE Managers.Name -- ���� ��ߡ ��� ��� ��� ������
    END AS ManagerName -- ��� ������ ���� ������ �� ManagerName
FROM 
    Employees 
LEFT JOIN 
    Employees AS Managers -- ����� �� ��� ������ ���� ������ ������ (Managers)
ON 
    Employees.ManagerID = Managers.EmployeeID -- ��� �����: ���� ������ �� ������ ����� ��� �� ����� ���� ������ �� ������ ������

-----------------------------------------------------

-- ��� ���� �������� ����� ������ ��� ���� 'Mohammed'
-- ��� ��������� ����� ���� ���� �������� �� ���� �������� ����� ����� ���� ���� 'Mohammed'

SELECT 
    Employees.Name, -- ��� ������
    Employees.ManagerID, -- ���� ������ ����� �������
    Employees.Salary, -- ���� ������
    Managers.Name AS ManagerName -- ��� ������ ���� ������ �� ManagerName
FROM 
    Employees 
INNER JOIN 
    Employees AS Managers -- ����� �� ��� ������ ���� ������ ������ (Managers)
ON 
    Employees.ManagerID = Managers.EmployeeID -- ��� �����: ���� ������ �� ������ ����� ��� �� ����� ���� ������ �� ������ ������
WHERE 
    Managers.Name = 'Mohammed' -- ������ �������� ����� ����� ���� ���� 'Mohammed'
