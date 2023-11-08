# Total sales Till date
select sum(quantityOrdered*priceEach) as total_sales from orderdetails;


# Top 5 selling product
select p.productCode, p.productName, sum(od.quantityOrdered*od.priceEach) sales from products p 
join orderdetails od on od.productCode=p.productCode group by p.productCode order by sales desc limit 5;


# Top 5 customer by the payment and their location
select c.customerName, sum(p.amount) total_payment, c.country from customers c
 join payments p on c.customerNumber=p.customerNumber
group by c.customerNumber order by total_payment desc limit 5;


#Total sales by productline(category) of product
select  p.productLine , sum(od.quantityOrdered*od.priceEach) sales from orderdetails od 
 join products p on p.productCode=od.productCode 
 group by productLine order by sales desc;
 
#sales per year
select  year(orderDate) order_year ,sum(od.quantityOrdered*od.priceEach) sales from orderdetails od 
 join orders o  on o.orderNumber=od.orderNumber
 group by order_year  ;
 
 # Which 5  product has the highest profit margin
 select productCode,productName,productLine, (MSRP-buyprice) profit  from products order by profit desc limit 5 ;
 
 
# Sales by Employee
 select e.employeeNumber,  e.firstName employeefirstName,e.lastName employeeLastName,c.customerNumber, c.customerName, sum(od.quantityOrdered * od.priceEach) totalSales
FROM orders o JOIN customers c ON o.customerNumber = c.customerNumber
JOIN orderdetails od ON o.orderNumber = od.orderNumber
JOIN employees e ON e.employeeNumber = c.salesRepEmployeeNumber
GROUP BY e.employeeNumber, c.customerNumber
ORDER BY e.employeeNumber, c.customerNumber;
