-- ÅÚáÇä ÇáãÊÛíÑÇÊ
DECLARE @CustomerID INT; -- áÊÍÏíÏ ãÚÑİ ÇáÚãíá
DECLARE @TotalSpent DECIMAL(10, 2); -- áÊÎÒíä ÅÌãÇáí ÇáÅäİÇŞ
DECLARE @PointsEarned INT; -- áÊÎÒíä ÇáäŞÇØ ÇáãßÊÓÈÉ
DECLARE @CurrentYear INT = YEAR(GETDATE()); -- ÊÎÒíä ÇáÓäÉ ÇáÍÇáíÉ

-- ÊåíÆÉ ãÚÑİ ÇáÚãíá
SET @CustomerID = 1; -- ÊÚííä ãÚÑİ ÇáÚãíá (åäÇ ßãËÇá ÑŞã 1)

-- ÍÓÇÈ ÅÌãÇáí ÇáÅäİÇŞ ááÚãíá İí ÇáÓäÉ ÇáÍÇáíÉ
SELECT @TotalSpent = SUM(Amount)
FROM Purchases
WHERE CustomerID = @CustomerID AND YEAR(PurchaseDate) = @CurrentYear;

-- ÍÓÇÈ ÇáäŞÇØ ÇáãßÊÓÈÉ (äŞØÉ áßá 10 ÏæáÇÑÇÊ)
SET @PointsEarned = CAST(@TotalSpent / 10 AS INT);

-- ÊÍÏíË äŞÇØ ÇáæáÇÁ İí ÌÏæá ÇáÚãáÇÁ
UPDATE Customers
SET LoyaltyPoints = LoyaltyPoints + @PointsEarned
WHERE CustomerID = @CustomerID;

-- ØÈÇÚÉ ÇáäÊÇÆÌ
PRINT 'Loyalty Points Update for Customer ID: ' + CAST(@CustomerID AS VARCHAR);
PRINT 'Total Amount Spent in ' + CAST(@CurrentYear AS VARCHAR) + ': $' + CAST(@TotalSpent AS VARCHAR);
PRINT 'Loyalty Points Earned: ' + CAST(@PointsEarned AS VARCHAR);
