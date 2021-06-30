-- sequence 모두 삭제
DROP SEQUENCE BOOK_SEQ;
DROP SEQUENCE CART_SEQ;
DROP SEQUENCE SEQ_BK;
DROP SEQUENCE SEQ_DOG;
DROP SEQUENCE SEQ_MBD;
DROP SEQUENCE SEQ_NT;
DROP SEQUENCE SEQ_OWN;
DROP SEQUENCE SEQ_OWN_D;
DROP SEQUENCE SEQ_OWN_O;
DROP SEQUENCE SEQ_WKR;

-- Trigger 모두 삭제
DROP TRIGGER SEQ_OWN_TR_D;
DROP TRIGGER SEQ_OWN_TR_O;
DROP TRIGGER SEQ_DOG_TR;
DROP TRIGGER SEQ_NT_TR;
DROP TRIGGER SEQ_MBD_TR;
DROP TRIGGER SEQ_NT_TR;

------------------------- Sequence 생성-----------------------------
/* 견주 테이블 */
-- 견주 일련번호 시퀀스 생성
-- (수정 및 추가 6/2) 견주 테이블 내 견주 일련번호 PK 값 시퀀스
CREATE SEQUENCE SEQ_OWN_O
START WITH 1
INCREMENT BY 1
MAXVALUE 1000;

-- (수정 및 추가 6/2) 강아지 테이블 내 견주 일련번호 FK 값 시퀀스
CREATE SEQUENCE SEQ_OWN_D
START WITH 1
INCREMENT BY 1
MAXVALUE 1000;

/* 강아지 테이블 */
-- 강아지 일련번호 시퀀스 생성
CREATE SEQUENCE SEQ_DOG
START WITH 1
INCREMENT BY 1
MAXVALUE 1000;

/* 공지사항 테이블 */
-- 공지사항 일련번호 시퀀스 생성
CREATE SEQUENCE SEQ_NT
START WITH 1
INCREMENT BY 1
MAXVALUE 1000;

/* 매칭 게시판 테이블 */
-- 매칭 게시판 게시번호 시퀀스 생성
CREATE SEQUENCE SEQ_MBD
START WITH 1
INCREMENT BY 1
MAXVALUE 1000;

/* 예약 테이블 */
-- 예약일련번호 시퀀스 생성
CREATE SEQUENCE SEQ_BK
START WITH 1
INCREMENT BY 1
MAXVALUE 1000;

------------------------- Trigger 생성-----------------------------

-- (수정 및 추가 6/2) 견주 테이블 내 견주 일련번호 생성 시퀀스에 대한 트리거
/
CREATE OR REPLACE TRIGGER SEQ_OWN_TR_O
BEFORE INSERT ON OWNER 
FOR EACH ROW
BEGIN
SELECT SEQ_OWN_O.NEXTVAL INTO :NEW.OWN_REG_NO FROM DUAL;
END;
/

-- (수정 및 추가 6/2) 강아지 테이블 내 견주 일련번호 생성 시퀀스에 대한 트리거
/
CREATE OR REPLACE TRIGGER SEQ_OWN_TR_D
BEFORE INSERT ON DOG
FOR EACH ROW
BEGIN
SELECT SEQ_OWN_D.NEXTVAL INTO :NEW.OWN_REG_NO FROM DUAL;
END;
/

-- 강아지 일련번호 시퀀스를 강아지테이블에 자동으로 추가하는 트리거 생성
/
CREATE OR REPLACE TRIGGER SEQ_DOG_TR
BEFORE INSERT ON DOG
FOR EACH ROW
BEGIN
SELECT SEQ_DOG.NEXTVAL INTO :NEW.DOG_NO FROM DUAL;
END;
/

-- 공지사항 일련번호 시퀀스를 공지사항테이블에 자동으로 추가하는 트리거 생성
/
CREATE OR REPLACE TRIGGER SEQ_NT_TR
BEFORE INSERT ON NOTICE
FOR EACH ROW
BEGIN
SELECT SEQ_NT.NEXTVAL INTO :NEW.NT_NO FROM DUAL;
END;
/

-- 매칭 게시판 게시번호 시퀀스를 매칭게시판테이블에 자동으로 추가하는 트리거 생성
/
CREATE OR REPLACE TRIGGER SEQ_MBD_TR
BEFORE INSERT ON MBOARD
FOR EACH ROW
BEGIN
SELECT SEQ_MBD.NEXTVAL INTO :NEW.MBD_NO FROM DUAL;
END;
/

-- 예약일련번호 시퀀스를 자동으로 추가하는 트리거 생성
/
CREATE OR REPLACE TRIGGER SEQ_BK_TR
BEFORE INSERT ON BOOKING
FOR EACH ROW
BEGIN
SELECT SEQ_BK.NEXTVAL INTO :NEW.BK_NO FROM DUAL;
END;
/

/* 도우미 테이블 */
-- (수정 및 삭제 6/3) 도우미 일련번호는 자바에서 생성하는 방식으로 수정
-- 도우미 일련번호 시퀀스 생성
--CREATE SEQUENCE SEQ_WKR
--START WITH 1
--INCREMENT BY 1
--MAXVALUE 1000;
---- 시퀀스 삭제
--DROP SEQUENCE SEQ_WKR;
-- 도우미 일련번호 시퀀스를 도우미테이블에 자동으로 추가하는 트리거 생성
--/
--CREATE OR REPLACE TRIGGER SEQ_WKR_TR
--BEFORE INSERT ON WALKER
--FOR EACH ROW
--BEGIN
--SELECT SEQ_WKR.NEXTVAL INTO :NEW.WKR_REG_NO FROM DUAL;
--END;
--/

------------------------- 데이터 추가-----------------------------
-- 임의 데이터 추가
INSERT INTO OWNER(OWN_ID, OWN_PWD, OWN_NAME, OWN_ADDR, OWN_EMAIL, OWN_TEL, OWN_BTH_DT, OWN_GDR, MB_CLF_CD) VALUES('test', '1234', '홍길동', '서울 동대문구', 'hong@korea.kr', '010-1234-1234', '2000-01-01', 'M', '1');
INSERT INTO OWNER(OWN_ID, OWN_PWD, OWN_NAME, OWN_ADDR, OWN_EMAIL, OWN_TEL, OWN_BTH_DT, OWN_GDR, MB_CLF_CD) VALUES('TEST2', '1234', '임꺽정', '서울 서대문구', 'lim@korea.kr', '010-4321-4321', '2000-02-02', 'M', '1');
-- 임의 데이터 추가
INSERT INTO BOOKING(MBD_NO, WKR_REG_NO, WKR_ID) VALUES('1','1', 'seo');
-- 임의 데이터 추가
INSERT INTO DOG(DOG_NAME, DOG_GDR, DOG_KIND, DOG_SIZE, DOG_AGE, DOG_LEN, DOG_WGT, DOG_NTL_CHK, DOG_AGG, DOG_CHR, DOG_MD_HST, DOG_PHT_NM, OWN_REG_NO, OWN_ID) 
VALUES('골든', 'M', '골든 리트리버', 'BIG', 5, 1.0, 20, 'Y', 'LOW', '밥을 잘 먹음', '없음', 'DOG0001', '1', 'test');
-- 임의 데이터 추가
INSERT INTO WALKER(WKR_ID, WKR_PWD, WKR_NAME, WKR_ADDR, WKR_EMAIL, WKR_TEL, WKR_GDR, WKR_BTH_DT, WKR_RS_CNT, WKR_PHT_NM, WKR_RS_EX, WKR_CAREER, WKR_DEL, MB_CLF_CD) 
VALUES('seo', '1234', '서세원', '서울 남대문', 'seo@korea.kr', '010-1234-4321', 'M', '1980-01-01', 3, 'WKR_001', '집에서 키워봄', '경력 많음', 'N', '2');
-- 임의 데이터 추가
INSERT INTO NOTICE(NT_SBJT, NT_CONT, NT_RD_CNT, MNG_ID) 
VALUES('시험', '공지 시험', '1', 'master');
-- 임의 데이터 추가, 시간 입력 시 TO_DATE 함수로 받아야 할 것
INSERT INTO MBOARD(MBD_STR_DT, MBD_FN_DT, MBD_SBJT, MBD_CONT, MBD_REG_DT, MBD_RD_CNT, OWN_REG_NO, OWN_ID) 
VALUES('2021-06-15', '2021-06-16', '매칭 제목', '매칭 내용', SYSDATE, 1, '1', 'test');

INSERT INTO MBOARD(MBD_STR_DT, MBD_FN_DT, MBD_SBJT, MBD_CONT, MBD_REG_DT, MBD_RD_CNT, OWN_REG_NO, OWN_ID) 
VALUES('2021-06-15', '2021-06-16', 'testtest', 'testtest', SYSDATE, 1, '1', 'test');

-- 견주 테이블 조회
SELECT * FROM OWNER;
-- 강아지 테이블 조회
SELECT * FROM DOG;
-- 도우미 테이블 조회
SELECT * FROM WALKER;
-- 공지사항 테이블 조회
SELECT * FROM NOTICE;
-- 매칭 게시판 테이블 조회
SELECT * FROM MBOARD;

select * from booking;

select * from (select rowNum rn, e.* from (select distinct b.bk_no, b.mbd_no, m.mbd_sbjt, b.bk_mc_chk, b.bk_chk from booking b, 
		mboard m where m.mbd_no=b.mbd_no order by mbd_no desc, bk_no desc) e) 
		where rn between 1 and 10;
select * from (select rowNum rn, e.* from (select b.mbd_no,
	m.mbd_sbjt, m.own_id, m.mbd_reg_dt from booking b, mboard m
	where b.mbd_no=m.mbd_no order by bk_no desc) e)
	where rn between 1 and 10;       
COMMIT;

select * from (select rowNum rn, e.* from (select b.bk_no, b.mbd_no,
	m.mbd_sbjt, b.wkr_id, b.wkr_reg_no, b.bk_mc_chk, b.bk_chk, m.own_id, m.mbd_reg_dt from
	booking b, mboard m
	where b.mbd_no=m.mbd_no and b.wkr_id='test6'
    order
	by bk_no desc) e)
	where rn between 1 and 10;
    
select * from (select rowNum rn, e.* from (select b.mbd_no, m.mbd_sbjt,
               b.wkr_id, b.wkr_reg_no, b.bk_mc_chk, b.bk_chk, m.own_id, m.mbd_reg_dt
      from booking b, mboard m
      where b.mbd_no=m.mbd_no and m.own_id='test3' order by bk_no desc) e)
      where rn between 1 and 10;
      
truncate table booking;
truncate table dog;
truncate table license;
truncate table manager;
truncate table mboard;
truncate table notice;
truncate table owner;
truncate table walker;