USE C21_DB1;

-- ÎØæÉ 1: ÅÚáÇä ÇáãÊÛíÑÇÊ
DECLARE @DepartmentID INT; -- ãÊÛíÑ áÊÎÒíä ãÚÑİ ÇáŞÓã
DECLARE @StartDate DATE; -- ãÊÛíÑ áÊÎÒíä ÊÇÑíÎ ÇáÈÏÁ
DECLARE @EndDate DATE; -- ãÊÛíÑ áÊÎÒíä ÊÇÑíÎ ÇáÇäÊåÇÁ
DECLARE @TotalEmployees INT; -- ãÊÛíÑ áÊÎÒíä ÇáÚÏÏ Çáßáí ááãæÙİíä
DECLARE @DepartmentName VARCHAR(50); -- ãÊÛíÑ áÊÎÒíä ÇÓã ÇáŞÓã

-- ÎØæÉ 2: ÊåíÆÉ ÇáãÊÛíÑÇÊ
SET @DepartmentID = 3; -- ÊÚííä ãÚÑİ ŞÓã ãÚíä
SET @StartDate = '2023-01-01'; -- ÊÚííä ÊÇÑíÎ ÇáÈÏÁ ááÊŞÑíÑ
SET @EndDate = '2023-12-31'; -- ÊÚííä ÊÇÑíÎ ÇáÇäÊåÇÁ ááÊŞÑíÑ

-- ÎØæÉ 3: ÇÓÊÑÌÇÚ ÇÓã ÇáŞÓã ÈäÇÁğ Úáì ãÚÑİ ÇáŞÓã
SELECT @DepartmentName = Name FROM Departments WHERE DepartmentID = @DepartmentID;

-- ÎØæÉ 4: ÍÓÇÈ ÇáÚÏÏ Çáßáí ááãæÙİíä İí ÇáŞÓã ÇáãÍÏÏ Öãä ÇáİÊÑÉ ÇáÒãäíÉ
SELECT @TotalEmployees = COUNT(*) 
FROM Employees 
WHERE DepartmentID = @DepartmentID 
AND HireDate BETWEEN @StartDate AND @EndDate;

-- ÎØæÉ 5: ØÈÇÚÉ ÇáÊŞÑíÑ
PRINT 'Department Report';
PRINT 'Department Name: ' + @DepartmentName;
PRINT 'Reporting Period: ' + CAST(@StartDate AS VARCHAR) + ' to ' + CAST(@EndDate AS VARCHAR);
PRINT 'Total Employees Hired in ' + CAST(YEAR(@StartDate) AS VARCHAR) + ': ' + CAST(@TotalEmployees AS VARCHAR);
