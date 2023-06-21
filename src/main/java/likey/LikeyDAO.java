package likey;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import likey.LikeyDTO;

public class LikeyDAO {

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
	   
	   public int like(String uid, String subject) {
		   getCon();
		   String sql = "insert into likey values(?,?)";
		   try {
			   pstmt = con.prepareStatement(sql);
			   pstmt.setString(1, uid);
			   pstmt.setString(2, subject);
			   return pstmt.executeUpdate();
		   }catch(Exception e) {
			   e.printStackTrace();
		   }
		   return -1;
	   }
	   
}
