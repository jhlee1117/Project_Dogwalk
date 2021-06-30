package dogwalk.service;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dogwalk.dao.LicenseDao;
import dogwalk.model.License;

public class ConfirmLc implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {

		String lc_cd = request.getParameter("lc_cd"); // 중복체크한 자격증 속성
		String msg = "";
		LicenseDao ld = LicenseDao.getInstance();
		License license = ld.selectLc(lc_cd);
		
		if (license == null)
			msg = "등록 가능한 자격증입니다.";
		else 
			msg = "이미 등록된 자격증이므로, 등록이 불가능합니다.";
		
		request.setAttribute("msg", msg);
		
		return "mypage/confirmLc";
	}

}
