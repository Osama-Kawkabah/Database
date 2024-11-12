/*
Â–« «·”ﬂ—»  ÌﬁÊ„ »≈‰‘«¡  ﬁ—Ì— „·Œ’ „»Ì⁄«  ‘Â—Ì.
Ì ÷„‰ «· ﬁ—Ì— ≈Ã„«·Ì «·„»Ì⁄« ° «·⁄œœ «·≈Ã„«·Ì ··„⁄«„·« ° Ê„ Ê”ÿ ﬁÌ„… «·»Ì⁄ ·‘Â— Ê”‰… „ÕœœÌ‰.
*/

-- ≈⁄·«‰ «·„ €Ì—« 
DECLARE @Year INT;
DECLARE @Month INT;
DECLARE @TotalSales DECIMAL(10, 2);
DECLARE @TotalTransactions INT;
DECLARE @AverageSale DECIMAL(10, 2);

--  ÂÌ∆… «·„ €Ì—« 
SET @Year = 2023; --  ⁄ÌÌ‰ «·”‰… ·· ﬁ—Ì—
SET @Month = 6; --  ⁄ÌÌ‰ «·‘Â— ·· ﬁ—Ì—

-- Õ”«» ≈Ã„«·Ì «·„»Ì⁄«  ··‘Â— Ê«·”‰… «·„ÕœœÌ‰
SELECT @TotalSales = SUM(SaleAmount)
FROM Sales
WHERE YEAR(SaleDate) = @Year AND MONTH(SaleDate) = @Month;

-- Õ”«» «·⁄œœ «·≈Ã„«·Ì ··„⁄«„·« 
SELECT @TotalTransactions = COUNT(*)
FROM Sales
WHERE YEAR(SaleDate) = @Year AND MONTH(SaleDate) = @Month;

-- Õ”«» „ Ê”ÿ ﬁÌ„… «·»Ì⁄
SET @AverageSale = CASE WHEN @TotalTransactions > 0 THEN @TotalSales / @TotalTransactions ELSE 0 END;

-- ÿ»«⁄… «· ﬁ—Ì—
PRINT 'Monthly Sales Summary Report';
PRINT 'Year: ' + CAST(@Year AS VARCHAR) + ', Month: ' + CAST(@Month AS VARCHAR);
PRINT 'Total Sales: ' + CAST(@TotalSales AS VARCHAR);
PRINT 'Total Transactions: ' + CAST(@TotalTransactions AS VARCHAR);
PRINT 'Average Sale Value: ' + CAST(@AverageSale AS VARCHAR);
