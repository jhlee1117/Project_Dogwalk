package dogwalk.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dogwalk.dao.NoticeDao;
import dogwalk.model.Notice;

public class ManagerNoticeList implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		// 페이징
		int rowPerPage = 10;	// 1페이지에 10개의 행
		int pagePerBlock = 10;	// 한 블럭에 10페이지
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null || pageNum.equals("")) { // 처음 실행했을때 pageNum은 null값이기 때문에 조건문으로 조정
			pageNum = "1";
		}
		
		int currentPage = Integer.parseInt(pageNum);		// 최근 페이지
		int startRow = (currentPage - 1) * rowPerPage + 1;	// 페이지의 시작행
		int endRow = startRow + rowPerPage - 1;				// 페이지의 끝행
		NoticeDao nd = NoticeDao.getInstance();				// NoticeDao의 싱글톤 객체를 생성
		List<Notice> list = nd.list(startRow, endRow);		// NoticeDao의 list함수를 사용하여 Notice데이터형의 list객체에 데이터를 저장(리스트를 보여주기 위함)
		int tot = nd.total();								// NoticeDao의 list함수를 사용하여 Notice DB의 총 갯수를 저장
		int total = tot - startRow + 1;
		int startPage = currentPage - (currentPage - 1) % 10;
		int endPage = startPage + pagePerBlock - 1;
		int totPage = (int)Math.ceil((double)tot/rowPerPage);
		if (endPage > totPage) {
			endPage = totPage;
		}
		
		request.setAttribute("total", total);
		request.setAttribute("list", list);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("totPage", totPage);
		request.setAttribute("pagePerBlock", pagePerBlock);
		request.setAttribute("currentPage", currentPage);
		
		// 위에 저장한 애트리뷰트를 /views/manager/managerNoticeList.jsp로 전달
		return "manager/managerNoticeList";
	}
}
