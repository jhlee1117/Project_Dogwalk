package dogwalk.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dogwalk.dao.BookingDao;
import dogwalk.model.Booking;

public class WkrBookingAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String mbd_no = request.getParameter("mbd_no");
		String wkr_reg_no = request.getParameter("wkr_reg_no");
		String wkr_id = request.getParameter("wkr_id");
		
		BookingDao bd = BookingDao.getInstance();
		int bkcheck = bd.bkcheck(mbd_no, wkr_id); // 중복 신청 불가하게 찾아내는 로직
		int accheck = bd.accheck(mbd_no); // 매칭 완료글에 매칭 불가능하게 하는 로직
		
		if (bkcheck == 1) { // 오류나면 지워
			return "booking/checkBooking"; // 중복신청 불가하게
		} else {
			if (accheck == 1) {
				return "booking/rejectBooking"; // 매칭완료글 신청 못하게
			} else {
				Booking booking = new Booking();
				booking.setMbd_no(mbd_no);
				booking.setWkr_reg_no(wkr_reg_no);
				booking.setWkr_id(wkr_id);
		
				int result = bd.insert(booking);
				
				request.setAttribute("mbd_no",mbd_no);
				request.setAttribute("result", result);
				return "booking/wkrBookingAction";
			}
		}
	}
}
