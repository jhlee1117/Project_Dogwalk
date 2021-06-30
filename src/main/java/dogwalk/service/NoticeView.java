package dogwalk.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dogwalk.model.Notice;
import dogwalk.dao.NoticeDao;

public class NoticeView implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		// noticeList.jsp에서 공지사항번호와 최근페이지 정보를 받아옴
		String nt_no = request.getParameter("nt_no");
		String pageNum = request.getParameter("pageNum");
		// NoticeDao 싱글톤 객체 생성
		NoticeDao nd = NoticeDao.getInstance();
		// 싱글톤의 select 함수를 사용, 공지사항 번호를 파라미터로 이용해 상세 데이터를 불러온다.
		Notice notice = nd.select(nt_no);
		// 싱글톤의 readCountUpdate 함수를 사용, 공지사항 번호를 파라미터로 이용해 noticeList.jsp에서 제목을 클릭 시 조회수가 1씩 증가하게 한다.
		// 데이터타입을 int로 한 이유는 별 이유가 없다. 쓰이지 않음
		int result = nd.readCountUpdate(nt_no);
		// 최근페이지의 대한 정보와 상세 데이터 정보를 저장한 notice객체를 /views/notice/noticeView.jsp로 데이터를 전달
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("notice", notice);
		
		return "notice/noticeView";
	}
}
