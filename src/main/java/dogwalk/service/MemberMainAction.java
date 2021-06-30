package dogwalk.service;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberMainAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		
		// 로그인 후 요청 객체에서 세션을 불러옴, 회원 메인이 통합되어 있으므로 일단 id로 가져온 후, 분리
		HttpSession session = request.getSession();					
		String wkr_id = (String) session.getAttribute("wkr_id");
		String wkr_reg_no = (String) session.getAttribute("wkr_reg_no");
		String own_id = (String) session.getAttribute("own_id");		
		String own_reg_no = (String) session.getAttribute("own_reg_no");
		
		// 세션 구분을 위한 mb_clf_cd를 가져오고 보내줌
		String mb_clf_cd = (String) session.getAttribute("mb_clf_cd");
		
		return "main/main";
	}

}
