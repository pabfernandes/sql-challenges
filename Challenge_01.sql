/****** Script do comando SelectTopNRows de SSMS  ******/
 
 IF OBJECT_ID('tempdb..#AWSales') IS NOT NULL DROP TABLE #AWSales
 
 SELECT
        [SalesPersonID]
        ,YEAR(OrderDate) as FY
        ,CASE 
            WHEN MONTH(OrderDate) BETWEEN 1 AND 3 THEN 3
            WHEN MONTH(OrderDate) BETWEEN 4 AND 6 THEN 4
            WHEN MONTH(OrderDate) BETWEEN 7 AND 9 THEN 1
            WHEN MONTH(OrderDate) BETWEEN 10 AND 12 THEN 2
        END as FQ
        ,SUM([SubTotal]) AS FQSales
        INTO #AWSales
FROM [AdventureWorks].[Sales].[SalesOrderHeader]

    WHERE OnlineOrderFlag <> 1

    GROUP BY 
    [SalesPersonID]
        ,YEAR(OrderDate)
        ,CASE 
            WHEN MONTH(OrderDate) BETWEEN 1 AND 3 THEN 3
            WHEN MONTH(OrderDate) BETWEEN 4 AND 6 THEN 4
            WHEN MONTH(OrderDate) BETWEEN 7 AND 9 THEN 1
            WHEN MONTH(OrderDate) BETWEEN 10 AND 12 THEN 2
        END


SELECT 
    Person.LastName,
    N1.SalesPersonID,
    N1.FY,
    N1.FQ,
    N1.FQSales,
    SalesSameFQLast = N2.FQSales,
    Change = N1.FQSales - N2.FQSales,
    [%Change] = (N1.FQSales - N2.FQSales)/N2.FQSales
FROM #AWSales as N1

LEFT JOIN #AWSales as N2 ON
    N1.SalesPersonID = N2.SalesPersonID AND
    N1.FQ = N2.FQ AND
    N1.FY-1 = N2.FY

INNER JOIN AdventureWorks.Person.Person as Person ON N1.SalesPersonID = Person.BusinessEntityID

WHERE N1.FY = 2013

ORDER BY N1.FY, N1.FQ



