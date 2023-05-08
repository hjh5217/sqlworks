SELECT * FROM board;


SELECT * FROM board WHERE writer = 'admin';

-- 작성자가 ADMIN 인 게시글 조회 - 인덱스로 만들기
--CREATE INDEX 인덱스이름 ON 테이블이름(칼럼이름)
CREATE INDEX idx_writer ON board(writer);

-- 오라클 힌트
SELECT * FROM board
WHERE writer = 'admin';

SELECT * FROM TABLE(DBMS_XFLAN.DISFLAY_CURSOR(null,null,'ALLSTATS LAST'));