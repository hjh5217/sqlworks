-- ���� Ÿ���� �Լ�
-- ������ ���̺� : dual
SELECT
    abs(- 10),
    abs(10)
FROM
    dual;

SELECT
    round(3.875, 2)
FROM
    dual;

SELECT
    *
FROM
    employee;

    --�ݿø�
SELECT
    sal                  �޿�,
    sal / 30             �ϱ�,
    round(sal / 30, 0)   ���1,
    round(sal / 30, 1)   ���2,
    round(sal / 30, 2)   ���3,
    round(sal / 30, - 1) ���4
FROM
    employee;
    
    --����
SELECT
    sal                  �޿�,
    sal / 30             �ϱ�,
    round(sal / 30, 0)   ���1,
    trunc(sal / 30, 1)   ���2,
    trunc(sal / 30, 2)   ���3,
    trunc(sal / 30, - 1) ���4
FROM
    employee;

SELECT
    *
FROM
    orders;

--������ ��� �ֹ� �ݾ��� ��� ������ �ݿø��� ���� ���Ͻÿ�
SELECT
    custid     ������ȣ,
    round(AVG(saleprice),
          - 2) ��ձݾ�
FROM
    orders
GROUP BY
    custid;

SELECT
    custid         ������ȣ,
    COUNT(*)       �ֹ���,
    SUM(saleprice) �Ѿ�
FROM
    orders
GROUP BY
    custid;

SELECT
    custid     ������ȣ,
    round(SUM(saleprice) / COUNT(*),
          - 2) ��ձݾ�
FROM
    orders
GROUP BY
    custid;
    

--���� Ÿ�� �Լ�
SELECT
    lower('ABCD')
FROM
    dual;

--SUBSTR(����, �ε���, ���ڼ�)
SELECT
    substr('ABC', 1, 2) result
FROM
    dual;

-- REPLACE(����, ��������, ���ο��)
SELECT
    replace('ABC', 'A', 'E') result
FROM
    dual;

-- �μ� �̸����� ó������ �����ؼ� 2���� ���� ���
SELECT
    substr(deptname, 1, 2) �μ���
FROM
    dept;


-- ���� ���� '�߱�'�� ���Ե� ������ '��'�� �����Ͽ� �˻�
SELECT
    replace(bookname, '�߱�', '��') å��
FROM
    book;
-- CONCAT(����1,����2) ���� ����
SELECT
    concat('A', 'B') result
FROM
    dual;
-- ���Ῥ���� - '||
SELECT
    '�ȳ�' || '�ϼ���' result
FROM
    dual;
-- LPAD(����, ���ڼ�, ��ȣ) ���ʺ��� ä��
SELECT
    lpad('cloud', 10, '*')
FROM
    dual;
-- RPAD �����ʺ���
SELECT
    rpad('cloud', 10, '*')
FROM
    dual;

-- �½��������� ������ ������ ����� ������ ���� ��, ����Ʈ ���� �˻�
-- �ѱ� 3Byte, ��� Ư����ȣ 1Byte
SELECT
    bookname,
    length(bookname) ���ڼ�,
    lengthb(bookname)
FROM
    book
WHERE
    publisher = '�½�����';
    

-- ��¥ �Լ�
SELECT
    sysdate - 20
FROM
    dual;

SELECT
    systimestamp
FROM
    dual;

-- 3���� ���� ��¥ ���
SELECT
    add_months(sysdate, 3) ���
FROM
    dual;

SELECT
    add_months(sysdate, - 3) ���
FROM
    dual;

SELECT
    add_months('2023:04:01', - 3) ���
FROM
    dual;


--�ֹ���ȣ�� 6���� 10������ ������ �ֹ��Ͽ� 3������ ���� ���� ���Ͻÿ�.
-- 1. �ֹ���ȣ�� 6~10�� ���� �˻�
-- 2. �ֹ��Ͽ� 3���� ���ϱ�
SELECT
    orderid                  �ֹ���ȣ,
    add_months(orderdate, 3) ���ϱ���
FROM
    orders
WHERE
        orderid >= 6
    AND orderid <= 10;

SELECT
    orderid                    �ֹ���ȣ,
    add_months(orderdate, - 3) ���ϱ���
FROM
    orders
WHERE
        orderid >= 6
    AND orderid <= 10;
    

-- �ֹ���ȣ�� 10�� ������ �ֹ��Ϸκ��� ���ñ����� �� �������� ���Ͻÿ�
--MONTHS_BETWEEN(���ĳ�¥, ������¥)
SELECT
    orderid                                   �ֹ���ȣ,
    orderdate                                 �ֹ���,
    trunc(months_between(sysdate, orderdate)) �Ѱ�����
FROM
    orders
WHERE
    orderid = 10;
    
-- ������ �ֹ��Ϸκ��� 10���� ������ Ȯ���Ѵ�. �� �ֹ��� Ȯ�����ڸ� ���Ͻÿ�.
SELECT
    orderid        �ֹ���ȣ,
    orderdate      �ֹ���,
    orderdate + 10 Ȯ����
FROM
    orders;
    
--�ڵ� Ÿ�� ��ȯ
SELECT
    1 + '2'
FROM
    dual;

--���� Ÿ�� ��ȯ
--���ڸ� ���� �������� ��ȯ�Ѵ�
SELECT
    TO_NUMBER('120')
FROM
    dual;

--��¥ ����
SELECT
    TO_DATE('2022-06-30', 'yy-mm-dd')
FROM
    dual;

SELECT
    to_char(sysdate, 'yyyy-mm-dd')
FROM
    dual;

SELECT
    to_char(sysdate, 'YY-MM-DD') ��¥,
    to_char(sysdate, 'YYYY')     ����,
    to_char(sysdate, 'MM')       ��,
    to_char(sysdate, 'DD')       ��
FROM
    dual;
    
--�ð� ���� ��ȯ
SELECT
    to_char(sysdate, 'HH:MI:SS AM')            �ð�����,
    to_char(sysdate, 'YYYY/MM/DD HH:MI:SS FM') ��¥�ͽð�
FROM
    dual;
    
    
-- ���� �̸����� ���� ���� ���� ����� �ο����� ���Ͻÿ�
SELECT SUBSTR(custname,1,1) ��, COUNT(*) �ο�
FROM customer
GROUP BY SUBSTR(custname,1,1);

SELECT SUBSTR(custname,1,1)
FROM customer;