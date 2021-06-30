package dogwalk.service;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dogwalk.dao.NoticeDao;
import dogwalk.model.Notice;

public class ManagerNoticeUpdateForm implements CommandProcess {
	@Override
	// 글씨 깨지지 않게 인코딩
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {	}

		
		String nt_no = request.getParameter("nt_no");
		String pageNum = request.getParameter("pageNum");
		
		NoticeDao nd = NoticeDao.getInstance();
		Notice notice = nd.select(nt_no);
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("notice", notice);
		
		return "manager/managerNoticeUpdateForm";
	}
}
