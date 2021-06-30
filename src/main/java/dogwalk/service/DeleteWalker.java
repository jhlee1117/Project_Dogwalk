package dogwalk.service;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dogwalk.dao.WalkerDao;

public class DeleteWalker implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		
		HttpSession session = request.getSession();
		String wkr_id = (String) session.getAttribute("wkr_id");
		System.out.println(wkr_id);
		
		WalkerDao wd = WalkerDao.getInstance();
		if (wkr_id != null) {
			int result = wd.deleteWalker(wkr_id);
			if (result > 0)
				session.invalidate();
			request.setAttribute("result", result);
		}
		
		return "mypage/deleteWalker";
		
	}

}
