package dogwalk.service;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dogwalk.dao.MBoardDao;
import dogwalk.model.MBoard;

public class MBWalkerView implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {		
		String mbd_no = request.getParameter("mbd_no");
		String wkr_id = request.getParameter("wkr_id");
		String wkr_reg_no = request.getParameter("wkr_reg_no");
		MBoardDao mbd = MBoardDao.getInstance();
		MBoard mboard = mbd.select(mbd_no);
		request.setAttribute("mboard", mboard);
		request.setAttribute("wkr_id", wkr_id);
		request.setAttribute("wkr_reg_no", wkr_reg_no);
		return "mboard/mbWalkerView";
	}

}
