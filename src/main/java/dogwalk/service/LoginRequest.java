package dogwalk.service;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginRequest implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		// 로그인이 필요한 영역으로 로그인 alert 과 함께 loginForm.do 로 이동
		return "login/loginRequest";
	}

}
