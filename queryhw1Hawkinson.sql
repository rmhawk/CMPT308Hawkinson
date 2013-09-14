--Query HW 1
--Rebecca Hawkinson

--1 
--shows all data from table customers
Select *
from customers;

--2
--shows the name and city columns with a row under the columns name labeled Smith (From agents)
SELECT name,city 
from agents
WHERE name='Smith';

--3
--shows the pid, name, and quantity columns from the table products if the price is greater than 1.25
SELECT pid, name, quantity
from products
WHERE priceUSD>1.25;

--4
--shows the ordno and aid columns from the table orders
SELECT ordno, aid
from orders;

--5
--shows the name and city columns from the table customers as long as the city is not Dallas
SELECT name, city
from customers
WHERE city!='Dallas';

--6
--shows the name from the table agents if the city is either New York or Newark
SELECT name
from agents
WHERE city='New York' or city='Newark';

--7
--shows all data from the table products if the city is not New York or Newark and the price is less than or equal to $1.00
SELECT *
from products
WHERE city!='New York' and city!='Newark' and priceUSD<=1;

--8
--shows all data from the table orders as for the months January and March
SELECT *
from orders
WHERE mon='jan' or mon='mar';

--9
--shows all the data from the table orders for orders under $100 in the month of Febuary
SELECT *
from orders
WHERE mon='feb' and dollars<100;

--10
--shows all the data from the table orders for the customer ID C005
SELECT *
from orders
WHERE CID='C005';