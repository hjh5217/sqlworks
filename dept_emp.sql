-- �μ� ���̺�� ��� ���̺� ����(JOIN)
-- 1�� �̻��� ���̺��� �����Ҽ� �ִ�.

SELECT
    *
FROM
    dept;

SELECT
    *
FROM
    employee;

-- �����ȣ, �����, �μ���ȣ, �μ����� ����Ͻÿ�
SELECT
    emp.empno,
    emp.ename,
    emp.deptno,
    dep.deptname,
    emp.sal
FROM
    employee emp,
    dept     dep
WHERE
    emp.deptno = dep.deptno;
    
-- GROUP BY ��(�Ҽӵ� �׷�ȭ), ������ HAVING ���
-- �μ��� �޿� �Ѿ��� ���Ͻÿ�
SELECT
    deptno   �μ�,
    SUM(sal) �޿��Ѿ�,
    AVG(sal) �޿����
FROM
    employee -- �˻�1����
GROUP BY
    deptno -- 2
HAVING
    AVG(sal) >= 3000000 -- 3
ORDER BY
    AVG(sal) ASC; --4
    
    COMMIT;