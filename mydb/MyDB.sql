SELECT * FROM board;


SELECT * FROM board WHERE writer = 'admin';

-- �ۼ��ڰ� ADMIN �� �Խñ� ��ȸ - �ε����� �����
--CREATE INDEX �ε����̸� ON ���̺��̸�(Į���̸�)
CREATE INDEX idx_writer ON board(writer);

-- ����Ŭ ��Ʈ
SELECT * FROM board
WHERE writer = 'admin';

SELECT * FROM TABLE(DBMS_XFLAN.DISFLAY_CURSOR(null,null,'ALLSTATS LAST'));