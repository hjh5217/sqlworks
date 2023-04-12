-- ��� ���̺�
CREATE TABLE emp (
-- Į�� �̸�  �ڷ��� 
    empno      NUMBER(3) PRIMARY KEY, -- �����ȣ
    ename      VARCHAR2(20) NOT NULL, -- ����̸�
    sal        NUMBER(10),            -- �޿�
    createdate DATE DEFAULT sysdate  -- �����
);

-- ����� ���� Į�� �߰� ( ALTER ~ ADD Į���̸� �ڷ���)
ALTER TABLE emp ADD gender VARCHAR2(4);

-- ����� ���� �ڷ����� ���� -> MODIFY VARCHAR2(10)
ALTER TABLE emp MODIFY
    gender VARCHAR2(10);

-- ������ '��' �� ����� '����' �� ����
SELECT
    *
FROM
    emp
WHERE
    empno = 104;

UPDATE emp
SET
    gender = '����'
WHERE
    empno = 104;

DESC emp;

-- ��� �߰�
INSERT INTO emp VALUES (
    100,
    '�̰�',
    2500000,
    sysdate
);

INSERT INTO emp VALUES (
    101,
    '���',
    3000000,
    sysdate
);

INSERT INTO emp VALUES (
    102,
    '�����',
    5000000,
    sysdate
);

INSERT INTO emp VALUES (
    103,
    '�ڽ���',
    '',
    sysdate
);

INSERT INTO emp VALUES (
    104,
    '�����',
    1500000,
    sysdate,
    '��'
);

SELECT
    empno AS ���,
    ename AS �����,
    sal   AS �޿�
FROM
    emp;
    
-- �޿��� ���� ����� �˻��Ͻÿ�
-- NULL �� �ƴѰ�� IS NOT NULL
SELECT
    *
FROM
    emp
WHERE
    sal IS NULL;

-- �޿��� 300���� ������ ����� �˻��Ͻÿ�
SELECT
    *
FROM
    emp
WHERE
    sal <= 3000000
ORDER BY
    sal DESC;

-- �޿��� ���� ������ ����
SELECT
    *
FROM
    emp
ORDER BY
    sal DESC;

-- ����� ���� ���Ͻÿ�
SELECT
    COUNT(*) AS �����
FROM
    emp;

-- ��� �޿��� �հ�� ���

SELECT
    SUM(sal) �޿��հ�,
    AVG(sal) �޿����
FROM
    emp;

-- �̸��� ����� �� ��� ����
DELETE FROM emp WHERE ename = '�����';

ROLLBACK;

COMMIT;