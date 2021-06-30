package dogwalk.service;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dogwalk.dao.OwnerDao;
import dogwalk.model.Owner;

public class UpdateOwner implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		
		String own_id = request.getParameter("own_id");
		String own_pwd = request.getParameter("password");
		String own_name = request.getParameter("own_name");
		String own_addr = request.getParameter("own_addr");
		String own_tel = request.getParameter("own_tel");
		String own_email = request.getParameter("own_email");
		
		Owner owner = new Owner();
		owner.setOwn_id(own_id);
		owner.setOwn_pwd(own_pwd);
		owner.setOwn_name(own_name);
		owner.setOwn_addr(own_addr);
		owner.setOwn_tel(own_tel);
		owner.setOwn_email(own_email);
		
		OwnerDao od = OwnerDao.getInstance();
		
		int result = od.updateOwner(owner);
		
		request.setAttribute("result", result);
		
		return "mypage/updateOwner";
	}

}
