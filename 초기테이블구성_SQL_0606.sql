-- 테이블 생성 및 PK 조건 외 DEFAULT 값과 입력 제약조건 옵션이 추가가 된 쿼리입니다.
-- FK는 별도로 지정이 안 되어 있으며, 동일한 컬럼명만 테이블별로 생성 되었습니다.

-- 조인이 필요한 경우 각 모델에 따라, FK 관계 생성하면 됩니다.
-- CONSTRAINT [제약조건 명] FOREIGN KEY([컬럼명])
-- REFERENCES [참조할 테이블 이름]([참조할 컬럼])
-- [ON DELETE CASCADE | ON DELETE SET NULL]

-- MEMBER 테이블은 2가지 종류 값 밖에 없으므로 미리 삽입 바랍니다.

--테이블 모두 삭제
DROP TABLE BOOKING;
DROP TABLE DOG;
DROP TABLE LICENSE;
DROP TABLE MANAGER;
DROP TABLE MBOARD;
DROP TABLE MEMBER;
DROP TABLE NOTICE;
DROP TABLE OWNER;
DROP TABLE WALKER;

-- 예약 테이블 생성
CREATE TABLE BOOKING
(
    BK_NO    VARCHAR2(10) NOT NULL,
    MBD_NO    VARCHAR2(10) NOT NULL,
    BK_MC_CHK    CHAR(1) DEFAULT 'N' NOT NULL,
    BK_CHK    CHAR(1) DEFAULT 'N' NOT NULL,
    WKR_REG_NO    VARCHAR2(10) NOT NULL,
    WKR_ID    VARCHAR2(20) NOT NULL
);

COMMENT ON COLUMN BOOKING.BK_NO IS '예약일련번호';

COMMENT ON COLUMN BOOKING.MBD_NO IS '게시글일련번호';

COMMENT ON COLUMN BOOKING.BK_MC_CHK IS '매칭여부';

COMMENT ON COLUMN BOOKING.BK_CHK IS '예약여부';

COMMENT ON COLUMN BOOKING.WKR_REG_NO IS '도우미등록번호';

COMMENT ON COLUMN BOOKING.WKR_ID IS '도우미ID';

COMMENT ON TABLE BOOKING IS '예약';
-- 예약 테이블 PK 인덱스 생성
CREATE UNIQUE INDEX IDX_BK_PK ON BOOKING
( BK_NO );

ALTER TABLE BOOKING
DROP PRIMARY KEY;
-- 예약 테이블 PK 조건 추가
ALTER TABLE BOOKING
 ADD CONSTRAINT BK_PK PRIMARY KEY ( BK_NO )
 USING INDEX IDX_BK_PK;
-- 예약여부 확인을 위한 제약조건 추가
ALTER TABLE BOOKING
 ADD CONSTRAINT BK_CHK_YN CHECK (BK_CHK IN ('Y','N'));
-- 예약여부 확인 초기값 설정 'N'
ALTER TABLE BOOKING
 MODIFY BK_CHK DEFAULT 'N';
-- 매칭여부 확인을 위한 제약조건 추가
ALTER TABLE BOOKING
 ADD CONSTRAINT BK_MC_CHK_YN CHECK (BK_MC_CHK IN ('Y','N'));
-- 매칭여부 확인 초기값 설정 'N'
ALTER TABLE BOOKING
 MODIFY BK_MC_CHK DEFAULT 'N';


-- 애견 테이블 생성
CREATE TABLE DOG
(
    DOG_NO    VARCHAR2(10) NOT NULL,
    DOG_NAME    VARCHAR2(10) NOT NULL,
    DOG_GDR    CHAR(1) DEFAULT 'm' NOT NULL,
    DOG_KIND    VARCHAR2(30) NOT NULL,
    DOG_SIZE    VARCHAR2(10) NOT NULL,
    DOG_AGE    NUMBER NOT NULL,
    DOG_LEN    NUMBER NOT NULL,
    DOG_WGT    NUMBER NOT NULL,
    DOG_NTL_CHK    CHAR(1) DEFAULT 'N' NOT NULL,
    DOG_AGG    VARCHAR2(10) NOT NULL,
    DOG_CHR    VARCHAR2(1000),
    DOG_MD_HST    VARCHAR2(1000),
    DOG_PHT_NM    VARCHAR2(50) NOT NULL,
    OWN_REG_NO    VARCHAR2(10) NOT NULL,
    OWN_ID    VARCHAR2(20) NOT NULL
);

COMMENT ON COLUMN DOG.DOG_NO IS '강아지일련번호';

COMMENT ON COLUMN DOG.DOG_NAME IS '강아지이름';

COMMENT ON COLUMN DOG.DOG_GDR IS '성별';

COMMENT ON COLUMN DOG.DOG_KIND IS '품종';

COMMENT ON COLUMN DOG.DOG_SIZE IS '분류';

COMMENT ON COLUMN DOG.DOG_AGE IS '나이';

COMMENT ON COLUMN DOG.DOG_LEN IS '길이';

COMMENT ON COLUMN DOG.DOG_WGT IS '몸무게';

COMMENT ON COLUMN DOG.DOG_NTL_CHK IS '중성화';

COMMENT ON COLUMN DOG.DOG_AGG IS '공격성';

COMMENT ON COLUMN DOG.DOG_CHR IS '특징';

COMMENT ON COLUMN DOG.DOG_MD_HST IS '병력사항';

COMMENT ON COLUMN DOG.DOG_PHT_NM IS '강아지 사진명';

COMMENT ON COLUMN DOG.OWN_REG_NO IS '견주등록번호';

COMMENT ON COLUMN DOG.OWN_ID IS '견주ID';

COMMENT ON TABLE DOG IS '강아지';
-- 애견 테이블 PK 인덱스 생성
CREATE UNIQUE INDEX IDX_DOG_PK ON DOG
( DOG_NO );

ALTER TABLE DOG
DROP PRIMARY KEY;
-- 애견 테이블 PK 조건 추가
ALTER TABLE DOG
 ADD CONSTRAINT DOG_PK PRIMARY KEY ( DOG_NO )
 USING INDEX IDX_DOG_PK;
-- 애견 성별 구분 코드 입력 조건 M과 F로 구분하는 제약조건
ALTER TABLE DOG
 ADD CONSTRAINT DOG_GDR_CHK CHECK (DOG_GDR IN ('M', 'F'));
-- 애견 성별 구분 초기 M으로 설정
ALTER TABLE DOG
 MODIFY DOG_GDR DEFAULT 'M';
 -- 애견 중성화 입력 조건 여부 구분하는 제약조건
ALTER TABLE DOG
 ADD CONSTRAINT DOG_NTL_CHK_CLF CHECK (DOG_NTL_CHK IN ('Y', 'N'));
-- 애견 중성화 구분 초기 'N'으로 설정
ALTER TABLE DOG
 MODIFY DOG_NTL_CHK DEFAULT 'N';
-- 애견 크기 분류 시 입력하는 데이터 제약조건
ALTER TABLE DOG
 ADD CONSTRAINT DOG_SIZE_CLF CHECK (DOG_SIZE IN ('BIG', 'MEDIUM', 'SMALL'));
-- 애견 분류 초기 'SMALL'로 설정
ALTER TABLE DOG
 MODIFY DOG_SIZE DEFAULT 'SMALL';
 -- 애견 공격성 분류 시 입력하는 데이터 제약조건
ALTER TABLE DOG
 ADD CONSTRAINT DOG_AGG_CLF CHECK (DOG_AGG IN ('HIGH', 'AVERAGE', 'LOW'));
-- 애견 공격성 초기 'SMALL'로 설정
ALTER TABLE DOG
 MODIFY DOG_AGG DEFAULT 'LOW';


-- 자격증 테이블 생성
CREATE TABLE LICENSE
(
    LC_CD    VARCHAR2(10) NOT NULL,
    LC_ISS_OGZ    VARCHAR2(100) NOT NULL,
    LC_NAME    VARCHAR2(10) NOT NULL,
    WKR_REG_NO    VARCHAR2(10) NOT NULL,
    WKR_ID    VARCHAR2(20) NOT NULL
);

COMMENT ON COLUMN LICENSE.LC_CD IS '자격증일련번호';

COMMENT ON COLUMN LICENSE.LC_ISS_OGZ IS '발급기관';

COMMENT ON COLUMN LICENSE.LC_NAME IS '자격증이름';

COMMENT ON COLUMN LICENSE.WKR_REG_NO IS '도우미등록번호';

COMMENT ON COLUMN LICENSE.WKR_ID IS '도우미ID';

COMMENT ON TABLE LICENSE IS '자격증';
-- 자격증 테이블 PK 인덱스 생성
CREATE UNIQUE INDEX IDX_LC_PK ON LICENSE
( LC_CD );

ALTER TABLE LICENSE
DROP PRIMARY KEY;
-- 자격증 테이블 PK 조건 추가
ALTER TABLE LICENSE
 ADD CONSTRAINT LC_PK PRIMARY KEY ( LC_CD )
 USING INDEX IDX_LC_PK;



-- 관리자 테이블 생성
CREATE TABLE MANAGER
(
    MNG_ID    VARCHAR2(20) NOT NULL,
    MNG_PWD    VARCHAR2(20) NOT NULL
);

COMMENT ON COLUMN MANAGER.MNG_ID IS '관리자ID';

COMMENT ON COLUMN MANAGER.MNG_PWD IS '비밀번호';

COMMENT ON TABLE MANAGER IS '관리자';
-- 관리자 테이블 PK 인덱스 생성
CREATE UNIQUE INDEX IDX_MNG_PK ON MANAGER
( MNG_ID );

ALTER TABLE MANAGER
DROP PRIMARY KEY;
-- 관리자 테이블 PK 조건 추가
ALTER TABLE MANAGER
 ADD CONSTRAINT MNG_PK PRIMARY KEY ( MNG_ID )
 USING INDEX IDX_MNG_PK;



-- 매칭게시판 테이블 생성
CREATE TABLE MBOARD
(
    MBD_NO    VARCHAR2(10) NOT NULL,
    MBD_STR_DT    DATE NOT NULL,
    MBD_FN_DT    DATE NOT NULL,
    MBD_SBJT    VARCHAR2(100) NOT NULL,
    MBD_CONT    VARCHAR2(1000) NOT NULL,
    MBD_REG_DT    DATE NOT NULL,
    MBD_RD_CNT    NUMBER NOT NULL,
    MBD_DEL    CHAR(1) NOT NULL,
    OWN_REG_NO    VARCHAR2(10) NOT NULL,
    OWN_ID    VARCHAR2(20) NOT NULL
);

COMMENT ON COLUMN MBOARD.MBD_NO IS '게시글일련번호';

COMMENT ON COLUMN MBOARD.MBD_STR_DT IS '시작날짜';

COMMENT ON COLUMN MBOARD.MBD_FN_DT IS '종료날짜';

COMMENT ON COLUMN MBOARD.MBD_SBJT IS '제목';

COMMENT ON COLUMN MBOARD.MBD_CONT IS '내용';

COMMENT ON COLUMN MBOARD.MBD_REG_DT IS '작성일';

COMMENT ON COLUMN MBOARD.MBD_RD_CNT IS '조회수';

COMMENT ON COLUMN MBOARD.MBD_DEL IS '삭제여부';

COMMENT ON COLUMN MBOARD.OWN_REG_NO IS '견주등록번호';

COMMENT ON COLUMN MBOARD.OWN_ID IS '견주ID';

COMMENT ON TABLE MBOARD IS '매칭 게시판';
-- 매칭 게시판 테이블 PK 인덱스 생성
CREATE UNIQUE INDEX IDX_MBD_PK ON MBOARD
( MBD_NO );

ALTER TABLE MBOARD
DROP PRIMARY KEY;
-- 매칭 게시판 테이블 PK 인덱스 조건 추가
ALTER TABLE MBOARD
 ADD CONSTRAINT MBD_PK PRIMARY KEY ( MBD_NO )
 USING INDEX IDX_MBD_PK;

-- 매칭글 작성여부 확인 제약조건
ALTER TABLE MBOARD
 ADD CONSTRAINT MBD_DEL_YN CHECK(MBD_DEL IN ('Y', 'N'));
-- 매칭글 작성여부 초기값 'N'
ALTER TABLE MBOARD
 MODIFY MBD_DEL DEFAULT 'N';

ALTER TABLE MBOARD
 MODIFY MBD_REG_DT DEFAULT SYSDATE;

-- 회원 테이블 생성
CREATE TABLE MEMBER
(
    MB_CLF_CD    CHAR(1) NOT NULL
);

COMMENT ON COLUMN MEMBER.MB_CLF_CD IS '회원구분코드';

COMMENT ON TABLE MEMBER IS '회원';
-- 회원 테이블 PK 인덱스 생성
CREATE UNIQUE INDEX IDX_MB_PK ON MEMBER
( MB_CLF_CD );

ALTER TABLE MEMBER
DROP PRIMARY KEY;
-- 회원 테이블 PK 조건 추가
ALTER TABLE MEMBER
 ADD CONSTRAINT MB_PK PRIMARY KEY ( MB_CLF_CD )
 USING INDEX IDX_MB_PK;

-- 회원구분 코드 입력 조건 1과 2로 구분 추가
ALTER TABLE MEMBER
 ADD CONSTRAINT MB_CLF_CD_CHK CHECK (MB_CLF_CD IN ('1', '2'));
-- 회원구분 코드 입력초기 조건은 '1'로 설정
ALTER TABLE MEMBER
 MODIFY MB_CLF_CD DEFAULT '1';
-- 회원구분 코드는 2가지 밖에 없으므로 미리 입력해 놓음
INSERT INTO MEMBER VALUES('1');
INSERT INTO MEMBER VALUES('2');
select * from member;


-- 공지사항 테이블 생성
CREATE TABLE NOTICE
(
    NT_NO    VARCHAR2(10) NOT NULL,
    NT_SBJT    VARCHAR2(100) NOT NULL,
    NT_CONT    VARCHAR2(1000) NOT NULL,
    NT_REG_DT    DATE NOT NULL,
    NT_RD_CNT    NUMBER NOT NULL,
    NT_DEL    CHAR(1) DEFAULT 'N' NOT NULL,
    MNG_ID    VARCHAR2(20) NOT NULL
);

COMMENT ON COLUMN NOTICE.NT_NO IS '일련번호';

COMMENT ON COLUMN NOTICE.NT_SBJT IS '제목';

COMMENT ON COLUMN NOTICE.NT_CONT IS '내용';

COMMENT ON COLUMN NOTICE.NT_REG_DT IS '작성일';

COMMENT ON COLUMN NOTICE.NT_RD_CNT IS '조회수';

COMMENT ON COLUMN NOTICE.NT_DEL IS '삭제여부';

COMMENT ON COLUMN NOTICE.MNG_ID IS '관리자ID';

COMMENT ON TABLE NOTICE IS '공지사항';
-- 공지사항 테이블 PK 인덱스 생성
CREATE UNIQUE INDEX IDX_NT_PK ON NOTICE
( NT_NO );

ALTER TABLE NOTICE
DROP PRIMARY KEY;
-- 공지사항 테이블 PK 조건 추가
ALTER TABLE NOTICE
 ADD CONSTRAINT NT_PK PRIMARY KEY ( NT_NO )
 USING INDEX IDX_NT_PK;

-- 공지사항 작성일 기본 조건 SYSDATE 추가
ALTER TABLE NOTICE
 MODIFY NT_REG_DT DEFAULT SYSDATE;

-- 공지사항 삭제여부에 대한 제약조건 설정
ALTER TABLE NOTICE
 ADD CONSTRAINT NT_DEL_YN CHECK (NT_DEL IN ('Y','N'));

-- 공지사항 삭제여부에 기본 값 'N'
ALTER TABLE NOTICE
 MODIFY NT_DEL DEFAULT 'N';


-- 견주 테이블 생성
CREATE TABLE OWNER
(
    OWN_REG_NO    VARCHAR2(10) NOT NULL,
    OWN_ID    VARCHAR2(20) NOT NULL,
    OWN_PWD    VARCHAR2(20) NOT NULL,
    OWN_NAME    VARCHAR2(10) NOT NULL,
    OWN_ADDR    VARCHAR2(50) NOT NULL,
    OWN_EMAIL    VARCHAR2(50) NOT NULL,
    OWN_TEL    VARCHAR2(20) NOT NULL,
    OWN_BTH_DT    DATE NOT NULL,
    OWN_GDR    CHAR(1) DEFAULT 'm' NOT NULL,
    OWN_REG_DT    DATE NOT NULL,
    OWN_DEL    CHAR(1) DEFAULT 'N' NOT NULL,
    MB_CLF_CD    CHAR(1) NOT NULL
);

COMMENT ON COLUMN OWNER.OWN_REG_NO IS '견주등록번호';

COMMENT ON COLUMN OWNER.OWN_ID IS '견주ID';

COMMENT ON COLUMN OWNER.OWN_PWD IS '비밀번호';

COMMENT ON COLUMN OWNER.OWN_NAME IS '이름';

COMMENT ON COLUMN OWNER.OWN_ADDR IS '주소';

COMMENT ON COLUMN OWNER.OWN_EMAIL IS '이메일';

COMMENT ON COLUMN OWNER.OWN_TEL IS '전화번호';

COMMENT ON COLUMN OWNER.OWN_BTH_DT IS '생년월일';

COMMENT ON COLUMN OWNER.OWN_GDR IS '성별';

COMMENT ON COLUMN OWNER.OWN_REG_DT IS '가입일';

COMMENT ON COLUMN OWNER.OWN_DEL IS '견주탈퇴여부';

COMMENT ON COLUMN OWNER.MB_CLF_CD IS '회원구분코드';

COMMENT ON TABLE OWNER IS '견주';
-- 견주 테이블 PK 인덱스 생성
CREATE UNIQUE INDEX IDX_OWN_PK ON OWNER
( OWN_REG_NO,OWN_ID );

ALTER TABLE OWNER
DROP PRIMARY KEY;
-- 견주 테이블 PK 조건 추가 (2개)
ALTER TABLE OWNER
 ADD CONSTRAINT OWN_PK PRIMARY KEY ( OWN_REG_NO,OWN_ID )
 USING INDEX IDX_OWN_PK;

-- 견주 테이블 성별 제약조건
ALTER TABLE OWNER
 ADD CONSTRAINT OWN_GDR_CLF CHECK(OWN_GDR IN('M','F'));

-- 견주 테이블 성별 초기값 'M'
ALTER TABLE OWNER
 MODIFY OWN_GDR DEFAULT 'M';

-- 견주 테이블 가입일 초기값
ALTER TABLE OWNER
 MODIFY OWN_REG_DT DEFAULT SYSDATE;

-- 견주 테이블 탈퇴여부
ALTER TABLE OWNER
 ADD CONSTRAINT OWN_DEL_CHK CHECK(OWN_DEL IN('Y','N'));

-- 견주 테이블 탈퇴여부 초기값 'N'
ALTER TABLE OWNER
 MODIFY OWN_DEL DEFAULT 'N';



-- 도우미 테이블 생성
CREATE TABLE WALKER
(
    WKR_REG_NO    VARCHAR2(10) NOT NULL,
    WKR_ID    VARCHAR2(20) NOT NULL,
    WKR_PWD    VARCHAR2(20) NOT NULL,
    WKR_NAME    VARCHAR2(10) NOT NULL,
    WKR_ADDR    VARCHAR2(50) NOT NULL,
    WKR_EMAIL    VARCHAR2(50) NOT NULL,
    WKR_TEL    VARCHAR2(20) NOT NULL,
    WKR_GDR    CHAR(1) NOT NULL,
    WKR_BTH_DT    DATE NOT NULL,
    WKR_RS_CNT    NUMBER NOT NULL,
    WKR_GD    CHAR(1) NOT NULL,
    WKR_PHT_NM    VARCHAR2(50) NOT NULL,
    WKR_RS_EX    VARCHAR2(1000),
    WKR_CAREER    VARCHAR2(1000),
    WKR_DEL    CHAR(1) NOT NULL,
    WKR_REG_DT    DATE NOT NULL,
    MB_CLF_CD    CHAR(1) NOT NULL
);

COMMENT ON COLUMN WALKER.WKR_REG_NO IS '도우미등록번호';

COMMENT ON COLUMN WALKER.WKR_ID IS '도우미ID';

COMMENT ON COLUMN WALKER.WKR_PWD IS '비밀번호';

COMMENT ON COLUMN WALKER.WKR_NAME IS '이름';

COMMENT ON COLUMN WALKER.WKR_ADDR IS '주소';

COMMENT ON COLUMN WALKER.WKR_EMAIL IS '이메일';

COMMENT ON COLUMN WALKER.WKR_TEL IS '전화번호';

COMMENT ON COLUMN WALKER.WKR_GDR IS '성별';

COMMENT ON COLUMN WALKER.WKR_BTH_DT IS '생년월일';

COMMENT ON COLUMN WALKER.WKR_RS_CNT IS '양육년수';

COMMENT ON COLUMN WALKER.WKR_GD IS '도우미 등급';

COMMENT ON COLUMN WALKER.WKR_PHT_NM IS '도우미 사진명';

COMMENT ON COLUMN WALKER.WKR_RS_EX IS '양육경험';

COMMENT ON COLUMN WALKER.WKR_CAREER IS '경력사항';

COMMENT ON COLUMN WALKER.WKR_DEL IS '도우미탈퇴여부';

COMMENT ON COLUMN WALKER.WKR_REG_DT IS '가입일';

COMMENT ON COLUMN WALKER.MB_CLF_CD IS '회원구분코드';

COMMENT ON TABLE WALKER IS '도우미';
-- 도우미 테이블 PK 인덱스 생성
CREATE UNIQUE INDEX IDX_WKR_PK ON WALKER
( WKR_REG_NO,WKR_ID );

ALTER TABLE WALKER
DROP PRIMARY KEY;
-- 도우미 테이블 PK 조건 추가 (2개)
ALTER TABLE WALKER
 ADD CONSTRAINT WKR_PK PRIMARY KEY ( WKR_REG_NO,WKR_ID )
 USING INDEX IDX_WKR_PK;

-- 도우미 성별 제약조건
ALTER TABLE WALKER
 ADD CONSTRAINT WKR_GDR_CLF CHECK (WKR_GDR IN ('M', 'F'));

-- 도우미 성별 제약조건 초기값 'M'
ALTER TABLE WALKER
 MODIFY WKR_GDR DEFAULT 'M';
 
-- 도우미 탈퇴여부 확인 제약조건
ALTER TABLE WALKER
 ADD CONSTRAINT WKR_DEL_YN CHECK(WKR_DEL IN ('Y', 'N'));

-- 도우미 탈퇴여부 확인 제약조건 초기값 'N'
ALTER TABLE WALKER
 MODIFY WKR_DEL DEFAULT 'N';
 
-- 도우미 등급 제약조건 A,B,C
ALTER TABLE WALKER
 ADD CONSTRAINT WKR_GD_CLF CHECK(WKR_GD IN ('A', 'B', 'C'));
-- 도우미 등급 제약조건 초기값 'C'
ALTER TABLE WALKER
 MODIFY WKR_GD DEFAULT 'C';
-- 가입일 초기값
ALTER TABLE WALKER
 MODIFY WKR_REG_DT DEFAULT SYSDATE;
 

-- (6/5 자격증 테이블 관련 형식 및 사이즈 변경) 
-- 자격증 번호 크기 증가
ALTER TABLE LICENSE
MODIFY(LC_CD VARCHAR2(30));
-- 자격증명 크기 증가
ALTER TABLE LICENSE
MODIFY(LC_NAME VARCHAR2(100));




COMMIT;