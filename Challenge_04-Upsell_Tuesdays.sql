SELECT 
        DATEPART(WEEKDAY, OrderDate) as [Day of Week],
        COUNT(SalesOrderID) as Orders,
        CAST(SUM(SubTotal)as money) as Revenue,
        CAST(AVG(SubTotal) as money) as [Revenue per order]
    FROM AdventureWorks.Sales.SalesOrderHeader

    WHERE YEAR(OrderDate) = 2012 AND OnlineOrderFlag = 0

    GROUP BY
            DATEPART(WEEKDAY, OrderDate)

