-- ���� ����

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
LIKE ('����%');

--4
SELECT *
FROM customer
WHERE custname in ('�迬��','�Ȼ�');

--5
SELECT *
FROM customer
WHERE address
NOT LIKE ('%���ѹα�%');

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
SELECT COUNT (*) ���ο��� FROM customer;