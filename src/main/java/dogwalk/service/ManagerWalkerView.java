package dogwalk.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dogwalk.dao.WalkerDao;
import dogwalk.model.Walker;

public class ManagerWalkerView implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		// walkerProfileList.jsp로 부터 반려견 번호와 현재페이지 정보 얻어옴
		String wkr_reg_no = request.getParameter("wkr_reg_no");
		String pageNum = request.getParameter("pageNum");
		// Dao 싱글톤 생성
		WalkerDao wd = WalkerDao.getInstance();
		// Walker 객체에 dao의 select 메소드를 이용하여 정보를 담음
		Walker walker = wd.select(wkr_reg_no);
		// 리턴할 jsp페이지에 pageNum정보와 정보가 저장된 walker개체를 보내기 위해 어트리뷰트 설정
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("walker", walker);
		
		return "manager/managerWalkerView";
	}
}
