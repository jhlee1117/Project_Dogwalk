package dogwalk.service;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dogwalk.dao.LicenseDao;
import dogwalk.dao.WalkerDao;
import dogwalk.model.License;
import dogwalk.model.Walker;

public class UpdateFormWalker implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		
		HttpSession session = request.getSession();
		String wkr_id = (String)session.getAttribute("wkr_id");		
		
		WalkerDao wd = WalkerDao.getInstance();
		Walker walker = wd.selectWalker(wkr_id);
		request.setAttribute("walker", walker);
		
		LicenseDao ld = LicenseDao.getInstance();
		List<License> licenselst = ld.selectLicense(wkr_id);
		request.setAttribute("licenselst", licenselst);
		
		// 6월 7일
		String wkr_reg_no = walker.getWkr_reg_no();
		session.setAttribute("wkr_reg_no", wkr_reg_no);
		return "mypage/updateFormWalker";
	}

}
