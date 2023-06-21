package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Vector;

public class BoardDAO {
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
   
   // 하나의 새로운 게시글이 넘어와서 저장되는 메소드
      public void insertBoard(BoardBean bean) {
         getCon();
         
         try {
            //게시글 전체값을 데이터 테이블에 저장
            String sql = "insert into board values(num, ?, ?, 0, ?, ?, sysdate(), 0, 0, 1)";
            pstmt = con.prepareStatement(sql);
            
            pstmt.setString(1, bean.getUid());
            pstmt.setString(2, bean.getUpass());
            //pstmt.setInt(3, bean.getLevel());
            pstmt.setString(3, bean.getSubject());
            pstmt.setString(4, bean.getContent());
            
            pstmt.executeUpdate();
            
            con.close();
            
            
         } catch (Exception e) {
            e.printStackTrace();
         }
      }
      
      
      // 모든 게시글 리턴
      public Vector<BoardBean> getAllBoard(){
         Vector<BoardBean> v = new Vector<>();
         
         getCon();
         
         try {
            String sql = "select * from board order by num desc";
            pstmt = con.prepareStatement(sql);
            // 쿼리 실행 후 결과 저장
            rs = pstmt.executeQuery();
            // 데이터 개수를 모르기에 반복문으로 추출
            while (rs.next()) {
               // 데이터를 패키징
               BoardBean bean = new BoardBean();         
               bean.setNum(rs.getInt(1));
               bean.setUid(rs.getString(2));
               bean.setUpass(rs.getString(3));
               bean.setLevel(rs.getInt(4));
               bean.setSubject(rs.getString(5));
               bean.setContent(rs.getString(6));
               bean.setWdate(rs.getDate(7).toString());
               bean.setReadcount(rs.getInt(8));
               bean.setReplycount(rs.getInt(9));
               bean.setLike(rs.getInt(10));
               // 패키징 한 데이터를 백터에 저장
               v.add(bean);
            }
            
            con.close();
         } catch (Exception e) {
            e.printStackTrace();
         }
         return v;
      }
      
      public int getBoardCount() {
         getCon();
         int count = 0;
         try {
            String sql = "select count(*) from board";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            if(rs.next()) {
               count = rs.getInt(1);
               System.out.println("게시판 글 갯수 : " + count);
            }
         } catch (Exception e) {
            e.printStackTrace();
         }finally {
            try {
               con.close();
            }catch (Exception e) {
               e.printStackTrace();
            }
         }
         return count;
      }
      
      public ArrayList<BoardBean> getBoardList(){
         ArrayList<BoardBean> list = new ArrayList<BoardBean>();
         getCon();
         try {
            String sql = "select * from board order by num desc";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            
            while(rs.next()) {
               BoardBean bBean = new BoardBean();
               bBean.setNum(rs.getInt(1));
               bBean.setUid(rs.getString(2));
               bBean.setUpass(rs.getString(3));
               bBean.setLevel(rs.getInt(4));
               bBean.setSubject(rs.getString(5));
               bBean.setContent(rs.getString(6));
               bBean.setWdate(rs.getString(7));
               bBean.setReadcount(rs.getInt(8));
               bBean.setReplycount(rs.getInt(9));
               bBean.setLike(rs.getInt(10));
               
               list.add(bBean);
            }
         }catch (Exception e) {
            e.printStackTrace();
         }
         return list;
      }
      
      /****************************list********************************/
      /**************************comment*******************************/
            public CommentBean getref(int ref) {
               String sql = "select * from comment where ref = ?";
               
               try {
                  pstmt = con.prepareStatement(sql);
                  pstmt.setInt(1, ref);
                  
                  rs= pstmt.executeQuery();
                  
                  while(rs.next()) {
                     CommentBean comment = new CommentBean();
                     comment.setCommentid(rs.getInt(1));
                     comment.setUid(rs.getString(2));
                     comment.setUpass(rs.getString(3));
                     comment.setContent(rs.getString(4));
                     comment.setWdate(rs.getString(5));
                     comment.setRef(rs.getInt(6));
                     comment.setLike(rs.getInt(7));
                     comment.setCommentAvailable(rs.getInt(8));
                     
                     return comment;
                  }
                  
               } catch (Exception e) {
                  e.printStackTrace();
               }
               return null;
            }
      
            public int write(String content, String upass, String uid, int ref) {
               getCon();
               
               try {
                  String sql = "insert into comment values(commentid,?,?,?,sysdate(),?,0,1)";
                  pstmt = con.prepareStatement(sql);
                  
                  pstmt.setString(1, uid);
                  pstmt.setString(2, upass);
                  pstmt.setString(3, content);
                  pstmt.setInt(4, ref);
                  
                  System.out.println(pstmt);
                  
                  return pstmt.executeUpdate();
                  
               } catch (Exception e) {
                  e.printStackTrace();
               }
               return -1;
            }
            
            public ArrayList<CommentBean> getList(int ref){
               getCon();
               String sql = "select * from comment where ref = ? and commentAvailable = 1;";
               ArrayList<CommentBean> list = new ArrayList<CommentBean>();
               try {
                  
                  pstmt = con.prepareStatement(sql);
                  pstmt.setInt(1, ref);
                  rs = pstmt.executeQuery();
                  
                  while(rs.next()) {
                     CommentBean comment = new CommentBean();
                     
                     comment.setCommentid(rs.getInt(1));
                     comment.setUid(rs.getString(2));
                     comment.setUpass(rs.getString(3));
                     comment.setContent(rs.getString(4));
                     comment.setWdate(rs.getString(5));
                     comment.setRef(rs.getInt(6));
                     comment.setLike(rs.getInt(7));
                     comment.setCommentAvailable(rs.getInt(8));
                     
                     list.add(comment);
                  }
                  
               }catch (Exception e) {
                  e.printStackTrace();
               }
               
               return list;
            }
            
            public CommentBean getComment(int commentid) {
               getCon();
               
               try {
                  String sql = "select * from comment where commentid = ?";
                  pstmt = con.prepareStatement(sql);
                  pstmt.setInt(1, commentid);
                  rs = pstmt.executeQuery();
                  
                  System.out.println(pstmt);
                  
                  while(rs.next()) {
                     CommentBean comment = new CommentBean();
                     comment.setCommentid(rs.getInt(1));
                     comment.setUid(rs.getString(2));
                     comment.setUpass(rs.getString(3));
                     comment.setContent(rs.getString(4));
                     comment.setWdate(rs.getString(5));
                     comment.setRef(rs.getInt(6));
                     comment.setLike(rs.getInt(7));
                     
                     return comment;
                  }
               } catch (Exception e) {
                  e.printStackTrace();
               }
               return null;
            }
            
            public int update(int ref, int commentid, String content) {
               getCon();
               String sql = "update comment set content = ? where ref = ? and commentid = ?";
               try {
               pstmt = con.prepareStatement(sql);
               pstmt.setString(1, content);
               System.out.println(pstmt);
               pstmt.setInt(2, ref);
               pstmt.setInt(3, commentid);
               
               return pstmt.executeUpdate();
            } catch (Exception e) {
               e.printStackTrace();
            }
               
               return -1;
            }
            
            public CommentBean getOneUpdateComment(int commentid) {
               CommentBean comment = new CommentBean();
               getCon();
               
               try {
               String sql = "select * from comment where Commentid = ?";
               pstmt = con.prepareStatement(sql);
               pstmt.setInt(1, commentid);
               rs = pstmt.executeQuery();
               if(rs.next()) {
                  comment.setCommentid(rs.getInt(1));
                       comment.setUid(rs.getString(2));
                       comment.setUpass(rs.getString(3));
                       comment.setContent(rs.getString(4));
                       comment.setWdate(rs.getString(5));
                       comment.setRef(rs.getInt(6));
                       comment.setLike(rs.getInt(7));
               }
               con.close();
               
            } catch (Exception e) {
               e.printStackTrace();
            }
               return comment;
            }
            
            public int delete(int commentid) {
               getCon();
               String sql = "delete from comment where commentid = ?";
               try {
                  pstmt = con.prepareStatement(sql);
                  pstmt.setInt(1, commentid);
                  
                  return pstmt.executeUpdate();
               }catch (Exception e) {
               e.printStackTrace();
            }
               return -1;
            }
            
            
      /**************************search*******************************/
      
      //게시글 검색
      public ArrayList<BoardBean> getSearch(String searchField, String searchText){
         ArrayList<BoardBean> list = new ArrayList<BoardBean>();
         getCon();
         String sql = "select * from board where " + searchField.trim();
         try {
            if(searchText != null && !searchText.equals("")) {
               sql +=" like '%"+searchText.trim()+ "%' order by num desc";
            }
            pstmt = con.prepareStatement(sql);
            System.out.println(sql);
            rs = pstmt.executeQuery();
            
            while(rs.next()) {
               BoardBean bean = new BoardBean();
               bean.setNum(rs.getInt(1));
               bean.setUid(rs.getString(2));
               bean.setUpass(rs.getString(3));
               bean.setLevel(rs.getInt(4));
               bean.setSubject(rs.getString(5));
               bean.setContent(rs.getString(6));
               bean.setWdate(rs.getString(7));
               bean.setReadcount(rs.getInt(8));
               bean.setReplycount(rs.getInt(9));
               bean.setLike(rs.getInt(10));
               list.add(bean);
            }
            
         }catch(Exception e) {
            e.printStackTrace();
         }
         return list;
      }
      
      
      
      //페이징 처리
      public ArrayList<BoardBean> getBoardList(int startRow, int pageSize){
         ArrayList<BoardBean> boardlist = new ArrayList<BoardBean>();
         getCon();
         try {
            String sql = "select * from board order by num desc limit ?,?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, startRow - 1);
            pstmt.setInt(2, pageSize);
            rs = pstmt.executeQuery();
            while(rs.next()) {
               BoardBean bBean = new BoardBean();
               bBean.setNum(rs.getInt(1));
               bBean.setUid(rs.getString(2));
               bBean.setUpass(rs.getString(3));
               bBean.setLevel(rs.getInt(4));
               bBean.setSubject(rs.getString(5));
               bBean.setContent(rs.getString(6));
               bBean.setWdate(rs.getString(7));
               bBean.setReadcount(rs.getInt(8));
               bBean.setReplycount(rs.getInt(9));
               bBean.setLike(rs.getInt(10));
               
               boardlist.add(bBean);
               System.out.print(pstmt);
            }
         } catch (Exception e) {
            e.printStackTrace();
         }
         return boardlist;
      }
   
      //qnaBoard 게시글 리턴
            public BoardBean getOneBoard(int num) {
               //리턴타입 선언
               BoardBean bean = new BoardBean();
               getCon();
               
               try {

                  //조회수쿼리
                  String readsql = "update board set readcount = readcount + 1 where num = ?";
                  pstmt = con.prepareStatement(readsql);
                  pstmt.setInt(1, num);
                  pstmt.executeUpdate();
                  pstmt.clearParameters();
                  //쿼리준비
                  String sql = "select * from board where num = ?";
                  pstmt=con.prepareStatement(sql);
                  pstmt.setInt(1, num);
                  //쿼리 결과 리턴
                  rs=pstmt.executeQuery();
                  
                  if(rs.next()) {
                     bean.setNum(rs.getInt(1));
                     bean.setUid(rs.getString(2));
                     bean.setUpass(rs.getString(3));
                     bean.setLevel(rs.getInt(4));
                     bean.setSubject(rs.getString(5));
                     bean.setContent(rs.getString(6));
                     bean.setWdate(rs.getString(7));
                     bean.setReadcount(rs.getInt(8));
                     bean.setReplycount(rs.getInt(9));
                     bean.setLike(rs.getInt(10));
                  }
                  System.out.println("연결성공!!!!!!!!!!!");
               } catch (Exception e) {
                  e.printStackTrace();
                  System.out.println("연결실패!!!!!!!!!!!!!1");
               }
               return bean;
            }
            
      //qnaBoardupdate 게시글 리턴
         public BoardBean getOneUpdateBoard(int num) {
            //리턴타입 선언
            BoardBean bean = new BoardBean();
            getCon();
               
            try {
                  
               //쿼리준비
               String sql = "select * from board where num=?";
               pstmt=con.prepareStatement(sql);
               pstmt.setInt(1, num);
               //쿼리 결과 리턴
               rs=pstmt.executeQuery();
               
               if(rs.next()) {
                  bean.setNum(rs.getInt(1));
                  bean.setSubject(rs.getString(2));
                  bean.setUid(rs.getString(3));
                  bean.setWdate(rs.getString(4).toString());
                  bean.setReadcount(rs.getInt(5));
                  bean.setContent(rs.getString(6));
                  bean.setUpass(rs.getString(7));
               }
            con.close();
            } catch (Exception e) {
               e.printStackTrace();
            }
            return bean;
         }      
         
         
			/*
			 * //update시 필요한 패스워드값 public String uPass(int num) { String pass = "";
			 * getCon();
			 * 
			 * try { String sql = "select*from board where num = ?";
			 * pstmt=con.prepareStatement(sql); pstmt.setInt(1, num); rs=
			 * pstmt.executeQuery();
			 * 
			 * if(rs.next()) { pass=rs.getString(1); } con.close(); } catch (Exception e) {
			 * e.printStackTrace(); } return pass;
			 * 
			 * }
			 * 
			 * //게시글 수정 메소드 public void updateBoard(BoardBean bean) { getCon();
			 * 
			 * try { String sql = "update board set subject =?, content =?, where num =? ";
			 * pstmt = con.prepareStatement(sql); pstmt.setString(1, bean.getSubject());
			 * pstmt.setString(2, bean.getContent()); pstmt.setInt(3, bean.getNum());
			 * 
			 * pstmt.executeUpdate(); con.close(); } catch (Exception e) {
			 * e.printStackTrace(); } }
			 */
     	//게시글 수정 메소드
			public int modifyBoard (BoardBean bean) {
				int result = -1;
				getCon();
				try {
					String sql = "select upass from board where num=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, bean.getNum());
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						if(bean.getUpass().equals(rs.getString("upass"))) {
							//게시판에 글이 있으면 수정 가능
							String qeury = "update board set content=? where num=?";
							pstmt = con.prepareStatement(qeury);
							pstmt.setString(1, bean.getContent());
							pstmt.setInt(2, bean.getNum());
							result = pstmt.executeUpdate();
						}else {
							//게시판 비밀번호가 다를 시
							result = 0;
						}
					}else {
						//게시판 글이 없을 시
						result = -1;
					}
					System.out.println("게시글 수정 완료"+result);
				} catch (Exception e) {
					e.printStackTrace();
				}
				return result;
			}
			
		
		//게시글 삭제 메소드
			public int deleteBoard(int num, String upass) {
				int result = -1;
				getCon();
				try {
					String sql = "select upass from board where num=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, num);
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						if(upass.equals(rs.getString("upass"))) {
							String query = "delete from board where num=?";
							pstmt=con.prepareStatement(query);
							pstmt.setInt(1, num);
							result = pstmt.executeUpdate();
						}else {
							//비밀번호 오류 시
							result = 0;
						}
					}else {
						//게시글 없을 시
						return -1;
					}
				} catch (Exception e) {
					e.printStackTrace();
				}
				return result;
			}
}







