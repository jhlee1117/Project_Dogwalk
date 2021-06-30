-- sequence ��� ����
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

-- Trigger ��� ����
DROP TRIGGER SEQ_OWN_TR_D;
DROP TRIGGER SEQ_OWN_TR_O;
DROP TRIGGER SEQ_DOG_TR;
DROP TRIGGER SEQ_NT_TR;
DROP TRIGGER SEQ_MBD_TR;
DROP TRIGGER SEQ_NT_TR;

------------------------- Sequence ����-----------------------------
/* ���� ���̺� */
-- ���� �Ϸù�ȣ ������ ����
-- (���� �� �߰� 6/2) ���� ���̺� �� ���� �Ϸù�ȣ PK �� ������
CREATE SEQUENCE SEQ_OWN_O
START WITH 1
INCREMENT BY 1
MAXVALUE 1000;

-- (���� �� �߰� 6/2) ������ ���̺� �� ���� �Ϸù�ȣ FK �� ������
CREATE SEQUENCE SEQ_OWN_D
START WITH 1
INCREMENT BY 1
MAXVALUE 1000;

/* ������ ���̺� */
-- ������ �Ϸù�ȣ ������ ����
CREATE SEQUENCE SEQ_DOG
START WITH 1
INCREMENT BY 1
MAXVALUE 1000;

/* �������� ���̺� */
-- �������� �Ϸù�ȣ ������ ����
CREATE SEQUENCE SEQ_NT
START WITH 1
INCREMENT BY 1
MAXVALUE 1000;

/* ��Ī �Խ��� ���̺� */
-- ��Ī �Խ��� �Խù�ȣ ������ ����
CREATE SEQUENCE SEQ_MBD
START WITH 1
INCREMENT BY 1
MAXVALUE 1000;

/* ���� ���̺� */
-- �����Ϸù�ȣ ������ ����
CREATE SEQUENCE SEQ_BK
START WITH 1
INCREMENT BY 1
MAXVALUE 1000;

------------------------- Trigger ����-----------------------------

-- (���� �� �߰� 6/2) ���� ���̺� �� ���� �Ϸù�ȣ ���� �������� ���� Ʈ����
/
CREATE OR REPLACE TRIGGER SEQ_OWN_TR_O
BEFORE INSERT ON OWNER 
FOR EACH ROW
BEGIN
SELECT SEQ_OWN_O.NEXTVAL INTO :NEW.OWN_REG_NO FROM DUAL;
END;
/

-- (���� �� �߰� 6/2) ������ ���̺� �� ���� �Ϸù�ȣ ���� �������� ���� Ʈ����
/
CREATE OR REPLACE TRIGGER SEQ_OWN_TR_D
BEFORE INSERT ON DOG
FOR EACH ROW
BEGIN
SELECT SEQ_OWN_D.NEXTVAL INTO :NEW.OWN_REG_NO FROM DUAL;
END;
/

-- ������ �Ϸù�ȣ �������� ���������̺� �ڵ����� �߰��ϴ� Ʈ���� ����
/
CREATE OR REPLACE TRIGGER SEQ_DOG_TR
BEFORE INSERT ON DOG
FOR EACH ROW
BEGIN
SELECT SEQ_DOG.NEXTVAL INTO :NEW.DOG_NO FROM DUAL;
END;
/

-- �������� �Ϸù�ȣ �������� �����������̺� �ڵ����� �߰��ϴ� Ʈ���� ����
/
CREATE OR REPLACE TRIGGER SEQ_NT_TR
BEFORE INSERT ON NOTICE
FOR EACH ROW
BEGIN
SELECT SEQ_NT.NEXTVAL INTO :NEW.NT_NO FROM DUAL;
END;
/

-- ��Ī �Խ��� �Խù�ȣ �������� ��Ī�Խ������̺� �ڵ����� �߰��ϴ� Ʈ���� ����
/
CREATE OR REPLACE TRIGGER SEQ_MBD_TR
BEFORE INSERT ON MBOARD
FOR EACH ROW
BEGIN
SELECT SEQ_MBD.NEXTVAL INTO :NEW.MBD_NO FROM DUAL;
END;
/

-- �����Ϸù�ȣ �������� �ڵ����� �߰��ϴ� Ʈ���� ����
/
CREATE OR REPLACE TRIGGER SEQ_BK_TR
BEFORE INSERT ON BOOKING
FOR EACH ROW
BEGIN
SELECT SEQ_BK.NEXTVAL INTO :NEW.BK_NO FROM DUAL;
END;
/

/* ����� ���̺� */
-- (���� �� ���� 6/3) ����� �Ϸù�ȣ�� �ڹٿ��� �����ϴ� ������� ����
-- ����� �Ϸù�ȣ ������ ����
--CREATE SEQUENCE SEQ_WKR
--START WITH 1
--INCREMENT BY 1
--MAXVALUE 1000;
---- ������ ����
--DROP SEQUENCE SEQ_WKR;
-- ����� �Ϸù�ȣ �������� ��������̺� �ڵ����� �߰��ϴ� Ʈ���� ����
--/
--CREATE OR REPLACE TRIGGER SEQ_WKR_TR
--BEFORE INSERT ON WALKER
--FOR EACH ROW
--BEGIN
--SELECT SEQ_WKR.NEXTVAL INTO :NEW.WKR_REG_NO FROM DUAL;
--END;
--/

------------------------- ������ �߰�-----------------------------
-- ���� ������ �߰�
INSERT INTO OWNER(OWN_ID, OWN_PWD, OWN_NAME, OWN_ADDR, OWN_EMAIL, OWN_TEL, OWN_BTH_DT, OWN_GDR, MB_CLF_CD) VALUES('test', '1234', 'ȫ�浿', '���� ���빮��', 'hong@korea.kr', '010-1234-1234', '2000-01-01', 'M', '1');
INSERT INTO OWNER(OWN_ID, OWN_PWD, OWN_NAME, OWN_ADDR, OWN_EMAIL, OWN_TEL, OWN_BTH_DT, OWN_GDR, MB_CLF_CD) VALUES('TEST2', '1234', '�Ӳ���', '���� ���빮��', 'lim@korea.kr', '010-4321-4321', '2000-02-02', 'M', '1');
-- ���� ������ �߰�
INSERT INTO BOOKING(MBD_NO, WKR_REG_NO, WKR_ID) VALUES('1','1', 'seo');
-- ���� ������ �߰�
INSERT INTO DOG(DOG_NAME, DOG_GDR, DOG_KIND, DOG_SIZE, DOG_AGE, DOG_LEN, DOG_WGT, DOG_NTL_CHK, DOG_AGG, DOG_CHR, DOG_MD_HST, DOG_PHT_NM, OWN_REG_NO, OWN_ID) 
VALUES('���', 'M', '��� ��Ʈ����', 'BIG', 5, 1.0, 20, 'Y', 'LOW', '���� �� ����', '����', 'DOG0001', '1', 'test');
-- ���� ������ �߰�
INSERT INTO WALKER(WKR_ID, WKR_PWD, WKR_NAME, WKR_ADDR, WKR_EMAIL, WKR_TEL, WKR_GDR, WKR_BTH_DT, WKR_RS_CNT, WKR_PHT_NM, WKR_RS_EX, WKR_CAREER, WKR_DEL, MB_CLF_CD) 
VALUES('seo', '1234', '������', '���� ���빮', 'seo@korea.kr', '010-1234-4321', 'M', '1980-01-01', 3, 'WKR_001', '������ Ű����', '��� ����', 'N', '2');
-- ���� ������ �߰�
INSERT INTO NOTICE(NT_SBJT, NT_CONT, NT_RD_CNT, MNG_ID) 
VALUES('����', '���� ����', '1', 'master');
-- ���� ������ �߰�, �ð� �Է� �� TO_DATE �Լ��� �޾ƾ� �� ��
INSERT INTO MBOARD(MBD_STR_DT, MBD_FN_DT, MBD_SBJT, MBD_CONT, MBD_REG_DT, MBD_RD_CNT, OWN_REG_NO, OWN_ID) 
VALUES('2021-06-15', '2021-06-16', '��Ī ����', '��Ī ����', SYSDATE, 1, '1', 'test');

INSERT INTO MBOARD(MBD_STR_DT, MBD_FN_DT, MBD_SBJT, MBD_CONT, MBD_REG_DT, MBD_RD_CNT, OWN_REG_NO, OWN_ID) 
VALUES('2021-06-15', '2021-06-16', 'testtest', 'testtest', SYSDATE, 1, '1', 'test');

-- ���� ���̺� ��ȸ
SELECT * FROM OWNER;
-- ������ ���̺� ��ȸ
SELECT * FROM DOG;
-- ����� ���̺� ��ȸ
SELECT * FROM WALKER;
-- �������� ���̺� ��ȸ
SELECT * FROM NOTICE;
-- ��Ī �Խ��� ���̺� ��ȸ
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