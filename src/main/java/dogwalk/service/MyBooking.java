package dogwalk.service;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dogwalk.dao.BookingDao;
import dogwalk.model.Booking;

public class MyBooking implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		HttpSession session = request.getSession();
		String mb_clf_cd = (String)session.getAttribute("mb_clf_cd"); // request 값
		String pageNum = request.getParameter("pageNum");
		
		int result = 0;
		if(mb_clf_cd.equals("1")) {
			result = 1;
			String own_reg_no = (String)session.getAttribute("own_reg_no");
			String own_id = (String)session.getAttribute("own_id");
			request.setAttribute("own_reg_no", own_reg_no);
			request.setAttribute("own_id", own_id);
			request.setAttribute("pageNum", pageNum);
		} else {
			result = 2;
			String wkr_reg_no = (String)session.getAttribute("wkr_reg_no");
			String wkr_id = (String)session.getAttribute("wkr_id");
			request.setAttribute("wkr_reg_no", wkr_reg_no);
			request.setAttribute("wkr_id", wkr_id);
			request.setAttribute("pageNum", pageNum);
		}
		request.setAttribute("result", result);
		return "booking/myBooking";
	}

}
