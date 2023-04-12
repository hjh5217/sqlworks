-- �μ� ���̺� dept
CREATE TABLE dept (
--Į���̸� �ڷ���
    deptno   VARCHAR2(4) PRIMARY KEY,
    deptname VARCHAR2(20) NOT NULL,
    office   VARCHAR2(10)
);

--�̻� ���� �ذ�
--�μ��ڵ�: �ĺ���(identifier) - �⺻Ű(PRIMARY KEY) �Ӽ��߰�
--�μ���:�ʼ� �Է� ����(NOT NULL �Ӽ� �߰�)

DESC dept;

--�μ� �߰�
--�μ��� �ʼ� �Է»��� notnull �Ӽ� �߰�
INSERT INTO dept (
    deptno,
    deptname,
    office
) VALUES (
    '1000',
    '�λ���',
    '����'
);

INSERT INTO dept (
    deptno,
    deptname,
    office
) VALUES (
    '1001',
    '������',
    '����'
);

INSERT INTO dept (
    deptno,
    deptname,
    office
) VALUES (
    '1002',
    '������',
    '����'
);

INSERT INTO dept (
    deptno,
    deptname
) VALUES (
    '1003',
    '������'
);

--���� �Ϸ�: Ʈ������� �Ѻκ�
COMMIT;

--�μ� �˻�
SELECT
    deptno,
    deptname,
    office
FROM
    dept;

--�μ� �ڷ� �˻�
SELECT
    deptname AS �μ���
FROM
    dept;

SELECT
    deptno   AS �μ��ڵ�,
    deptname AS �μ���
FROM
    dept;

SELECT
    *
FROM
    dept
ORDER BY
    deptno ASC;

DELETE FROM dept
WHERE
    deptno = '1001';

SELECT
    *
FROM
    dept
WHERE
    deptno = '1001';
    
-- �μ� ���̺� ����
DROP TABLE dept;

DELETE FROM dept
WHERE deptno = '1003';

-- �μ���ȣ�� 1002�� �μ��� 'ȸ����' ���� �����Ͻÿ�

UPDATE dept
SET
    deptname = 'ȸ����'
WHERE
    deptno = '1002';

DESC dept;