package dogwalk.model;

import java.sql.Date;

public class Notice {
	private String nt_no;
	private String nt_sbjt;
	private String nt_cont;
	private Date nt_reg_dt;
	private int nt_rd_cnt;
	private String nt_del;
	private String mng_id;
	
	public String getNt_no() {
		return nt_no;
	}
	public void setNt_no(String nt_no) {
		this.nt_no = nt_no;
	}
	public String getNt_sbjt() {
		return nt_sbjt;
	}
	public void setNt_sbjt(String nt_sbjt) {
		this.nt_sbjt = nt_sbjt;
	}
	public String getNt_cont() {
		return nt_cont;
	}
	public void setNt_cont(String nt_cont) {
		this.nt_cont = nt_cont;
	}
	public Date getNt_reg_dt() {
		return nt_reg_dt;
	}
	public void setNt_reg_dt(Date nt_reg_dt) {
		this.nt_reg_dt = nt_reg_dt;
	}
	public int getNt_rd_cnt() {
		return nt_rd_cnt;
	}
	public void setNt_rd_cnt(int nt_rd_cnt) {
		this.nt_rd_cnt = nt_rd_cnt;
	}
	public String getNt_del() {
		return nt_del;
	}
	public void setNt_del(String nt_del) {
		this.nt_del = nt_del;
	}
	public String getMng_id() {
		return mng_id;
	}
	public void setMng_id(String mng_id) {
		this.mng_id = mng_id;
	}
}
