package dogwalk.service;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dogwalk.dao.DogDao;
import dogwalk.dao.OwnerDao;
import dogwalk.model.Owner;

public class UpdateFormOwner implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		
		HttpSession session = request.getSession();
		String own_id = (String)session.getAttribute("own_id");
		
		OwnerDao od = OwnerDao.getInstance();
		Owner owner = od.selectOwner(own_id);
		request.setAttribute("owner", owner);
		
		return "/mypage/updateFormOwner";
	}

}
