package dogwalk.service;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MBWriteCheck implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)	{
		
		String mb_clf_cd = request.getParameter("mb_clf_cd"); // request 값
		
		int result = 0;
		if(mb_clf_cd.equals("1")) {
			result = 1;
		} else {
			result = 2;
		}
		request.setAttribute("result", result);
		return "mboard/confirmWrite";
	}

}
