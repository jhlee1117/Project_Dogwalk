package dogwalk.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dogwalk.dao.MBoardDao;
import dogwalk.model.MBoard;

public class MBWriteForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		
		String own_id = (String) session.getAttribute("own_id"); /* comfirmWrite.jsp에서는 own_id에 대한 정보를 보내지 않았음 하지만 이 페이지에서는 애트리뷰트를 받는 코드가 있음 */		
		String own_reg_no = (String)session.getAttribute("own_reg_no"); // 추가
		
		request.setAttribute("own_id", own_id);
		request.setAttribute("own_reg_no", own_reg_no);
		
		return "mboard/mbWriteForm";
	}

}
