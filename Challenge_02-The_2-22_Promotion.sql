/** CHALLENGE QUESTION 2: THE 2/22 PROMOTION
Difficulty: Intermediate
A marketing manager devised the “2/22” promotion, in which orders subtotaling at least $2,000 ship for $0.22. The strategy assumes that freight losses will be offset
by gains from higher value orders. According to the marketing manager, orders between $1,700 and $2,000 will likely boost to $2,000 as customers feel
compelled to take advantage of bargain freight pricing.
You are asked to test the 2/22 promotion for hypothetical profitability based on the marketing manager’s assumption about customer behavior. Examine orders
shipped to California during fiscal year 2008 for net gains or losses under thepromotion.

PART I
Create a table that includes the following columns:
    SalesOrderID                    SalesOrderHeader
    Ship to state (California)      sales.vIndividualCustomer.StateProvinceName
    OrderDate                       SalesOrderHeader
    Historical order subtotal (prior to any changes as a result of the
    promotion)
    Historical freight (prior to any changes as a result of the promotion)
    Potential promotional effect. Indicate one of three hypothetical scenarios
    related to the order:
        Increase order to $2,000 and pay $0.22 freight
        No order change and pay $0.22 freight
        No order change and pay historical freight
    Potential order gain
    Potential freight loss
    Potential promotional net gain/loss

Notes:
For Adventure Works, the fiscal year spans July through June
Tax should not be considered **/


SELECT * FROM AdventureWorks.sales.SalesOrderHeader

WHERE SubTotal BETWEEN 1700 AND 2000
AND ShipToAddressID IN (SELECT BusinessEntityID
                            FROM AdventureWorks.sales.vIndividualCustomer
                            WHERE StateProvinceName = 'California')

