package dogwalk.dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import dogwalk.model.Booking;

public class BookingDao {

	// singleton
	private static BookingDao instance = new BookingDao();
	private BookingDao() {}
	public static BookingDao getInstance() {
		return instance;
	}
	private static SqlSession session;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
			// true 값이어야 입력/수정/삭제 한 후에 commit 실행.
			session = ssf.openSession(true);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}
	
	@SuppressWarnings("unchecked")
	public List<Booking> list(int startRow, int endRow) {
		// 파라미터로는 단수개의 정보만 전달 가능
		// List는 특정틀의 동일한 유형을 가진 정보를 전달 가능 But Array로 집합, 정렬, 배열해야 함
		// Hash은 다수의 정보 전달 가능. key값으로 해당 정보 더미들 구분
		//    key값은 문자열로 받고,  정보값은 문자와 숫자 모두로 받을 수 있게 Object로 지정
		HashMap<String, Object> hm = new HashMap<>();
			hm.put("startRow", startRow);
			hm.put("endRow", endRow);
		return session.selectList("bookingns.list", hm);
	}
	
	// 게시글 총 개수
	public int total() { // 패이징을 위한 총 글 개수 count
		return (int) session.selectOne("bookingns.total");
	}
	
	/*
	 * public Booking select(String mbd_no) { // return (Booking)
	 * session.selectOne("bookingns.select", mbd_no); }
	 */
	
	public int insert(Booking booking) { // 신청 시 예약 data 입력
		return (int) session.insert("bookingns.insert", booking);
	}
	public int accept(Booking booking) { // 하나의 신청만 수락 & 나머지 예약은 모두 거절
		return session.update("bookingns.accept", booking);
	}
	
	public int deny(String mbd_no, String bk_no) { // 매칭 완료 시 나머지 예약 모두 거절 처리
	      HashMap<String, Object> hm = new HashMap<>();
	      hm.put("mbd_no", mbd_no);
	      hm.put("bk_no", bk_no);
	      return session.update("bookingns.deny", hm);
	   }
	
	public List<Booking> wkrlist(int startRow, int endRow, String wkr_id, String wkr_reg_no) { // walker가 신청한 글 목록 조회
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		hm.put("wkr_id", wkr_id);
		hm.put("wkr_reg_no", wkr_reg_no);
		return session.selectList("bookingns.wkrlist", hm);
	}
	
	public List<Booking> bklist(String mbd_no) {	// ??
		return session.selectList("bookingns.bklist", mbd_no);
	}
	
	public int denyOne(String bk_no) {	// 하나의 신청 글 거절
		return session.update("bookingns.denyOne", bk_no);
	}
	
	public int bkcheck(String mbd_no, String wkr_id) { // 이미 신청한 글에 중복신청 불가
		HashMap<String, Object> hm = new HashMap<>();
	      hm.put("mbd_no", mbd_no);
	      hm.put("wkr_id", wkr_id);
		return (int) session.selectOne("bookingns.selectbk", hm);
	}
	
	public int accheck(String mbd_no) { // 매칭완료된 글에 추가 신청불가
		return (int) session.selectOne("bookingns.accheck", mbd_no);
	}
	public int bkcount(String mbd_no) {	// 신청 개수(1개) 파악 로직
		return (int) session.selectOne("bookingns.bkcount", mbd_no);
	}
	public int acceptOne(Booking booking) {	// 신청 개수가 1개일 때 수락 로직
		return session.update("bookingns.acceptOne", booking);
	}

}