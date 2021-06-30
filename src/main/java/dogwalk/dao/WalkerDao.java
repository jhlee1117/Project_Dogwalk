package dogwalk.dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import dogwalk.model.Dog;
import dogwalk.model.Walker;

public class WalkerDao {
	// 싱글톤
	private static WalkerDao instance = new WalkerDao();
	
	private WalkerDao() {}
	
	public static WalkerDao getInstance() {
		return instance;
	}
		
	// 마이베이티스
	private static SqlSession session;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
			
			session = ssf.openSession(true);	// true: auto commit, 반드시 기술해야함
			reader.close();
		} catch (Exception e) {
			System.out.println("session 생성에러: "+e.getMessage());
		}
	}
	// 도우미 프로필 목록 조회
	public List<Walker> list(int startRow, int endRow) {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		return session.selectList("walkerns.list", hm);
	}
	// 도우미 프로필 총 개수
	public int total() {
		return (int) session.selectOne("walkerns.total");
	}
	// 도우미 상세정보 조회
	public Walker select(String wkr_reg_no) {
		return (Walker) session.selectOne("walkerns.selectWalkerNo", wkr_reg_no);
	}
	// 도우미 프로필 검색
	public List<Walker> searchlist(int startRow, int endRow, String type, String search) {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		hm.put("type", type);
		hm.put("search", search);
		return session.selectList("walkerns.searchlist", hm);

	}
	// 도우미 ID 중복체크 - LJH
	public Walker selectAll(String wkr_id) {
		return (Walker)session.selectOne("walkerns.selectAll", wkr_id);
	}
	// 도우미 로그인 시 조회
	public Walker selectWalker(String wkr_id) {
		return (Walker)session.selectOne("walkerns.selectWalkerId", wkr_id);
	}
	
	// 도우미, 자격증 테이블에 들어갈 도우미일련번호에 대한 시퀀스 생성 - LJH
	public int seq_increase() {
		return (int) session.selectOne("walkerns.wkr_seq_increase");
	}
	// 도우미 회원가입 시 정보 입력 - LJH
	public int insert(Walker walker) {
		return session.insert("walkerns.insertWalker", walker);
	}
	// 도우미 마이페이지 정보 수정 - LJH
	public int updateWalker(Walker walker) {
		return session.update("walkerns.updateWalker", walker);
	}
	// 도우미 회원 탈퇴 - LJH
	public int deleteWalker(String wkr_id) {
		return session.update("walkerns.delete", wkr_id);
	}
}
