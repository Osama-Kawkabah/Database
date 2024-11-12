-- ��� ������� ���� ������ ����� ���� ����� ���� ���� ���� ������.
-- ����� ��� ���� �����ѡ �����ȡ ����� ������� ������ ������.

-- ����� ���������
DECLARE @ReportMonth INT; -- ������ ����� ������� �������
DECLARE @ReportYear INT; -- ������ ����� �������� �������
DECLARE @TotalDays INT; -- ������ ����� ����� ����� �����
DECLARE @EmployeeID INT; -- ������ ���� ������
DECLARE @PresentDays INT; -- ������ ��� ���� ������
DECLARE @AbsentDays INT; -- ������ ��� ���� ������
DECLARE @LeaveDays INT; -- ������ ��� ���� �������

-- ����� ���������
SET @ReportMonth = 7; -- ����� ����� ������� (�����)
SET @ReportYear = 2023; -- ����� ����� �������� (2023)
SET @EmployeeID = 101; -- ����� ���� ������ �������

-- ���� ����� ����� ����� �����
SET @TotalDays = DAY(EOMONTH(DATEFROMPARTS(@ReportYear, @ReportMonth, 1)));
-- EOMONTH ������ ������ ��� ��� ��� �� ����� �����ϡ �� DAY ������ ��� ��� ������ ����� ���� �����.

-- ���� ��� ���� ������
SELECT @PresentDays = COUNT(*)
FROM EmployeeAttendance
WHERE EmployeeID = @EmployeeID 
  AND MONTH(AttendanceDate) = @ReportMonth 
  AND YEAR(AttendanceDate) = @ReportYear 
  AND Status = 'Present';

-- ���� ��� ���� ������
SELECT @AbsentDays = COUNT(*)
FROM EmployeeAttendance
WHERE EmployeeID = @EmployeeID 
  AND MONTH(AttendanceDate) = @ReportMonth 
  AND YEAR(AttendanceDate) = @ReportYear 
  AND Status = 'Absent';

-- ���� ��� ���� �������
SELECT @LeaveDays = COUNT(*)
FROM EmployeeAttendance
WHERE EmployeeID = @EmployeeID 
  AND MONTH(AttendanceDate) = @ReportMonth 
  AND YEAR(AttendanceDate) = @ReportYear 
  AND Status = 'Leave';

-- ����� �������
PRINT 'Employee Attendance Report for Employee ID: ' + CAST(@EmployeeID AS VARCHAR);
PRINT 'Report Month: ' + CAST(@ReportMonth AS VARCHAR) + '/' + CAST(@ReportYear AS VARCHAR);
PRINT 'Total Working Days: ' + CAST(@TotalDays AS VARCHAR);
PRINT 'Days Present: ' + CAST(@PresentDays AS VARCHAR);
PRINT 'Days Absent: ' + CAST(@AbsentDays AS VARCHAR);
PRINT 'Days on Leave: ' + CAST(@LeaveDays AS VARCHAR);
