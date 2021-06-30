package dogwalk.service;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dogwalk.dao.MBoardDao;
import dogwalk.model.MBoard;

public class MBUpdate implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String own_id = request.getParameter("own_id");
		String mbd_sbjt = request.getParameter("mbd_sbjt");
		String mbd_str_dt = request.getParameter("mbd_str_dt");
		String mbd_fn_dt = request.getParameter("mbd_fn_dt");
		String mbd_cont = request.getParameter("mbd_cont");
		String mbd_no = request.getParameter("mbd_no");
		
		MBoard mboard = new MBoard();
		mboard.setOwn_id(own_id);
		mboard.setMbd_sbjt(mbd_sbjt);
		mboard.setMbd_str_dt(Date.valueOf(mbd_str_dt));
		mboard.setMbd_fn_dt(Date.valueOf(mbd_fn_dt));
		mboard.setMbd_cont(mbd_cont);
		mboard.setMbd_no(mbd_no);
		MBoardDao mbd = MBoardDao.getInstance();
		int result = mbd.update(mboard);
		request.setAttribute("result", result);
		return "mboard/mbUpdate";
	}

}
