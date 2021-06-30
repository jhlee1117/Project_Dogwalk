package dogwalk.service;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dogwalk.dao.WalkerDao;
import dogwalk.model.Walker;
public class WkrLoginAction implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String wkr_id = request.getParameter("wkr_id");
		String wkr_pwd = request.getParameter("wkr_pwd");
		WalkerDao wd = WalkerDao.getInstance();
		Walker walker = wd.selectWalker(wkr_id);
		String mb_clf_cd = "2"; // mb_clf_cd는 null 값으로 오류 발생 때문에 사전에 정의
		
		int result = 0;
		if (walker == null|| walker.getWkr_del().equals("Y")) {
			result = -1;
		} else {
			String dbPass = walker.getWkr_pwd();
			if(dbPass.equals(wkr_pwd)) {
				HttpSession session = request.getSession();
				session.setAttribute("wkr_id", wkr_id);
				session.setAttribute("wkr_reg_no", walker.getWkr_reg_no());
				// 세션 구분을 위한 mb_clf_cd를 보내줌
				session.setAttribute("mb_clf_cd", mb_clf_cd);			
				
				result = 1;
			}
		}
		request.setAttribute("result", result);
		return "login/wkrlogin";
	}

}
