package dogwalk.service;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dogwalk.dao.BookingDao;
import dogwalk.dao.MBoardDao;
import dogwalk.model.Booking;
import dogwalk.model.MBoard;

public class OwnerBookingList implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int rowPerPage = 10;
		int pagePerBlock = 10;
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		
		String own_id = request.getParameter("own_id");
		String own_reg_no = request.getParameter("own_reg_no");
		
		MBoardDao mbd = MBoardDao.getInstance();
		List<MBoard> ownlist = mbd.ownlist(startRow, endRow, own_id, own_reg_no);
		
		int tot = mbd.total();
		int total = tot - startRow + 1;
		int startPage = currentPage - (currentPage - 1) % 10;
		int endPage = startPage + pagePerBlock - 1;
		int totPage = (int)Math.ceil((double)tot/rowPerPage);
		if (endPage > totPage) {
			endPage = totPage;
		}
		
		request.setAttribute("total", total);
		request.setAttribute("ownlist", ownlist);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("totPage", totPage);
		request.setAttribute("pagePerBlock", pagePerBlock);
		request.setAttribute("currentPage", currentPage);
		
		return "booking/ownerBookingList";
	}

}
