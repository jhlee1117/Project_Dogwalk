package dogwalk.service;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dogwalk.dao.BookingDao;
import dogwalk.dao.MBoardDao;
import dogwalk.model.Booking;
import dogwalk.model.MBoard;

public class ManagerMboardView implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		String mbd_no = request.getParameter("mbd_no");
		MBoardDao mbd = MBoardDao.getInstance();
		MBoard mboard = mbd.select(mbd_no);
		
		BookingDao bd = BookingDao.getInstance();
		List<Booking> booking = bd.bklist(mbd_no);
				
		request.setAttribute("mboard", mboard);
		request.setAttribute("booking", booking);
		return "manager/managerMboardView";
	}

}
