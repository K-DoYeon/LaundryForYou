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
	         
//	         String id = "root";
//	         String password = "!+La:m6V;t";
//	         String url = "jdbc:mysql://3.35.8.147/laundry";
	    	  String id = "postl";
	          String password = "0601";
	          String url = "jdbc:mysql://43.202.192.64/laundry";
	         
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
	   
	   public int delete(String uid, String subject) {
		   getCon();
		   String sql = "delete from likey where userid = ? and subject = ?";
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
	   
	   
	   
	   public boolean countLike(String uid, String subject) {
		         
		         getCon();
		         
		         try {
		             LikeyDTO ldto = new LikeyDTO(uid, subject);
		             String sql = "SELECT * FROM likey WHERE userid = ? AND subject = ?";
		             pstmt = con.prepareStatement(sql);
		             pstmt.setString(1, ldto.getUserID());
		             pstmt.setString(2, ldto.getSubject());
		             rs = pstmt.executeQuery();
		             if (rs.next()) {
		                 System.out.println(rs);
		                 return true;
		             }
		         } catch (Exception e) {
		             e.printStackTrace();
		         }
				return false;
	   
	   		}
	   }
