package reservation;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class PaymentDAO {
	
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
	
	
	// 결제입력 메소드
		public void insert(PaymentBean bean) {	
			getCon();
			try {
				
				String sql = "insert into pay values (?, ?, sysdate(), ?, ?, ?, ?, ?, ?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, bean.getNum());
				pstmt.setString(2, bean.getUid());
				pstmt.setInt(3, bean.getDaily());
				pstmt.setInt(4, bean.getBlanket());
				pstmt.setInt(5, bean.getShirt());
				pstmt.setInt(6, bean.getDry());
				pstmt.setInt(7, bean.getCare());
				pstmt.setInt(8, bean.getTotalprice());
				pstmt.executeUpdate();
				
				System.out.println(pstmt);
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("pay값 안들어감");
			}
		}
		
		//total 세션 받아오기
		public int Total(int num) {
			int totalprice = 0;
			try {
				getCon();
				String sql = "select totalprice from pay where num = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				rs = pstmt.executeQuery();
				System.out.println(pstmt);
				if(rs.next()) {
					totalprice = rs.getInt("totalprice");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return totalprice;
		}
		
		public int getTotalReservationPrice(String uid) {
			getCon();
			int totalReservationPrice = 0;
			try {
				String sql = "select sum(totalprice) as totalprice from pay where uid = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, uid);
				rs = pstmt.executeQuery();
				
				if (rs.next()) {
					totalReservationPrice = rs.getInt("totalprice");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return totalReservationPrice;
		}
		


}
