package dogwalk.service;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dogwalk.dao.DogDao;
import dogwalk.model.Dog;

public class MbDogProfileView implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		// 매칭 게시판 상세에서 강아지 프로필 보기 눌렀을 때 쓰는 로직
		String own_id = request.getParameter("own_id");
		
		DogDao dd = DogDao.getInstance();
		Dog dog = dd.selectmbdog(own_id);
		
		request.setAttribute("dog", dog);
		return "profile/dogProfileView";
	}

}
