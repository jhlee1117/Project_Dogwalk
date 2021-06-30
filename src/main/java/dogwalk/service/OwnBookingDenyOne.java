package dogwalk.service;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dogwalk.dao.BookingDao;

public class OwnBookingDenyOne implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
			String bk_no = request.getParameter("bk_no");
			String mbd_no = request.getParameter("mbd_no");
			
			BookingDao bd = BookingDao.getInstance();
			int result = bd.denyOne(bk_no);
			
			request.setAttribute("result", result);
			request.setAttribute("mbd_no", mbd_no);
	
		return "booking/bookingDenyOne";
	}

}
