-- ITCS-1170-O1650 --
-- Group Purple --
-- Ronel Kakos, Tariq Jabbar, Zachary Huey, David Jovoski --

-- Four Corners Pizzeria --

use master;
go
use GroupPurple;
go

--This query is retrieving the customer details for customers located in the specific cities which are Sterling Heights or Howell.
--WHERE clause
--Credit: Tariq Jabbar
select firstname as [First Name], lastname as [Last Name], email as [Email]
from Customer
where city = 'Sterling Heights' or city = 'Howell';

--This query is counting employee hires by the month and displaying the counts greater than one hires in a month.
--GROUP BY statement and HAVING statement
--Credit: Zachary Huey
select convert(char(3), HireDate, 107) as [Month Hired],
count(*) as [Hire Count]
from Employee
group by convert(char(3), HireDate, 107)
having count(*) > 1
order by convert(char(3), HireDate, 107);

--This query shows the date/time when an order was placed, the date/time it was delivered, and the employee who delivered it.
--MULTI-TABLE JOIN
--Credit: Tariq Jabbar 
select o.orderid as [Order ID],
convert(varchar(20), ordertime, 100) as [Order Date/Time],
convert(varchar(20), deliverytime, 100) as [Delivery Date/Time],
firstname as [Deliverer First],
lastname as [Deliverer Last]

from Employee e
join Delivery d
on e.employeeid = d.delivererid
join order_delivery od
on d.deliveryid = od.deliveryid
join orders o
on od.orderid = o.orderid
order by deliverytime desc;

--This query retrives the customers details along with order status, and displays customers who had orders and customers who did not have orders.
--JOIN WITH A SET OPERATOR
--Credit: Ronel Kakos
-- Customers who have placed orders
select c.CustomerID, c.FirstName, c.LastName, 'Has Orders' as OrderStatus
from Customer c
join Orders o on c.CustomerID = o.CustomerID
union
-- Customers who haven't placed orders
select c.CustomerID, c.FirstName, c.LastName, 'No Orders' as OrderStatus
from Customer c
where c.CustomerID not in (select CustomerID from Orders)

--This query displays pizza orders that were placed without promotions.
--JOIN WITH A SET OPERATOR (another one created)
--Credit: Tariq Jabbar
select 
o.orderid as [Order ID],
convert(varchar(20), ordertime, 100) as [Order Date/Time],
firstname as [First Name],
lastname as [Last Name],
m.name as [Pizza Type],
'$' + convert(varchar(5), m.price) as [Order Price]

from customer c
join orders o
on o.customerid = c.customerid
join orders_pizza op
on o.orderid = op.orderid
join menu m
on op.menuid = m.menuid

except select 
o.orderid as [Order ID],
convert(varchar(20), ordertime, 100) as [Order Date/Time],
firstname as [First Name],
lastname as [Last Name],
m.name as [Pizza Type],
'$' + convert(varchar(5), m.price) as [Order Price]

from customer c
join orders o
on o.customerid = c.customerid
join order_promotion op2
on o.orderid = op2.orderid
join orders_pizza op3
on op2.orderid = op2.orderid
join menu m
on op3.menuid = m.menuid

--This subquery shows customers who have placed more than one order.
--SUBQUERY
--Credit: Ronel Kakos
select CustomerID, FirstName, LastName
from Customer
where CustomerID in (
    select CustomerID
    from Orders
    group by CustomerID
    having count(*) > 1);

--This query retrieves employee and customer details along with the associated orders information, deliveries, and promotions.
--OUTER JOIN
--Credit: David Jovoski
select
    Employee.EmployeeID,
    Employee.FirstName,
    Employee.LastName,
    Orders.OrderID,
    Orders.OrderDate,
    Order_Delivery.OrderType,
    Order_Promotion.PromotionID,
    Orders_Pizza.MenuID
from Employee
left outer join Orders on Employee.EmployeeID = Orders.EmployeeID
left outer join Order_Delivery on Orders.OrderID = Order_Delivery.OrderID
left outer join Order_Promotion on Orders.OrderID = Order_Promotion.OrderID
left outer join Orders_Pizza on Orders.OrderID = Orders_Pizza.OrderID;