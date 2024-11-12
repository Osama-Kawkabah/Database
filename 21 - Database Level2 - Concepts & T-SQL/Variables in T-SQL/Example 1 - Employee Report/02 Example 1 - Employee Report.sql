USE C21_DB1;

-- ���� 1: ����� ���������
DECLARE @DepartmentID INT; -- ����� ������ ���� �����
DECLARE @StartDate DATE; -- ����� ������ ����� �����
DECLARE @EndDate DATE; -- ����� ������ ����� ��������
DECLARE @TotalEmployees INT; -- ����� ������ ����� ����� ��������
DECLARE @DepartmentName VARCHAR(50); -- ����� ������ ��� �����

-- ���� 2: ����� ���������
SET @DepartmentID = 3; -- ����� ���� ��� ����
SET @StartDate = '2023-01-01'; -- ����� ����� ����� �������
SET @EndDate = '2023-12-31'; -- ����� ����� �������� �������

-- ���� 3: ������� ��� ����� ����� ��� ���� �����
SELECT @DepartmentName = Name FROM Departments WHERE DepartmentID = @DepartmentID;

-- ���� 4: ���� ����� ����� �������� �� ����� ������ ��� ������ �������
SELECT @TotalEmployees = COUNT(*) 
FROM Employees 
WHERE DepartmentID = @DepartmentID 
AND HireDate BETWEEN @StartDate AND @EndDate;

-- ���� 5: ����� �������
PRINT 'Department Report';
PRINT 'Department Name: ' + @DepartmentName;
PRINT 'Reporting Period: ' + CAST(@StartDate AS VARCHAR) + ' to ' + CAST(@EndDate AS VARCHAR);
PRINT 'Total Employees Hired in ' + CAST(YEAR(@StartDate) AS VARCHAR) + ': ' + CAST(@TotalEmployees AS VARCHAR);
