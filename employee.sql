-- ��� ���̺�(�μ��� ���踦 ����)
CREATE TABLE employee (
    empno      NUMBER(3) PRIMARY KEY,
    ename      VARCHAR2(20) NOT NULL,
    sal        NUMBER(10),
    createdate DATE DEFAULT sysdate,
    gender     VARCHAR2(10),
    deptno     VARCHAR2(4),
-- �ܷ�Ű(foreign key) ��������
    CONSTRAINT emp_fk FOREIGN KEY ( deptno )
        REFERENCES dept ( deptno )
        -- ON DELETE CASCADE(�μ��� �����ϸ� �����ϰ� �ִ� ����� ����)
);

-- ���� ���Ἲ ���� ����(�ܷ�Ű ����)
-- 1. ����� �Ҽӵ� �μ��� �����Ҷ� '�ڽ� ���ڵ尡 �ִ�' �� �����߻�
-- 2. �μ���ȣ�� ���� ��� �ڷḦ �߰��� �� '�θ�Ű�� ����'�� �����߻�

INSERT INTO employee VALUES (
    100,
    '�̰�',
    2500000,
    sysdate,
    '����',
    '1000'
);

INSERT INTO employee VALUES (
    101,
    '�̻�',
    2000000,
    sysdate,
    '����',
    '1001'
);

INSERT INTO employee VALUES (
    102,
    '�ڴ�',
    1500000,
    sysdate,
    '����',
    '1002'
);

INSERT INTO employee VALUES (
    103,
    '���ϴ�',
    3500000,
    sysdate,
    '',
    '1003'
);

INSERT INTO employee VALUES (
    104,
    '�����',
    4500000,
    sysdate,
    '����',
    '1000'
);
INSERT INTO employee VALUES (
    105,
    '����',
    2600000,
    sysdate,
    '����',
    '1000'
);

-- ��� �ڷ� �˻�
SELECT
    *
FROM
    employee;

--������ ������ ����� �˻��ϼ���
SELECT
    *
FROM
    employee
WHERE
    gender = '����';

--������ �����̸鼭 �޿��� 250���� �̻�
SELECT
    *
FROM
    employee
WHERE
        gender = '����'
    AND sal >= 2500000;

--�޿��� 200�������� 300���� ������ ���
SELECT
    *
FROM
    employee
WHERE
        sal >= 2000000
    AND sal <= 3000000;

--BETWEEN ~ AND ��� ����
SELECT
    *
FROM
    employee
WHERE
    sal BETWEEN 2000000 AND 3000000;
    

--���ڿ� �˻� : �Ϻ� ���� ���� LIKE '����%'
SELECT
    *
FROM
    employee
WHERE
    ename LIKE '��%';

--������� ���Ͻÿ�
SELECT
    COUNT(*) AS �����
FROM
    employee;
    
--�μ���ȣ�� �˻��Ͻÿ�
SELECT DISTINCT deptno �μ���ȣ
FROM employee;

COMMIT;