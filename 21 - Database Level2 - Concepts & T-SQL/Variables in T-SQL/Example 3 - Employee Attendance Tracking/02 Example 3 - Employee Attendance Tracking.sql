-- åĞÇ ÇáÓßÑÈÊ íŞæã ÈÅäÔÇÁ ÊŞÑíÑ ÍÖæÑ áãæÙİ ãÚíä áÔåÑ æÓäÉ ãÍÏÏíä.
-- íÊÊÈÚ ÚÏÏ ÃíÇã ÇáÍÖæÑ¡ ÇáÛíÇÈ¡ æÃíÇã ÇáÅÌÇÒÉ ááãæÙİ ÇáãÍÏÏ.

-- ÅÚáÇä ÇáãÊÛíÑÇÊ
DECLARE @ReportMonth INT; -- áÊÎÒíä ÇáÔåÑ ÇáãØáæÈ ááÊŞÑíÑ
DECLARE @ReportYear INT; -- áÊÎÒíä ÇáÓäÉ ÇáãØáæÈÉ ááÊŞÑíÑ
DECLARE @TotalDays INT; -- áÊÎÒíä ÇáÚÏÏ Çáßáí áÃíÇã ÇáÔåÑ
DECLARE @EmployeeID INT; -- áÊÍÏíÏ åæíÉ ÇáãæÙİ
DECLARE @PresentDays INT; -- áÊÎÒíä ÚÏÏ ÃíÇã ÇáÍÖæÑ
DECLARE @AbsentDays INT; -- áÊÎÒíä ÚÏÏ ÃíÇã ÇáÛíÇÈ
DECLARE @LeaveDays INT; -- áÊÎÒíä ÚÏÏ ÃíÇã ÇáÅÌÇÒÉ

-- ÊåíÆÉ ÇáãÊÛíÑÇÊ
SET @ReportMonth = 7; -- ÊÚííä ÇáÔåÑ ÇáãØáæÈ (íæáíæ)
SET @ReportYear = 2023; -- ÊÚííä ÇáÓäÉ ÇáãØáæÈÉ (2023)
SET @EmployeeID = 101; -- ÊÚííä åæíÉ ÇáãæÙİ ááÊŞÑíÑ

-- ÍÓÇÈ ÇáÚÏÏ Çáßáí áÃíÇã ÇáÔåÑ
SET @TotalDays = DAY(EOMONTH(DATEFROMPARTS(@ReportYear, @ReportMonth, 1)));
-- EOMONTH íÓÊÎÏã ááÍÕæá Úáì ÂÎÑ íæã İí ÇáÔåÑ ÇáãÍÏÏ¡ Ëã DAY ááÍÕæá Úáì ÚÏÏ ÇáÃíÇã Çáßáí áåĞÇ ÇáÔåÑ.

-- ÍÓÇÈ ÚÏÏ ÃíÇã ÇáÍÖæÑ
SELECT @PresentDays = COUNT(*)
FROM EmployeeAttendance
WHERE EmployeeID = @EmployeeID 
  AND MONTH(AttendanceDate) = @ReportMonth 
  AND YEAR(AttendanceDate) = @ReportYear 
  AND Status = 'Present';

-- ÍÓÇÈ ÚÏÏ ÃíÇã ÇáÛíÇÈ
SELECT @AbsentDays = COUNT(*)
FROM EmployeeAttendance
WHERE EmployeeID = @EmployeeID 
  AND MONTH(AttendanceDate) = @ReportMonth 
  AND YEAR(AttendanceDate) = @ReportYear 
  AND Status = 'Absent';

-- ÍÓÇÈ ÚÏÏ ÃíÇã ÇáÅÌÇÒÉ
SELECT @LeaveDays = COUNT(*)
FROM EmployeeAttendance
WHERE EmployeeID = @EmployeeID 
  AND MONTH(AttendanceDate) = @ReportMonth 
  AND YEAR(AttendanceDate) = @ReportYear 
  AND Status = 'Leave';

-- ØÈÇÚÉ ÇáÊŞÑíÑ
PRINT 'Employee Attendance Report for Employee ID: ' + CAST(@EmployeeID AS VARCHAR);
PRINT 'Report Month: ' + CAST(@ReportMonth AS VARCHAR) + '/' + CAST(@ReportYear AS VARCHAR);
PRINT 'Total Working Days: ' + CAST(@TotalDays AS VARCHAR);
PRINT 'Days Present: ' + CAST(@PresentDays AS VARCHAR);
PRINT 'Days Absent: ' + CAST(@AbsentDays AS VARCHAR);
PRINT 'Days on Leave: ' + CAST(@LeaveDays AS VARCHAR);
