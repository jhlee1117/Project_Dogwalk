package dogwalk.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dogwalk.dao.NoticeDao;
import dogwalk.model.Notice;

public class ManagerNoticeWrite implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("uft-8");
		} catch (Exception e) {}
		
		Notice notice = new Notice();
		notice.setNt_sbjt(request.getParameter("nt_sbjt"));
		notice.setNt_cont(request.getParameter("nt_cont"));
		notice.setMng_id(request.getParameter("mng_id"));
		
		String pageNum = request.getParameter("pageNum");
		NoticeDao nd = NoticeDao.getInstance();
		int result = nd.insert(notice);
		
		request.setAttribute("result", result);
		request.setAttribute("pageNum", pageNum);
		
		return "manager/managerNoticeWrite";
	}

}
