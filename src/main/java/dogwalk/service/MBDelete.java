package dogwalk.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dogwalk.dao.MBoardDao;

public class MBDelete implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String mbd_no = request.getParameter("mbd_no");
		String pageNum = request.getParameter("pageNum");
		
		MBoardDao mbd = MBoardDao.getInstance();
		int result = mbd.delete(mbd_no);
		
		request.setAttribute("result", result);
		request.setAttribute("pageNum", pageNum);
		
		return "mboard/mbDelete";
	}

}
