package reservation;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import board.BoardBean;





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
		public int insert(ReservationBean bean) {
			int mynum = 0;
			
			getCon();
			try {
				
				String sql = "insert into reservation values (num, ?, ? ,? ,?, ?, ?, ?, ?, 0, sysdate(), ?, ?, ?, ?, ?, ?, 0)";
				pstmt = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
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
				rs = pstmt.getGeneratedKeys();
				
				if(rs.next()) {
					mynum = rs.getInt(1);
					System.out.println(mynum);
				}
				
				System.out.println(pstmt);
				
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return mynum;
		}
		
		
		// 페이징 메소드, 제한된 갯수 불러옴
		public Vector<ReservationBean> getSelect(int limitNum, int listNum) {
			Vector<ReservationBean> data = new Vector<>();
			getCon();
			try {
				String sql = "select * from reservation order by num desc limit ?, ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, limitNum);
				pstmt.setInt(2, listNum);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					ReservationBean rbean = new ReservationBean();
					rbean.setNum(rs.getInt("num"));
					rbean.setUid(rs.getString("uid"));
					rbean.setUname(rs.getString("uname"));
					rbean.setTel(rs.getString("tel"));
					rbean.setPostcode(rs.getInt("postcode"));
					rbean.setAddr(rs.getString("addr"));
					rbean.setDetailaddr(rs.getString("detailaddr"));
					rbean.setComment(rs.getString("comment"));
					rbean.setSelectdate(rs.getString("selectdate"));
					rbean.setCount(rs.getInt("count"));
					rbean.setWdate(rs.getString("wdate"));
					rbean.setDaily(rs.getInt("daily"));
					rbean.setBlanket(rs.getInt("blanket"));
					rbean.setShirt(rs.getInt("shirt"));
					rbean.setDry(rs.getInt("dry"));
					rbean.setCare(rs.getInt("care"));
					rbean.setTotalprice(rs.getInt("totalprice"));
					rbean.setCondition(rs.getInt("condition"));
					
					data.add(rbean);
				}
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return data;
		}
		
		
		//페이징 메소드, 전체 목록 불러옴
		public int getAllSelect() {
			int allCount = 0;
			Statement st = null;
			getCon();
			
			try {
				
				String sql = "select count(*) from reservation";
				st = con.createStatement();
				rs = st.executeQuery(sql);
				while (rs.next()) {
					allCount = rs.getInt(1);
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return allCount;
		}
	
		
		// 예약관리 컨디션 변경
		public int update(int condition, int num) {
		    int flag = 0;
		    getCon();
		    try {
		        String sql = "update reservation set `condition` = ? where num = ?";
		        pstmt = con.prepareStatement(sql);
		        pstmt.setInt(1, condition);
		        pstmt.setInt(2, num);
		        
		        flag = pstmt.executeUpdate();

		        con.close();
		    } catch (Exception e) {
		        e.printStackTrace();
		    }
		    
		    return flag;
		}
		
		//DB값 불러오기
		public ReservationBean getOneReservation(int num) {
			ReservationBean res = new ReservationBean();
			getCon();
			
			try {
				String sql = "select * from reservation where num = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					res.setNum(rs.getInt("num"));
					res.setUid(rs.getString("uid"));
					res.setUname(rs.getString("uname"));
					res.setTel(rs.getString("tel"));
					res.setPostcode(rs.getInt("postcode"));
					res.setAddr(rs.getString("addr"));
					res.setDetailaddr(rs.getString("detailaddr"));
					res.setComment(rs.getString("comment"));
					res.setSelectdate(rs.getString("selectdate"));
					res.setCount(rs.getInt("count"));
					res.setWdate(rs.getString("wdate"));
					res.setDaily(rs.getInt("daily"));
					res.setBlanket(rs.getInt("blanket"));
					res.setShirt(rs.getInt("shirt"));
					res.setDry(rs.getInt("dry"));
					res.setCare(rs.getInt("care"));
					res.setTotalprice(rs.getInt("totalprice"));
					res.setCondition(rs.getInt("condition"));
				}
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return res;
		}
		
		//session 저장
		public int Total(String uid, int num) {
			int totalprice = 0;
			try {
				getCon();
				String sql = "select totalprice from reservation where uid = ? and num = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, uid);
				pstmt.setInt(2, num);
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
		
		
		
		
		
		
		
		public Vector<ReservationBean> getSelectByUser(String userId, int limitNum, int listNum) {
	        Vector<ReservationBean> data = new Vector<>();
	        getCon();
	        try {
	            String sql = "SELECT * FROM reservation WHERE uid = ? ORDER BY num DESC LIMIT ?, ?";
	            pstmt = con.prepareStatement(sql);
	            pstmt.setString(1, userId);
	            pstmt.setInt(2, limitNum);
	            pstmt.setInt(3, listNum);
	            
	            System.out.println(pstmt);
	            rs = pstmt.executeQuery();

	            while (rs.next()) {
	                ReservationBean rbean = new ReservationBean();
	                rbean.setNum(rs.getInt("num"));
					rbean.setUid(rs.getString("uid"));
					rbean.setUname(rs.getString("uname"));
					rbean.setTel(rs.getString("tel"));
					rbean.setPostcode(rs.getInt("postcode"));
					rbean.setAddr(rs.getString("addr"));
					rbean.setDetailaddr(rs.getString("detailaddr"));
					rbean.setComment(rs.getString("comment"));
					rbean.setSelectdate(rs.getString("selectdate"));
					rbean.setCount(rs.getInt("count"));
					rbean.setWdate(rs.getString("wdate"));
					rbean.setDaily(rs.getInt("daily"));
					rbean.setBlanket(rs.getInt("blanket"));
					rbean.setShirt(rs.getInt("shirt"));
					rbean.setDry(rs.getInt("dry"));
					rbean.setCare(rs.getInt("care"));
					rbean.setTotalprice(rs.getInt("totalprice"));
					rbean.setCondition(rs.getInt("condition"));

	                data.add(rbean);
	            }
	            con.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return data;
	    }
	    
	    
	    public int getSelectCountByUser(String userId) {
	        int count = 0;
	        getCon();
	        try {
	            String sql = "SELECT COUNT(*) AS count FROM reservation WHERE uid = ?";
	            pstmt = con.prepareStatement(sql);
	            pstmt.setString(1, userId);
	            rs = pstmt.executeQuery();

	            if (rs.next()) {
	                count = rs.getInt("count");
	            }
	            con.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return count;
	    }
	    
	    
	    
	    
	    
	    public ReservationBean getReservationByNum(String reservationNum) {
	    	getCon();
	        ReservationBean reservation = null;

	        try {
	            
	            String query = "SELECT * FROM reservation WHERE num = ?";
	            pstmt = con.prepareStatement(query);
	            pstmt.setString(1, reservationNum);
	            rs = pstmt.executeQuery();

	            if (rs.next()) {
	                // Retrieve the reservation details from the result set
	                int num = rs.getInt("num");
	                String uid = rs.getString("uid");
	                String tel = rs.getString("tel");
	                int postcode = rs.getInt("postcode");
	                String addr = rs.getString("addr");
	                String detailaddr = rs.getString("detailaddr");
	                int daily = rs.getInt("daily");
	                int blanket = rs.getInt("blanket");
	                int shirt = rs.getInt("shirt");
	                int dry = rs.getInt("dry");
	                int care = rs.getInt("care");
	                int totalprice = rs.getInt("totalprice");

	                // Create a ReservationBean object and set the retrieved values
	                reservation = new ReservationBean();
	                reservation.setNum(num);
	                reservation.setUid(uid);
	                reservation.setTel(tel);
	                reservation.setPostcode(postcode);
	                reservation.setAddr(addr);
	                reservation.setDetailaddr(detailaddr);
	                reservation.setDaily(daily);
	                reservation.setBlanket(blanket);
	                reservation.setShirt(shirt);
	                reservation.setDry(dry);
	                reservation.setCare(care);
	                reservation.setTotalprice(totalprice);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        } 

	        return reservation;
	    }
	    
	    //예약 삭제
	    public boolean deleteReservation(int reservationNum) {
	    	   getCon();
	    	   boolean success = false;
	    	   
	    	   try {
	    	      
	    	      // 예약 정보 삭제 SQL 쿼리 작성
	    	      String query = "DELETE FROM reservation WHERE num = ?";
	    	      
	    	      pstmt = con.prepareStatement(query);
	    	      pstmt.setInt(1, reservationNum);
	    	      
	    	      int rowCount = pstmt.executeUpdate();
	    	      
	    	      if (rowCount > 0) {
	    	         // 예약 정보 삭제 성공
	    	         success = true;
	    	      }
	    	   } catch (SQLException e) {
	    	      e.printStackTrace();
	    	   } 
	    	   
	    	   return success;
	    	}
	    
	    
	    // search
	    public ArrayList<ReservationBean> getSearch(String searchField, String searchText){
			getCon();
			ArrayList<ReservationBean> search = new ArrayList<ReservationBean>();
			String sql = "select * from reservation where "+searchField.trim();
			try {
				if(searchText != null && !searchText.equals("")) {
					sql +=" like '%"+searchText.trim()+ "%' order by num desc";
				}
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					ReservationBean bean = new ReservationBean();
					bean.setNum(rs.getInt(1));
					bean.setUid(rs.getString(2));
					bean.setUname(rs.getString(3));
					bean.setTel(rs.getString(4));
					bean.setPostcode(rs.getInt(5));
					bean.setAddr(rs.getString(6));
					bean.setDetailaddr(rs.getString(7));
					bean.setComment(rs.getString(8));
					bean.setSelectdate(rs.getString(9));
					bean.setCount(rs.getInt(10));
					bean.setWdate(rs.getString(11));
					bean.setDaily(rs.getInt(12));
					bean.setBlanket(rs.getInt(13));
					bean.setShirt(rs.getInt(14));
					bean.setDry(rs.getInt(15));
					bean.setCare(rs.getInt(16));
					bean.setTotalprice(rs.getInt(17));
					bean.setCondition(rs.getInt(18));
					
					
					search.add(bean);
					//System.out.println(pstmt);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			return search;
		}
	    
	    
	  

	    
	 
	    
	    
	    
	  
	}
		
	
