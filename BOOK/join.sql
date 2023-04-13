--���ΰ� ��������

SELECT
    *
FROM
    customer;

SELECT
    *
FROM
    book;

SELECT
    *
FROM
    orders;
    
    
-- ���� ���� �ֹ��� ���� �����͸� ��� �˻��Ͻÿ�
SELECT
    *
FROM
    customer,
    orders
WHERE
    customer.custid = orders.custid;

SELECT
    cus.custid,
    cus.custname,
    ord.saleprice,
    ord.orderdate
FROM
    customer cus,
    orders   ord
WHERE
        cus.custid = ord.custid
--AND cus.name = '�迬��'; -- �迬�� ���� �ֹ�����
--AND saleprice >= 20000; -- �ǸŰ����� 20000�� �̻��� �ֹ� ����
    AND orderdate = '2018-7-8'; -- �ֹ����� 2018-7-8 �� �ֹ�����


-- �� �̸� ���� �ֹ��� ��� ������ �� �Ǹž��� ���Ͻÿ�
SELECT
    cus.custname,
    SUM(saleprice) �Ǹűݾ�,
    RANK()
    OVER(
        ORDER BY
            SUM(saleprice) DESC
    )              ����
FROM
    customer cus,
    orders   ord
WHERE
    cus.custid = ord.custid
GROUP BY
    cus.custname;

--���� �̸��� ���� �ֹ��� ������ �̸��� �˻��Ͻÿ�
SELECT
    cus.custname,
    boo.bookname,
    ord.saleprice,
    ord.orderdate
FROM
    customer cus,
    orders   ord,
    book     boo
WHERE
        cus.custid = ord.custid
    AND boo.bookid = ord.bookid
ORDER BY
    cus.custname;

-- ���� ��� ������ �̸��� �˻��Ͻÿ�
-- ���� �߻� ) SELECT bookname MAX(price) FROM book;
SELECT
    MAX(price)
FROM
    book; -- 35000

SELECT
    bookname
FROM
    book --�������̺�
WHERE
    price = 25000;

--��ø ����
SELECT
    bookname,
    price
FROM
    book
WHERE
    price = (
        SELECT
            MAX(price)
        FROM
            book
    );
    
    
-- ������ ������ ���� �ִ� ���� �̸��� �˻��Ͻÿ�
-- 1. �ֹ����̺��� �����̵� �˻�
SELECT
    custid
FROM
    orders;
-- 2. �����̵� �ִ� ���̸� �˻�
SELECT
    custname
FROM
    customer
WHERE
    custid IN ( 1, 2, 3, 4 );

SELECT
    custname
FROM
    customer
WHERE
    custid IN (
        SELECT
            custid
        FROM
            orders
    );
    

-- ������ ������ ���� ���� ���� �̸��� �˻��Ͻÿ�.
SELECT
    custname,
    custid
FROM
    customer
WHERE
    custid NOT IN (
        SELECT
            custid
        FROM
            orders
    );
    
--�迬�� ���� �ֹ������� �˻��Ͻÿ�
-- 1. �迬�� ���� ���̵� �˻�
-- 2. �迬�� ���� ���̵�� �ֹ����̺��� �˻�
    
SELECT custid
FROM customer
WHERE custname='�迬��';

SELECT *
FROM orders
WHERE custid = (SELECT custid FROM customer WHERE custname='�迬��');