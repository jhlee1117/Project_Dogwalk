package dogwalk.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dogwalk.dao.NoticeDao;

public class ManagerNoticeDelete implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String nt_no = request.getParameter("nt_no");
		String pageNum = request.getParameter("pageNum");
		
		NoticeDao nd = NoticeDao.getInstance();
		int result = nd.delete(nt_no);
		
		request.setAttribute("result", result);
		request.setAttribute("pageNum", pageNum);
		
		return "manager/managerNoticeDelete";
	}
}
