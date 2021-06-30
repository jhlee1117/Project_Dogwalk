package dogwalk.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dogwalk.dao.ManagerDao;
import dogwalk.model.Manager;

public class ManagerLogin implements CommandProcess{
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (Exception e) {}
		
		String mng_id = request.getParameter("mng_id");
		String mng_pwd = request.getParameter("mng_pwd");
		
		ManagerDao md = ManagerDao.getInstance();
		Manager manager = md.select(mng_id);
		
		int result = 0;
		if (manager == null) {
			result = -1;
		} else {
			if (manager.getMng_pwd().equals(mng_pwd)) {
				HttpSession session = request.getSession();
				session.setAttribute("mng_id", mng_id);
				result = 1;
			} else {
					result = 0;
			}
		}
		request.setAttribute("result", result);
		return "manager/managerLogin";
	}
}
