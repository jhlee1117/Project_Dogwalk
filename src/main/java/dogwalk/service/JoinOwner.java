package dogwalk.service;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import dogwalk.dao.DogDao;
import dogwalk.dao.OwnerDao;
import dogwalk.model.Dog;
import dogwalk.model.Owner;
public class JoinOwner implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		// 강아지 이미지 파일 업로드를 위한 cos.jar 추가 및 객체 생성
				MultipartRequest multi = null;
				
				// 업로드 될 파일의 최대 사이즈 (10메가)
				int sizeLimit = 10 * 1024 * 1024;
						
				// 파일이 업로드될 실제 tomcat 폴더의 경로
				String savePath = request.getSession().getServletContext().getRealPath("/dogimg");
				
				try {
					multi = new MultipartRequest(request, savePath, sizeLimit, "UTF-8", new DefaultFileRenamePolicy());
				} catch (IOException e) {
					System.out.println(e.getMessage());
				}
				
				
				// 견주 프로필 입력 데이터를 받아옴
				String own_id = multi.getParameter("own_id"); // 견주 ID는 DOG 테이블로도 들어감
				String own_pwd = multi.getParameter("password");
				String own_name = multi.getParameter("name");
				String birth_date = multi.getParameter("birth_date");
				Date own_bth_dt = Date.valueOf(birth_date);
				String own_gdr = multi.getParameter("gender");
				String own_addr = multi.getParameter("address");
				String own_email = multi.getParameter("email");
				String own_tel = multi.getParameter("tel");
				String mb_clf_cd = "1";
	
				Owner owner = new Owner();
				owner.setOwn_id(own_id);
				owner.setOwn_pwd(own_pwd);
				owner.setOwn_name(own_name);
				owner.setOwn_bth_dt(own_bth_dt);
				owner.setOwn_gdr(own_gdr);
				owner.setOwn_addr(own_addr);
				owner.setOwn_email(own_email);
				owner.setOwn_tel(own_tel);
				owner.setMb_clf_cd(mb_clf_cd);
				
				// 강아지 프로필 입력 데이터를 받아옴
				String dog_name = multi.getParameter("dog_name");
				String dog_gdr = multi.getParameter("dog_gdr");
				String dog_kind = multi.getParameter("dog_kind");
				String dog_size = multi.getParameter("dog_size");
				int dog_age = Integer.parseInt(multi.getParameter("dog_age"));
				Double dog_len = Double.parseDouble(multi.getParameter("dog_len"));
				Double dog_wgt = Double.parseDouble(multi.getParameter("dog_wgt"));
				String dog_ntl_chk = multi.getParameter("dog_ntl_chk");
				String dog_agg = multi.getParameter("dog_agg");
				String dog_md_hst = multi.getParameter("dog_md_hst");
				String dog_chr = multi.getParameter("dog_chr"); // 강아지 특징 추가 (6/17)
				
				// 폼에서 파일 이름 가져오기
		        String dog_pht_nm = multi.getFilesystemName("dog_image");		
						
				// 입력 데이터 강아지 객체 지정
				Dog dog = new Dog();
				dog.setDog_name(dog_name);
				dog.setDog_gdr(dog_gdr);
				dog.setDog_kind(dog_kind);
				dog.setDog_size(dog_size);
				dog.setDog_age(dog_age);
				dog.setDog_len(dog_len);
				dog.setDog_wgt(dog_wgt);
				dog.setDog_ntl_chk(dog_ntl_chk);
				dog.setDog_agg(dog_agg);
				dog.setDog_md_hst(dog_md_hst);
				dog.setDog_pht_nm(dog_pht_nm); // 사진 파일명도 지정
				dog.setOwn_id(own_id); // 견주 ID도 테이블 속성으로 추가
				dog.setDog_chr(dog_chr); // 강아지 특징 추가 (6/17)
				
				OwnerDao od = OwnerDao.getInstance();
				DogDao dd = DogDao.getInstance();
				// 입력 데이터 1번 더 중복 확인
				Owner owner_chk = od.selectAll(own_id);
				int result_owner = 0;
				int result_dog = 0;
				
				if (owner_chk == null) {
					result_owner = od.insert(owner);
					result_dog = dd.insert(dog);
				}
				else {
					result_owner = -1;
					result_dog = -1;
				}
				request.setAttribute("result_owner", result_owner);
				request.setAttribute("result_dog", result_dog);
				
				return "login/joinOwner";
	}

}
