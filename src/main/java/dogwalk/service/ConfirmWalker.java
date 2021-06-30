package dogwalk.service;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dogwalk.dao.WalkerDao;
import dogwalk.model.Walker;
public class ConfirmWalker implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		String wkr_id = request.getParameter("wkr_id"); // 중복체크한 name 속성이 id인 값을 불러들임
		String msg = "";
		WalkerDao wd = WalkerDao.getInstance();
		Walker walker = wd.selectAll(wkr_id);
		
		if (walker == null)
			msg = "사용 가능한 아이디입니다.";
		else 
			msg = "사용 중이니 다른 아이디를 사용하세요.";
		
		request.setAttribute("msg", msg);
		
		
		return "login/confirmWalker";
	}

}
