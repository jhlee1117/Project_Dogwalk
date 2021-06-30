package dogwalk.service;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dogwalk.dao.OwnerDao;

public class DeleteOwner implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		
		HttpSession session = request.getSession();
		String own_id = (String) session.getAttribute("own_id");
		System.out.println(own_id);
		
		OwnerDao od = OwnerDao.getInstance();
		if (own_id != null) {
			int result = od.deleteOwner(own_id);
			if (result > 0)
				session.invalidate();
			request.setAttribute("result", result);
		}
		
		return "mypage/deleteOwner";
	}

}
