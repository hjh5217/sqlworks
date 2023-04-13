-- function
-- NULL �� ó���ϱ�

SELECT
    *
FROM
    customer
WHERE
    phone IN NULL;

-- NVL(Į����, Ư����) : Į���̸� NULL�� ���� Ư������ ���, NULL�� �ƴϸ� Į���� ���
SELECT
    custid,
    custname,
    address,
    nvl(phone, '010-1234-5678')
FROM
    customer;

CREATE TABLE k1 (
    id  VARCHAR2(3),
    cnt NUMBER(2)
);

INSERT INTO k1 VALUES (
    '��',
    5
);

INSERT INTO k1 VALUES (
    '��',
    NULL
);

INSERT INTO k1 VALUES (
    '��',
    5
);

INSERT INTO k1 VALUES (
    '��',
    NULL
);

INSERT INTO k1 VALUES (
    '��',
    10
);

SELECT
    *
FROM
    k1;

--��ü ����, �հ�, ���, �ּҰ�
SELECT
    COUNT(cnt)
FROM
    k1; -- 3��

--NULL�� 0���� �ٲ�
SELECT
    COUNT(nvl(cnt, 0)) cnt
FROM
    k1; -- 5

SELECT
    SUM(nvl(cnt, 0)) / 4 sum
FROM
    k1; -- 5

SELECT
    AVG(nvl(cnt, 0)) average
FROM
    k1; -- 4

SELECT
    MIN(nvl(cnt, 5)) average
FROM
    k1; -- 5

COMMIT;

DROP TABLE k1;


-- RANK() �Լ�
SELECT
    *
FROM
    employee;

SELECT
    ename,
    sal,
    RANK()
    OVER(
        ORDER BY
            sal DESC
    ) �޿�_rank,
    DENSE_RANK()
    OVER(
        ORDER BY
            sal DESC
    ) �޿�_dense_rank
FROM
    employee;
    
    