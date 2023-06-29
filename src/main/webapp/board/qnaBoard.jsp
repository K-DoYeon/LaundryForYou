<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.BoardDAO, board.BoardBean, board.CommentBean"%>
<%
    request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<link rel="stylesheet" href="../css/boardqna.css">
<head>
<meta charset="UTF-8">
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet" 
   href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" 
   integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" 
   crossorigin="anonymous" />

<title>Q&A Board</title>

<%

	int num = Integer.parseInt(request.getParameter("num").trim());

   BoardDAO dao = new BoardDAO();
   BoardBean bean = dao.getOneBoard(num);
   
   
%>
<style>
@font-face {
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2106@1.1/IM_Hyemin-Bold.woff2') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'TheJamsil5Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302_01@1.0/TheJamsil5Bold.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}
@font-face {
    font-family: 'SUITE-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/SUITE-Regular.woff2') format('woff2');
    font-weight: 400;
    font-style: normal;
}
.gnb-header, .welcome-header{
		margin: 0;
	}
.choi-body {
  padding-bottom: 30px;
  font-family: 'SUITE-Regular';
}
.form-control:disabled, .form-control[readonly]{
   backgrond-color : #fff;
   opacity : 1;
}
button a{
   color : #fff;
   border : none;
}
button a:hover{
   color : #fff;
   text-decoration:none;
}
.choi-qna{
   text-align : right;
}
.choi-qna-btn{
   background-color : #58A3BC;
   color : #fff;
  font-family: 'SUITE-Regular';
}
.choi-qna-btn:hover{
   background-color : #3E83A8;
   color : #fff;
   font-family: 'SUITE-Regular';
}
.menu{
   justify-content : space-between;
}
</style>
</head>
<body class = "choi-body">

<%


int commentid = 0;
if(request.getParameter("commentid") != null)
   commentid = Integer.parseInt(request.getParameter("commentid"));
CommentBean comment = new BoardDAO().getComment(commentid);

CommentBean cmt = new CommentBean();

   String id = (String) session.getAttribute("uid");
   String pw = (String) session.getAttribute("upass");
   Integer levelObj = (Integer) session.getAttribute("level");
   int level = (levelObj != null) ? levelObj.intValue() : 0;

%>

<jsp:include page="/include/header.jsp" />
   <article>
   
      <div class="container" role="main">
         <h2 class = "text-center">QnA</h2>
            <div class="mb-3 mt-4 subject">
               <label for="title">제목</label>
               <input type="text" class="form-control" name="subject" id="subject" placeholder="<%=bean.getSubject()%>" readonly>
            </div> 
            <div class="mb-3 d-flex menu">
               <div>
                  <label for="reg_num"><%=bean.getNum() %> /</label>
                  <label for="reg_id"><%=bean.getUid() %></label>
               </div>
               <div>
                  <label for="reg_wdate"><%=bean.getWdate() %> /</label>
                  <label for="reg_readcount"><%=bean.getReadcount() %></label>
               </div>
            </div>   
            
            <div class="mb-3">
               <label for="content">내용</label>
               <textarea class="form-control" rows="5" name="content" id="content" readonly><%=bean.getContent() %></textarea>
            </div>      
            
         <div class ="choi-qna">
            <button type="button" class="btn btn-sm choi-qna-btn" id="btnSave" value ="submit" onclick="location.href='qnaUpdate.jsp?num=<%=bean.getNum() %>'">수정</button> 
            <button type="button" class="btn btn-sm choi-qna-btn" id="btnList" onclick="location.href='qnaDelete.jsp?num=<%=bean.getNum() %>'">삭제</button>
         </div>               
      
      <!-- 댓글  -->
      <div class="container">
         <div class="do-comment">
         <span>Comments</span>
        </div>

<div class="doco">

<%
   BoardDAO cdao = new BoardDAO();
    ArrayList<CommentBean> list = cdao.getList(bean.getNum());
    for(int i = 0; i<list.size(); i++){      
%>
            <div class="do-reply-con">
               <div class="do-reply">
                  <div class="do-re-left">
                     <span><%=list.get(i).getUid() %> / </span>
                     <span><%=list.get(i).getWdate().substring(0,11) %></span>
                  </div>
<%

   if(level == 99){
   
%>
                  <div class="do-re-right">
                     <a href="CommentUpdate.jsp?num=<%=bean.getNum()%>&commentid=<%=list.get(i).getCommentid() %>" class="edit">수정
                           <input type="hidden" name="uid" value="<%= id %>">
                        </a>
                        <a onclick="return confirm('정말로 삭제하시겠습니까?')" href="commentDeleteAction.jsp?num=<%=bean.getNum()%>&commentid=<%=list.get(i).getCommentid() %>" class="delete">삭제
                           <input type="hidden" name="uid" value="<%= list.get(i).getUid() %>">
                        </a>
                  </div>
<%
   }
%>
         
               </div>
               <div class="do-reply-item">
                  <p><%=list.get(i).getContent() %></p>
               </div>
               
            </div>
<%
    }
%>

      </div>

      
   <div class="container">
    <form id="commentForm" name="commentForm" method="post" action="submitAction.jsp" accept-charset="UTF-8">
   <input type="hidden" name="ref" value="<%=bean.getNum()%>">

<%

   if(level == 99){
   
%>

            <div class="do-commentbox">
                <div class="do-left">
                     <p>ID : <span class="id"><%=id%></span></p>
                   <p>PW : <span class="pw"><%=pw%></span></p>
                </div>
                <div class="do-right">
                   <textarea rows="5" cols="100" name="content" placeholder="관리자만 쓸수있습니다." maxlength="100"></textarea>
                </div>
            </div>
            
            <div class ="choi-qna">
            <input type="submit" class="btn btn-sm choi-qna-btn" id="cmtCnt-btn" value="등록">
            <!-- <button type="submit" class="btn btn-sm choi-qna-btn" id="btnSave">등록</button> -->
         </div>    
    </form>
</div>
<%
   }
%>



      </div>
   </article>
   
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="../js/boardlist.js"></script>
</body>
</html>

<jsp:include page="../include/footer.jsp"></jsp:include>