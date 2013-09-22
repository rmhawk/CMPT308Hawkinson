--Rebecca Hawkinson
--Queries 2
--09/23/13

--1
--Gets cities of agents booking an order for customer c002
SELECT a.city
from agents a
WHERE a.aid in
	(SELECT o.aid
	from  orders o
	WHERE o.cid='c002')
order by a.city;

--2
--Get the pids of products ordered through any agent who makes at least	one order for a customer in Kyoto. (This is not	the same as asking for pids	
--of products ordered by a customer in Kyoto.)
SELECT distinct o.pid
from orders o
WHERE o.aid in
	(SELECT o.aid
	from orders o 
	WHERE o.cid in
		(SELECT c.cid
		from customers c
		WHERE c.city='Kyoto'))
order by o.pid;

--3
--Find the cids and names of customers who never placed an order through agent a03.
SELECT c.cid, c.name
from customers c
WHERE c.cid not in
	(SELECT distinct o.cid
	from orders o
	WHERE o.aid='a03')
order by c.cid;

--4
--Get the cids and names of customers who ordered both product p01 and p07.
SELECT c.cid, c.name
from customers c
WHERE c.cid in
	(SELECT o.cid
	from orders o
	where o.pid='p07' 
		and o.cid in
			(SELECT o.cid
			from orders o
			WHERE o.pid='p01'))
order by c.cid;

--5
--Get the pids of products ordered by any customers who ever placed an order through agent a03.
SELECT distinct o.pid
from orders o
WHERE o.cid in
	(SELECT distinct o.cid
	from orders o
	WHERE o.aid='a03')
order by o.pid;

--6
--Get the names and discounts of all customers who place orders through agents in Dallas or Duluth.
SELECT c.name, c.discount
from customers c
WHERE c.cid in
	(SELECT distinct o.cid
	from orders o
	WHERE o.aid in
		(SELECT a.aid
		from agents a
		WHERE a.city='Dallas' 
			or a.city='Duluth'));

--7
--Find all customers who have the same discount as that of any customers in Dallas or Kyoto.
SELECT c.*
from customers c
WHERE c.discount in
	(SELECT distinct c.discount
	from customers c
	WHERE c.city='Dallas' 
		or c.city='Kyoto')
order by c.cid;

--if you do not want to show Dallas and Kyoto it would be:
--SELECT c.*
--from customers c
--WHERE c.city!='Dallas'
--	and c.city!='Kyoto'
--		and c.discount in
--			(SELECT distinct c.discount
--			from customers c
--			WHERE c.city='Dallas' 
--				or c.city='Kyoto')
--order by c.cid;
