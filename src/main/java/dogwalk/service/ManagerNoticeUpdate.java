package dogwalk.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dogwalk.dao.NoticeDao;
import dogwalk.model.Notice;

public class ManagerNoticeUpdate implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (Exception e) {	}
	
		String pageNum = request.getParameter("pageNum");
		String nt_no = request.getParameter("nt_no");
		
		Notice notice = new Notice();
		notice.setNt_sbjt(request.getParameter("nt_sbjt"));
		notice.setNt_cont(request.getParameter("nt_cont"));
		notice.setNt_no(nt_no);
		NoticeDao nd = NoticeDao.getInstance();
		int result = nd.update(notice);
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("notice", notice);
		request.setAttribute("result", result);
		
		return "manager/managerNoticeUpdate";
	}
}
