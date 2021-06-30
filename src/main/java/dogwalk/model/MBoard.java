package dogwalk.model;
import java.sql.Date;
public class MBoard { // DTO, VO
/*
MBD_NO		VARCHAR2(10)	매칭글 번호
MBD_STR_DT	DATE			매칭 시작 시일
MBD_FN_DT	DATE			매칭 끝 시일
MBD_SBJT	VARCHAR2(100)	매칭글 제목
MBD_CONT	VARCHAR2(1000)	매칭글 내용
MBD_REG_DT	DATE			매칭글 작성일
MBD_RD_CNT	NUMBER			매칭글 조회수
MBD_DEL		CHAR(1)			매칭글 삭제
OWN_REG_NO	VARCHAR2(10)	견주등록번호
OWN_ID		VARCHAR2(20)	견주아이디
*/
	private String mbd_no;
	private Date mbd_str_dt;
	private Date mbd_fn_dt;
	private String mbd_sbjt;
	private String mbd_cont;
	private Date mbd_reg_dt;
	private int mbd_rd_cnt;
	private String mbd_del;
	private String own_reg_no;
	private String own_id;
	private String dog_no;
//	private String bk_mc_chk;
//	private String bk_chk;
	
public String getDog_no() {
		return dog_no;
	}
	public void setDog_no(String dog_no) {
		this.dog_no = dog_no;
	}
	//	public String getBk_mc_chk() {
//		return bk_mc_chk;
//	}
//	public void setBk_mc_chk(String bk_mc_chk) {
//		this.bk_mc_chk = bk_mc_chk;
//	}
//	public String getBk_chk() {
//		return bk_chk;
//	}
//	public void setBk_chk(String bk_chk) {
//		this.bk_chk = bk_chk;
//	}
	public String getMbd_no() {
		return mbd_no;
	}
	public void setMbd_no(String mbd_no) {
		this.mbd_no = mbd_no;
	}
	public Date getMbd_str_dt() {
		return mbd_str_dt;
	}
	public void setMbd_str_dt(Date mbd_str_dt) {
		this.mbd_str_dt = mbd_str_dt;
	}
	public Date getMbd_fn_dt() {
		return mbd_fn_dt;
	}
	public void setMbd_fn_dt(Date mbd_fn_dt) {
		this.mbd_fn_dt = mbd_fn_dt;
	}
	public String getMbd_sbjt() {
		return mbd_sbjt;
	}
	public void setMbd_sbjt(String mbd_sbjt) {
		this.mbd_sbjt = mbd_sbjt;
	}
	public String getMbd_cont() {
		return mbd_cont;
	}
	public void setMbd_cont(String mbd_cont) {
		this.mbd_cont = mbd_cont;
	}
	public Date getMbd_reg_dt() {
		return mbd_reg_dt;
	}
	public void setMbd_reg_dt(Date mbd_reg_dt) {
		this.mbd_reg_dt = mbd_reg_dt;
	}
	public int getMbd_rd_cnt() {
		return mbd_rd_cnt;
	}
	public void setMbd_rd_cnt(int mbd_rd_cnt) {
		this.mbd_rd_cnt = mbd_rd_cnt;
	}
	public String getMbd_del() {
		return mbd_del;
	}
	public void setMbd_del(String mbd_del) {
		this.mbd_del = mbd_del;
	}
	public String getOwn_reg_no() {
		return own_reg_no;
	}
	public void setOwn_reg_no(String own_reg_no) {
		this.own_reg_no = own_reg_no;
	}
	public String getOwn_id() {
		return own_id;
	}
	public void setOwn_id(String own_id) {
		this.own_id = own_id;
	}
	

}
