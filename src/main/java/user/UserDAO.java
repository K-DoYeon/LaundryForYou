package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;





public class UserDAO {
	
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
	public void insert(UserBean bean) {
		getCon();
		try {
			
			String sql = "insert into user values (num, ?, ? ,? ,?, ?, ?, ?, ?, ?, ?, ? ,?, ?, ? )";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getUid());
			pstmt.setString(2, bean.getUpass());
			pstmt.setString(3, bean.getUpasscheck());
			pstmt.setString(4, bean.getUname());
			pstmt.setString(5, bean.getUemail());
			pstmt.setString(6, bean.getTel());
			pstmt.setInt(7, bean.getPostcode());
			pstmt.setString(8, bean.getAddr());
			pstmt.setString(9, bean.getDetailaddr());
			pstmt.setString(10, bean.getGender());
			pstmt.setInt(11, bean.getBirth());
			
			String addr = bean.getAddr();
			int level = calculateLevel(addr);
			pstmt.setInt(12, level);
			
			pstmt.setInt(13, bean.getVip());
			pstmt.setString(14, bean.getImg());
			
			pstmt.executeUpdate();
			
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private int calculateLevel(String address) {
		int level = 0;
		
		if (address.contains("서울")) {
			level = 1;
		} else {
			level = 2;
		}
		return level;
	}
	
	// 멤버 수정
	public int update(int vip, int num) {
		int flag = 0;
		getCon();
		try {
			String sql = "update user set vip=? where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, vip);
			pstmt.setInt(2, num);
			
			flag = pstmt.executeUpdate();
			
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return flag;
	}
	
	
	// 멤버 수정
	public int updateAddr(int level, int num) {
		int flag = 0;
		getCon();
		try {
			String sql = "update user set level=? where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, level);
			pstmt.setInt(2, num);
			
			flag = pstmt.executeUpdate();
			
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return flag;
	}
	
	

	
	// select
	public Vector<UserBean> getSelect(int limitNum, int listNum) {
		Vector<UserBean> data = new Vector<>();
		getCon();
		try {
			String sql = "select * from user order by num desc limit ?, ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, limitNum);
			pstmt.setInt(2, listNum);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				UserBean ubean = new UserBean();
				ubean.setNum(rs.getInt("num"));
				ubean.setUid(rs.getString("uid"));
				ubean.setUpass(rs.getString("upass"));
				ubean.setUpasscheck(rs.getString("upasscheck"));
				ubean.setUname(rs.getString("uname"));
				ubean.setUemail(rs.getString("uemail"));
				ubean.setTel(rs.getString("tel"));
				ubean.setPostcode(rs.getInt("postcode"));
				ubean.setAddr(rs.getString("addr"));
				ubean.setDetailaddr(rs.getString("detailaddr"));
				ubean.setGender(rs.getString("gender"));
				ubean.setBirth(rs.getInt("birth"));
				ubean.setLevel(rs.getInt("level"));
				ubean.setVip(rs.getInt("vip"));
				ubean.setImg(rs.getString("img"));
				data.add(ubean);
			}
			
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return data;
	}
	
	//AllSelect
	public int getAllSelect() {
		int allCount = 0;
		Statement st = null;
		getCon();
		
		try {
			
			String sql = "select count(*) from user";
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
	
	
	//아이디 중복확인
	public int duplicate(String uid) {
		int count = 0;
		
		try {
			getCon();
			String sql = "select count(uid) as count from user where uid=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, uid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				count = rs.getInt("count");
			}
		}catch(Exception e) {
			System.out.println("아이디 중복확인 실패 : " + e);
		}
		
		return count;
	}
	
	
	//아이디 찾기
	public String idFind(String uname, String tel) {
		String uid = null;
		
		try {
			getCon();
			String sql = "select uid from user where uname=? and tel=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, uname);
			pstmt.setString(2, tel);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				uid = rs.getString("uid");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return uid;
	}
	
	
	//비밀번호 찾기
		public String pwFind(String uid, String tel) {
			String upass = null;
			
			try {
				getCon();
				String sql = "select upass from user where uid=? and tel=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, uid);
				pstmt.setString(2, tel);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					upass = rs.getString("upass");
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			return upass;
		}
	
	
		
		public int login(String uid, String upass) {
			try {
				getCon();
				String sql = "select * from user where uid = ? and upass = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, uid);
				pstmt.setString(2, upass);
				rs = pstmt.executeQuery(); 
				
				if (rs.next())
					return 1; //로그인 성공
				else {
					return 0; //로그인 실패
				}
									
			}catch(Exception e) {
				e.printStackTrace();
				
			}
			return -2; //DB 오류 
		}
	
	
		public String userImg(String uid, String upass) {
			String img = null;
			try {
				getCon();
				String sql = "select img from user where uid = ? and upass = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, uid);
				pstmt.setString(2, upass);
				rs = pstmt.executeQuery(); 
				System.out.println(pstmt);
				if(rs.next()) {
					img = rs.getString("img");
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			return img;
		}
		
		public int userLevel(String uid) {
			int level = 0;
			try {
				getCon();
				String sql = "select level from user where uid = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, uid);
				rs = pstmt.executeQuery(); 
				System.out.println(pstmt);
				if(rs.next()) {
					level = rs.getInt("level");
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			return level;
		}
		
		public int userVip(String uid) {
			int vip = 0;
			try {
				getCon();
				String sql = "select vip from user where uid = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, uid);
				rs = pstmt.executeQuery(); 
				System.out.println(pstmt);
				if(rs.next()) {
					vip = rs.getInt("vip");
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			return vip;
		}
		
		public boolean changePass(String uid, String newpass) {
			boolean flag = false;
			try {
				getCon();
				String sql = "update user set upass=?, upasscheck=? where uid=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, newpass);
				pstmt.setString(2, newpass);
				pstmt.setString(3, uid);
				
				int i = pstmt.executeUpdate();

				if(i == 1) {
					flag = true;
				} else {
					flag = false;
				}			
			} catch (Exception e) {
				e.printStackTrace();
			}
			return flag; //DB 오류 
		}
		
		public String userPass(String uid) {
			String upass = null;
			try {
				getCon();
				String sql = "select upass from user where uid = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, uid);
				rs = pstmt.executeQuery(); 
				System.out.println(pstmt);
				if(rs.next()) {
					upass = rs.getString("upass");
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			return upass;
		}
		
		public String userName(String uid) {
			String uname = null;
			try {
				getCon();
				String sql = "select uname from user where uid = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, uid);
				rs = pstmt.executeQuery(); 
				System.out.println(pstmt);
				if(rs.next()) {
					uname = rs.getString("uname");
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			return uname;
		}
		
		public String userEmail(String uid) {
			String uemail = null;
			try {
				getCon();
				String sql = "select uemail from user where uid = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, uid);
				rs = pstmt.executeQuery(); 
				System.out.println(pstmt);
				if(rs.next()) {
					uemail = rs.getString("uemail");
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			return uemail;
		}
		
		public String userTel(String uid) {
			String tel = null;
			try {
				getCon();
				String sql = "select tel from user where uid = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, uid);
				rs = pstmt.executeQuery(); 
				System.out.println(pstmt);
				if(rs.next()) {
					tel = rs.getString("tel");
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			return tel;
		}
		
		public int userPostcode(String uid) {
			int postcode = 0;
			try {
				getCon();
				String sql = "select postcode from user where uid = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, uid);
				rs = pstmt.executeQuery(); 
				System.out.println(pstmt);
				if(rs.next()) {
					postcode = rs.getInt("postcode");
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			return postcode;
		}
		
		public String userAddr(String uid) {
			String addr = null;
			try {
				getCon();
				String sql = "select addr from user where uid = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, uid);
				rs = pstmt.executeQuery(); 
				System.out.println(pstmt);
				if(rs.next()) {
					addr = rs.getString("addr");
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			return addr;
		}
		
		public String userDetailaddr(String uid) {
			String detailaddr = null;
			try {
				getCon();
				String sql = "select detailaddr from user where uid = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, uid);
				rs = pstmt.executeQuery(); 
				System.out.println(pstmt);
				if(rs.next()) {
					detailaddr = rs.getString("detailaddr");
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			return detailaddr;
		}
		
		public String userGender(String uid) {
			String gender = null;
			try {
				getCon();
				String sql = "select gender from user where uid = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, uid);
				rs = pstmt.executeQuery(); 
				System.out.println(pstmt);
				if(rs.next()) {
					gender = rs.getString("gender");
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			return gender;
		}
		
		public int userBirth(String uid) {
			int birth = 0;
			try {
				getCon();
				String sql = "select birth from user where uid = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, uid);
				rs = pstmt.executeQuery(); 
				System.out.println(pstmt);
				if(rs.next()) {
					birth = rs.getInt("birth");
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			return birth;
		}
		
		
		public boolean updateInfo(String uname, String uemail, String tel, int postcode, String addr,
				String detailaddr, int birth, String uid) {
			boolean flag = false;
			try {
				getCon();
				String sql = "update user set uname=?, uemail=?, tel=?, postcode=?, addr=?"
						+ ", detailaddr=?, birth=?, level=? where uid=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, uname);
				pstmt.setString(2, uemail);
				pstmt.setString(3, tel);
				pstmt.setInt(4, postcode);
				pstmt.setString(5, addr);
				pstmt.setString(6, detailaddr);
				pstmt.setInt(7, birth);
				
				int level = Level(addr);
				pstmt.setInt(8, level);
				
				pstmt.setString(9, uid);
				
				int i = pstmt.executeUpdate();

				if(i == 1) {
					flag = true;
				} else {
					flag = false;
				}			
			} catch (Exception e) {
				e.printStackTrace();
			}
			return flag; //DB 오류 
		}
		
		
		private int Level(String addr) {
			int level = 0;
			
			if (addr.contains("서울")) {
				level = 1;
			} else {
				level = 2;
			}
			return level;
		}
		
		public boolean updateImg(String uid, String img) {
			boolean flag = false;
			try {
				getCon();
				String sql = "update user set img=? where uid=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, img);
				pstmt.setString(2, uid);
					
				int i = pstmt.executeUpdate();
				
				System.out.println(pstmt);
				
				if(i == 1) {
					flag = true;
				} else {
					flag = false;
				}			
			} catch (Exception e) {
				e.printStackTrace();
			}
			return flag; //DB 오류 
		}
		
		
}//userDAO