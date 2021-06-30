package dogwalk.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dogwalk.dao.BookingDao;
import dogwalk.model.Booking;

public class OwnBookingAccept implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String bk_no = request.getParameter("bk_no");
		String mbd_no = request.getParameter("mbd_no");
		
		BookingDao bd = BookingDao.getInstance();
		int bkcount = bd.bkcount(mbd_no);
		
		if (bkcount == 1) {
			Booking booking = new Booking();
			booking.setBk_no(bk_no);
			int result = bd.acceptOne(booking);
			request.setAttribute("bk_no", bk_no);
			request.setAttribute("mbd_no", mbd_no);
			request.setAttribute("result", result);
			
			return "booking/bookingAcceptOne";
					
		} else {
			Booking booking = new Booking();
			booking.setBk_no(bk_no);
			int result = bd.accept(booking);
			request.setAttribute("bk_no", bk_no);
			request.setAttribute("mbd_no", mbd_no);
			request.setAttribute("result", result);			
			
			return "booking/bookingAccept";
		}
	}
}
