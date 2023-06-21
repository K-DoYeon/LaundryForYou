package reservation;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import user.UserBean;





public class ReservationDAO {
	
	Connection con; // 데이터베이스에 접근하도록 설정
	PreparedStatement pstmt; // 데이터베이스에서 쿼리를 실행시켜주는 객체
	ResultSet rs; // 데이터베이스의 테이블의 결과를 리턴받아 자바에 저장해주는 객체
	
	// 데이터베이스에 접근
	public void getCon() {
		try {
			
			String id = "root";
			String password = "!+La:m6V;t";
			String url = "jdbc:mysql://3.35.8.147/laundry";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url, id, password);
			System.out.println("DB 연결 성공");
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("DB 연결 실패");
		}
	}
	
	
	// 회원가입 메소드
		public void insert(ReservationBean bean) {
			getCon();
			try {
				
				String sql = "insert into reservation values (num, ?, ? ,? ,?, ?, ?, ?, ?, 0, sysdate(), ?, ?, ?, ?, ?, ?,0)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, bean.getUid());
				pstmt.setString(2, bean.getUname());
				pstmt.setString(3, bean.getTel());
				pstmt.setInt(4, bean.getPostcode());
				pstmt.setString(5, bean.getAddr());
				pstmt.setString(6, bean.getDetailaddr());
				pstmt.setString(7, bean.getComment());
				pstmt.setString(8, bean.getSelectdate());
				pstmt.setInt(9, bean.getDaily());
				pstmt.setInt(10, bean.getBlanket());
				pstmt.setInt(11, bean.getShirt());
				pstmt.setInt(12, bean.getDry());
				pstmt.setInt(13, bean.getCare());
				pstmt.setInt(14, bean.getTotalprice());
				pstmt.executeUpdate();
				System.out.println(pstmt);
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	
	
}
