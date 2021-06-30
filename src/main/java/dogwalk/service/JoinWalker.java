package dogwalk.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dogwalk.model.License;
import dogwalk.model.Walker;
import dogwalk.dao.LicenseDao;
import dogwalk.dao.WalkerDao;

public class JoinWalker implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");

		// 도우미 이미지 파일 업로드를 위한 cos.jar 추가 및 객체 생성
		MultipartRequest multi = null;

		// 업로드 될 파일의 최대 사이즈 (10메가)
		int sizeLimit = 10 * 1024 * 1024;

		// 파일이 업로드될 실제 tomcat 폴더의 경로
		String savePath = request.getSession().getServletContext().getRealPath("/walkerimg");

		try {
			multi = new MultipartRequest(request, savePath, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
		
		/* 도우미 테이블 입력 부분 */

		// 도우미 프로필 입력 데이터를 받아옴
		String wkr_id = multi.getParameter("wkr_id");
		String wkr_pwd = multi.getParameter("password");
		String wkr_name = multi.getParameter("name");
		String birth_date = multi.getParameter("birth_date");
		Date wkr_bth_dt = Date.valueOf(birth_date);
		String wkr_gdr = multi.getParameter("gender");
		String wkr_addr = multi.getParameter("address");
		String wkr_email = multi.getParameter("email");
		String wkr_tel = multi.getParameter("tel");
		
		// 도우미 등급 관련 부분 임의로 'C'로 지정
		String wkr_gd = "C";
		
		// 도우미 구분 코드는 2로 지정 
		String mb_clf_cd = "2";
		
		
		// 양육경험 관련 부분
		String wkr_rs_ex = multi.getParameter("wkr_rs_ex");
		int wkr_rs_cnt = Integer.parseInt(multi.getParameter("wkr_rs_cnt"));
		String wkr_career = multi.getParameter("wkr_career");
		
		// 폼에서 파일 이름 가져오기
        String wkr_pht_nm = multi.getFilesystemName("walker_image");		

		// wkr_reg_no에 대한 시퀀스 값을 가져옴 
        WalkerDao wkr_seq = WalkerDao.getInstance();
		int wkr_reg_no_auto = wkr_seq.seq_increase();
		String wkr_reg_no = wkr_reg_no_auto+"";  // 문자형으로 변경
        
        // 입력 데이터 도우미 객체 지정
        Walker walker = new Walker();
        walker.setWkr_reg_no(wkr_reg_no);
        walker.setWkr_id(wkr_id);
        walker.setWkr_pwd(wkr_pwd);
        walker.setWkr_name(wkr_name);                
        walker.setWkr_addr(wkr_addr);
        walker.setWkr_email(wkr_email);
        walker.setWkr_tel(wkr_tel);
        walker.setWkr_gdr(wkr_gdr);
        walker.setWkr_bth_dt(wkr_bth_dt);
        walker.setWkr_rs_cnt(wkr_rs_cnt);
        walker.setWkr_gd(wkr_gd);
        walker.setWkr_pht_nm(wkr_pht_nm);
        walker.setWkr_rs_ex(wkr_rs_ex);
        walker.setWkr_career(wkr_career);
        walker.setMb_clf_cd(mb_clf_cd);

		/* 자격증 테이블 입력 부분 */
		
		// 도우미 자격증 입력 데이터를 받아옴
		String[] lc_cd_list = multi.getParameterValues("lc_cd");
		String[] lc_name_list = multi.getParameterValues("lc_name");
		String[] lc_iss_ogz_list = multi.getParameterValues("lc_iss_ogz");
		
		// 입력한 자격증 개수만큼 도우미 일련번호를 넣어줌 
		String[] wkr_reg_no_list = new String[lc_cd_list.length];
		for (int i = 0; i < wkr_reg_no_list.length; i++) {
			wkr_reg_no_list[i] = wkr_reg_no;
		}
		// 입력한 자격증 개수만큼 도우미 id를 넣어줌
		String[] wkr_id_list = new String[lc_cd_list.length];
		for (int i = 0; i < wkr_id_list.length; i++) {
			wkr_id_list[i] = wkr_id;
		}       
        List<License> liList = new ArrayList<License>();
        for (int i =0; i < lc_cd_list.length;i++) {
        	License license = new License();
            license.setLc_cd(lc_cd_list[i]);
            license.setLc_name(lc_name_list[i]);
            license.setLc_iss_ogz(lc_iss_ogz_list[i]);
            license.setWkr_id(wkr_id_list[i]);
            license.setWkr_reg_no(wkr_reg_no_list[i]);
            liList.add(license);
        }

        WalkerDao wd = WalkerDao.getInstance();
        LicenseDao ld = LicenseDao.getInstance();
        
        // 입력 데이터 1번 더 중복 확인
        Walker walker_chk = wd.selectAll(wkr_id);       
        int result_walker = 0;
        int result_license = 0;
        
        if (walker_chk == null) {
        	result_walker = wd.insert(walker);
        	result_license = ld.insert(liList); // 삽입을 List로 수행
        }
        else {
        	result_walker = -1;
        	result_license = -1;
        }
        request.setAttribute("result_walker", result_walker);
        request.setAttribute("result_license", result_license);
        
		return "login/joinWalker";
	}

}
