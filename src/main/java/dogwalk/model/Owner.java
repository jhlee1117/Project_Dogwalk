package dogwalk.model;
import java.sql.Date;
public class Owner {
	private String own_reg_no;
	private String own_id;
	private String own_pwd;
	private String own_name;
	private String own_addr;
	private String own_email;
	private String own_tel;
	private Date own_bth_dt;
	private String own_gdr;
	private Date own_reg_dt;
	private String own_del;
	private String mb_clf_cd;
	
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
	public String getOwn_pwd() {
		return own_pwd;
	}
	public void setOwn_pwd(String own_pwd) {
		this.own_pwd = own_pwd;
	}
	public String getOwn_name() {
		return own_name;
	}
	public void setOwn_name(String own_name) {
		this.own_name = own_name;
	}
	public String getOwn_addr() {
		return own_addr;
	}
	public void setOwn_addr(String own_addr) {
		this.own_addr = own_addr;
	}
	public String getOwn_email() {
		return own_email;
	}
	public void setOwn_email(String own_email) {
		this.own_email = own_email;
	}
	public String getOwn_tel() {
		return own_tel;
	}
	public void setOwn_tel(String own_tel) {
		this.own_tel = own_tel;
	}
	public Date getOwn_bth_dt() {
		return own_bth_dt;
	}
	public void setOwn_bth_dt(Date own_bth_dt) {
		this.own_bth_dt = own_bth_dt;
	}
	public String getOwn_gdr() {
		return own_gdr;
	}
	public void setOwn_gdr(String own_gdr) {
		this.own_gdr = own_gdr;
	}
	public Date getOwn_reg_dt() {
		return own_reg_dt;
	}
	public void setOwn_reg_dt(Date own_reg_dt) {
		this.own_reg_dt = own_reg_dt;
	}
	public String getOwn_del() {
		return own_del;
	}
	public void setOwn_del(String own_del) {
		this.own_del = own_del;
	}
	public String getMb_clf_cd() {
		return mb_clf_cd;
	}
	public void setMb_clf_cd(String mb_clf_cd) {
		this.mb_clf_cd = mb_clf_cd;
	}
}