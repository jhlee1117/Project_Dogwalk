package dogwalk.service;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dogwalk.dao.LicenseDao;
import dogwalk.dao.OwnerDao;
import dogwalk.dao.WalkerDao;
import dogwalk.model.License;
import dogwalk.model.Owner;
import dogwalk.model.Walker;

public class MypageAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		
		// 시작점: MemberMainAction - 마이페이지가 견주, 도우미로 나뉘므로, 세션 정보 중 우선 구분코드를 가져와서 객체 지정 후 진행
		HttpSession session = request.getSession();
		String mb_clf_cd = (String) session.getAttribute("mb_clf_cd");
		
		// 마이페이지 경로를 변수로 전달
		//String mypage = null;
		
		// 구분코드 중 1은 견주, 2는 도우미
		if (mb_clf_cd == "1") {
			// 견주 ID 세션을 불러들임
			OwnerDao od = OwnerDao.getInstance();
			String own_id = (String) session.getAttribute("own_id");
			// 견주 정보 조회, 멤버 메인에서 받아온 id로만 조회 가능 
			Owner owner = od.selectOwner(own_id);
			request.setAttribute("owner", owner);
			session.setAttribute("own_id", owner.getOwn_id());
			//mypage = "/mypage/ownmypage";
			return "/mypage/ownmypage";
			
		} else if (mb_clf_cd == "2")  {
			// 도우미 ID 세션을 불러들임
			WalkerDao wd = WalkerDao.getInstance();
			String wkr_id = (String) session.getAttribute("wkr_id");
			// 도우미 정보 조회, 멤버 메인에서 받아온 id로만 조회 가능
			Walker walker = wd.selectWalker(wkr_id);
			request.setAttribute("walker", walker);
			session.setAttribute("wkr_id", walker.getWkr_id());
			
			// 도우미가 갖고 있는 자격증 조회
			LicenseDao ld = LicenseDao.getInstance();
			List<License> licenselst = ld.selectLicense(wkr_id);
			request.setAttribute("licenselst", licenselst);
			//mypage = "/mypage/wkrmypage";
			return "/mypage/wkrmypage";
		} else {
			return "main/main";
		}
		
		//return mypage;
	}

}
