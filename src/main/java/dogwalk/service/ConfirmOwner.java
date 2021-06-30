package dogwalk.service;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dogwalk.dao.OwnerDao;
import dogwalk.model.Owner;
public class ConfirmOwner implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		String own_id = request.getParameter("own_id"); // 중복체크한 name 속성이 id인 값을 불러들임
		String msg = "";
		OwnerDao od = OwnerDao.getInstance();
		Owner owner = od.selectAll(own_id);
		
		if (owner == null)
			msg = "사용 가능한 아이디입니다.";
		else 
			msg = "사용 중이니 다른 아이디를 사용하세요.";
		
		request.setAttribute("msg", msg);
		
		return "login/confirmOwner";
	}

}
