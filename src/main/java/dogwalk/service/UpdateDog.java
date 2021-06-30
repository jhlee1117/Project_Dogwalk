package dogwalk.service;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dogwalk.dao.DogDao;
import dogwalk.model.Dog;

public class UpdateDog implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		
		HttpSession session = request.getSession();
		String dog_no = (String) session.getAttribute("dog_no");
		
		// 변하는 값들에 대해서만 파라미터 값을 가져옴
		int dog_age = Integer.parseInt(request.getParameter("dog_age"));
		Double dog_len = Double.parseDouble(request.getParameter("dog_len"));
		Double dog_wgt = Double.parseDouble(request.getParameter("dog_wgt"));
		String dog_ntl_chk = request.getParameter("dog_ntl_chk");
		String dog_agg = request.getParameter("dog_agg");
		String dog_chr = request.getParameter("dog_chr");
		String dog_md_hst = request.getParameter("dog_md_hst");
		
		Dog dog = new Dog();
		dog.setDog_no(dog_no);
		dog.setDog_age(dog_age);
		dog.setDog_len(dog_len);
		dog.setDog_wgt(dog_wgt);
		dog.setDog_ntl_chk(dog_ntl_chk);
		dog.setDog_agg(dog_agg);
		dog.setDog_chr(dog_chr);
		dog.setDog_md_hst(dog_md_hst);
		
		DogDao dd = DogDao.getInstance();
		
		int result = dd.updateDog(dog);
		
		request.setAttribute("result", result);
		
		return "mypage/updateDog";
	}

}
