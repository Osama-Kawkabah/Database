DECLARE @A INT = 10, @B INT = 20, @Z INT = 30;

--  Õﬁﬁ „‰ ‘—Êÿ „ ⁄œœ…
IF @A < @B AND @Z > (@A + @B)
BEGIN 
    PRINT 'Yes: A < B AND Z > (A + B)';
END
ELSE
BEGIN 
    PRINT 'No: Either A >= B or Z <= (A + B)';
END


------------------------------------------------
DECLARE @Year INT = 2024;
DECLARE @Month INT = 2; -- ›»—«Ì—
DECLARE @DaysInMonth INT;

-- Õ”«» ⁄œœ «·√Ì«„ ›Ì «·‘Â— »«” Œœ«„ EOMONTH
SET @DaysInMonth = DAY(EOMONTH(DATEFROMPARTS(@Year, @Month, 1)));

IF @DaysInMonth = 28 AND @Year % 4 <> 0
BEGIN
    PRINT 'February has 28 days in a non-leap year.';
END
ELSE IF @DaysInMonth = 29
BEGIN
    PRINT 'February has 29 days in a leap year.';
END
ELSE
BEGIN
    PRINT 'This month has ' + CAST(@DaysInMonth AS VARCHAR) + ' days.';
END

---------------------------------
DECLARE @Score INT = 85;

IF @Score >= 90
BEGIN
    PRINT 'Grade: A';
END
ELSE IF @Score >= 80
BEGIN
    PRINT 'Grade: B';
END
ELSE IF @Score >= 70
BEGIN
    PRINT 'Grade: C';
END
ELSE IF @Score >= 60
BEGIN
    PRINT 'Grade: D';
END
ELSE
BEGIN
    PRINT 'Grade: F';
END



DECLARE @CurrentDate DATE = GETDATE();
DECLARE @StartDate DATE = '2024-01-01';
DECLARE @EndDate DATE = '2024-12-31';

IF @CurrentDate >= @StartDate AND @CurrentDate <= @EndDate
BEGIN
    PRINT 'Current date is within the range of the year 2024.';
END
ELSE
BEGIN
    PRINT 'Current date is outside the range of the year 2024.';
END
