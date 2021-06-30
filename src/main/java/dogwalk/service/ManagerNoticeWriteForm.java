package dogwalk.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ManagerNoticeWriteForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("uft-8");
		} catch (Exception e) {}
		
		String mng_id = request.getParameter("mng_id");
		String pageNum = request.getParameter("pageNum");
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("mng_id", mng_id);
		
		return "manager/managerNoticeWriteForm";
	}

}
