package dogwalk.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dogwalk.dao.MBoardDao;
import dogwalk.model.MBoard;

public class MBView implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String mb_clf_cd = (String)session.getAttribute("mb_clf_cd");
		int result = 0;
		int readcount = 0;
		if(mb_clf_cd.equals("1")) {
			result = 1;
		} else {
			result = 2;
		}
		
		String mbd_no = request.getParameter("mbd_no");
		
		MBoardDao md = MBoardDao.getInstance();
		readcount = md.readCountUpdate(mbd_no);
		
		request.setAttribute("result", result);
		request.setAttribute("mbd_no", mbd_no);
		return "booking/confirmBooking";
	}

}
