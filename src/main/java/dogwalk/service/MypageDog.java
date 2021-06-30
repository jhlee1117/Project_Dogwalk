package dogwalk.service;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dogwalk.dao.DogDao;
import dogwalk.model.Dog;

public class MypageDog implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		HttpSession session = request.getSession();
		String own_id = (String) session.getAttribute("own_id");
		if (own_id == null) {
			return "main/main";
		} else {
			DogDao dd = DogDao.getInstance();
			Dog dog = dd.selectDog(own_id); // 견주 id로 강아지 정보를 모두 찾아옴
			request.setAttribute("dog", dog);
			session.setAttribute("own_id",own_id);
			
			return "/mypage/myDogpage";
		}
		
	}

}
