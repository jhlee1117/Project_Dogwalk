package dogwalk.dao;

import java.io.Reader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

// 자바와 연동할 데이터 모델을 불러오기
import dogwalk.model.License;
import dogwalk.model.Owner;
import dogwalk.model.Walker;

public class LicenseDao {

	// Singleton
	private static LicenseDao instance = new LicenseDao();

	private LicenseDao() {
	}

	public static LicenseDao getInstance() {
		return instance;
	}

	private static SqlSession session;
	static {
		try {
			// 파일을 읽어 옴
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			// 객체 생성 - 저장할 공간을 만들어 줌
			// 위의 reader를 build하겠다
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
			session = ssf.openSession(true);
			// true를 쓰면 오토 커밋(자동 저장)
			reader.close();
			// 읽은거 닫아줌
		} catch (Exception e) { // exception을 잡기 위해서 상위 양식 {
			System.out.println("Session 생성시 에러:" + e.getMessage());
		}
	}
	// 회원가입 시 자격증 데이터 입력
	public int insert(List<License> liList) {
		try {
			for (int i = 0; i < liList.size(); i++)
				session.insert("licenseInfo.insertLicense", liList.get(i));
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return 0;
		}
		return 1;
	}
	// 마이페이지에서 자격증 조회
	public List<License> selectLicense(String wkr_id) {
		HashMap<String, Object> lc_map = new HashMap<>();
		lc_map.put("wkr_id", wkr_id);
		return session.selectList("licenseInfo.selectLicense", lc_map);
	}
	// 자격증 중복 체크에 사용
	public License selectLc(String lc_cd) {
		return (License) session.selectOne("licenseInfo.selectLccd", lc_cd);
	}
}
