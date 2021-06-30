package dogwalk.model;

import java.sql.Date;

public class Booking {
	private String bk_no;
	private String mbd_no;
	private String bk_mc_chk;
	private String bk_chk;
	private String wkr_reg_no;
	private String wkr_id;
	private String mbd_sbjt;
	private Date mbd_reg_dt;
	private String own_id;
	
	public Date getMbd_reg_dt() {
		return mbd_reg_dt;
	}
	public void setMbd_reg_dt(Date mbd_reg_dt) {
		this.mbd_reg_dt = mbd_reg_dt;
	}
	public String getOwn_id() {
		return own_id;
	}
	public void setOwn_id(String own_id) {
		this.own_id = own_id;
	}
	public String getMbd_sbjt() {
		return mbd_sbjt;
	}
	public void setMbd_sbjt(String mbd_sbjt) {
		this.mbd_sbjt = mbd_sbjt;
	}
	public String getBk_no() {
		return bk_no;
	}
	public void setBk_no(String bk_no) {
		this.bk_no = bk_no;
	}
	public String getMbd_no() {
		return mbd_no;
	}
	public void setMbd_no(String mbd_no) {
		this.mbd_no = mbd_no;
	}
	public String getBk_mc_chk() {
		return bk_mc_chk;
	}
	public void setBk_mc_chk(String bk_mc_chk) {
		this.bk_mc_chk = bk_mc_chk;
	}
	public String getBk_chk() {
		return bk_chk;
	}
	public void setBk_chk(String bk_chk) {
		this.bk_chk = bk_chk;
	}
	public String getWkr_reg_no() {
		return wkr_reg_no;
	}
	public void setWkr_reg_no(String wkr_reg_no) {
		this.wkr_reg_no = wkr_reg_no;
	}
	public String getWkr_id() {
		return wkr_id;
	}
	public void setWkr_id(String wkr_id) {
		this.wkr_id = wkr_id;
	}
}
