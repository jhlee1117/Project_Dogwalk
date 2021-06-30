package dogwalk.service;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dogwalk.dao.LicenseDao;
import dogwalk.dao.WalkerDao;
import dogwalk.model.License;
import dogwalk.model.Walker;

public class UpdateWalker implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		
		HttpSession session = request.getSession();		
		
		// 도우미 테이블에 대한 업데이트 변수
		String wkr_id = request.getParameter("wkr_id");
		String wkr_pwd = request.getParameter("password");
		String wkr_name = request.getParameter("wkr_name");
		String wkr_addr = request.getParameter("wkr_addr");
		String wkr_tel = request.getParameter("wkr_tel");
		String wkr_email = request.getParameter("wkr_email");
		String wkr_rs_ex = request.getParameter("wkr_rs_ex");
		int wkr_rs_cnt = Integer.parseInt(request.getParameter("wkr_rs_cnt"));
		String wkr_career = request.getParameter("wkr_career");
		
		Walker walker = new Walker();
		walker.setWkr_id(wkr_id);
		walker.setWkr_pwd(wkr_pwd);
		walker.setWkr_name(wkr_name);
		walker.setWkr_addr(wkr_addr);
		walker.setWkr_tel(wkr_tel);
		walker.setWkr_email(wkr_email);
		walker.setWkr_rs_ex(wkr_rs_ex);
		walker.setWkr_rs_cnt(wkr_rs_cnt);
		walker.setWkr_career(wkr_career);
				
		WalkerDao wd = WalkerDao.getInstance();
	    LicenseDao ld = LicenseDao.getInstance();
	    
	    // 자격증 테이블에 대한 업데이트 변수
		String wkr_reg_no = (String) session.getAttribute("wkr_reg_no");
		
		String[] lc_cd_list = request.getParameterValues("lc_cd");
		String[] lc_name_list = request.getParameterValues("lc_name");
		String[] lc_iss_ogz_list = request.getParameterValues("lc_iss_ogz");
		// 업데이트 입력한 자격증 개수만큼 도우미 일련번호를 넣어줌 
		String[] wkr_reg_no_list = new String[lc_cd_list.length];
		for (int i = 0; i < wkr_reg_no_list.length; i++) {
			wkr_reg_no_list[i] = wkr_reg_no;
		}
		// 업데이트 입력한 자격증 개수만큼 도우미 id를 넣어줌
		String[] wkr_id_list = new String[lc_cd_list.length];
		for (int i = 0; i < wkr_id_list.length; i++) {
			wkr_id_list[i] = wkr_id;
		}   
		License license = null;
		List<License> liList = new ArrayList<License>();
		
		int result_walker = wd.updateWalker(walker); // 도우미 프로필 업데이트에 대한 내용
		int result_license;
		
//		// 값이 추가가 안 된 경우를 위해 작성
        if (lc_cd_list[0]==null || lc_cd_list == null || lc_cd_list[0].equals("")) {
        	result_license = 0;
        } else {
        	for (int i =0; i < lc_cd_list.length;i++) {
        		license = new License();
            	license.setLc_cd(lc_cd_list[i]);
                license.setLc_name(lc_name_list[i]);
                license.setLc_iss_ogz(lc_iss_ogz_list[i]);
                license.setWkr_id(wkr_id_list[i]);
                license.setWkr_reg_no(wkr_reg_no_list[i]);
                liList.add(license);
        	}
        	result_license = ld.insert(liList);
        }        
        
        request.setAttribute("result_walker", result_walker);
        request.setAttribute("result_license", result_license);        
        
        return "mypage/updateWalker";
	}

}
