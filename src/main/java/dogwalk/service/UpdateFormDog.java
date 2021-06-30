package dogwalk.service;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dogwalk.dao.DogDao;
import dogwalk.model.Dog;

public class UpdateFormDog implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		
		HttpSession session = request.getSession();
		String own_id = (String)session.getAttribute("own_id");
		
		DogDao dd = DogDao.getInstance();
		Dog dog = dd.selectDog(own_id);
		String dog_no = dog.getDog_no(); // 반려견 정보 업데이트를 위해 반려견 일련번호를 가져옴 
		
		request.setAttribute("dog", dog);
		session.setAttribute("dog_no", dog_no);		
		
		return "mypage/updateFormDog";
	}

}
