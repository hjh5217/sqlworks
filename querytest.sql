-- 연습 문제

--1
SELECT custname, address
FROM customer;

--2
SELECT custname, address, phone
FROM customer;

--3
SELECT *
FROM customer
WHERE address
LIKE ('영국%');

--4
SELECT *
FROM customer
WHERE custname in ('김연아','안산');

--5
SELECT *
FROM customer
WHERE address
NOT LIKE ('%대한민국%');

--6 
SELECT *
FROM customer
WHERE phone
IS NULL;

--7
SELECT *
FROM customer
ORDER BY custname;

--8
SELECT COUNT (*) 총인원수 FROM customer;