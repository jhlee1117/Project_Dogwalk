package dogwalk.service;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dogwalk.dao.MBoardDao;
import dogwalk.model.MBoard;

public class MBWrite implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
//		폼에서 입력한 데이터 갖고 오기
		Date mbd_str_dt = Date.valueOf(request.getParameter("mbd_str_dt")); // 수정
		Date mbd_fn_dt = Date.valueOf(request.getParameter("mbd_fn_dt")); // 수정
		String mbd_sbjt = request.getParameter("mbd_sbjt");
		String mbd_cont = request.getParameter("mbd_cont");
		String own_id = request.getParameter("own_id");
		String own_reg_no = request.getParameter("own_reg_no"); // 추가
		
		MBoard mboard = new MBoard();
		mboard.setMbd_str_dt(mbd_str_dt);
		mboard.setMbd_fn_dt(mbd_fn_dt);
		mboard.setMbd_sbjt(mbd_sbjt);
		mboard.setMbd_cont(mbd_cont);
		mboard.setOwn_id(own_id);
		mboard.setOwn_reg_no(own_reg_no);
		MBoardDao mbd = MBoardDao.getInstance();
		int result = mbd.insert(mboard);
		
		request.setAttribute("result", result);
		return "mboard/mbWrite";
	}

}
