<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="review.ReviewBean, review.ReviewDAO, review.RCommentBean, likey.LikeyDAO, likey.LikeyDTO, reservation.ReservationDAO" %>
<%@ page import="java.util.*"%>
<%@ page import = "java.io.*" %>

<%
ReviewDAO rdao = new ReviewDAO();
ArrayList<ReviewBean> reviewlist = null;
reviewlist = rdao.getReviewList();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jQuery -->

<!-- Bootstrap CSS -->
<link rel="stylesheet" 
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" 
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" 
	crossorigin="anonymous" />

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<jsp:include page="../include/header.jsp"></jsp:include>
<%
	int num = Integer.parseInt(request.getParameter("num").trim());

	ReviewDAO dao = new ReviewDAO();
	ReviewBean bean = dao.getOneReview(num);
	RCommentBean rbean = new RCommentBean();

%>
<%
	String subject = bean.getSubject();
	String uid = bean.getUid();
	String loginid = (String) session.getAttribute("uid");
	int level = 0;
	if(loginid != null){
	level = (Integer)session.getAttribute("level");
	}
	LikeyDAO ldao = new LikeyDAO();
	boolean lresult = ldao.countLike(loginid, subject);
	System.out.println(lresult);
	
	ReservationDAO rsdao = new ReservationDAO();
	int resnum = Integer.parseInt(request.getParameter("resnum"));
	

%>
<%
	uid = null;
	if(session.getAttribute("uid")!=null){
		uid = (String)session.getAttribute("uid");
	}
%>
<style>
@font-face {
    font-family: 'IM_Hyemin-Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2106@1.1/IM_Hyemin-Bold.woff2') format('woff');
    font-weight: normal;
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
body {
  font-family:  'SUITE-Regular';
}
article{
	margin: 50px 0px;
}
.container{
	margin-top : 50px;
}
button a{
	color : #fff;
	border : none;
}
button a:hover{
	color : #fff;
	border : none;
}
.choi-qna{
	text-align : right;
}
.choi-qna-btn{
	background-color : #58A3BC;
	color : #fff;
	font-family:  'SUITE-Regular';
	text-align : right;
}
.choi-qna-btn:hover{
	background-color : #3E83A8;
	color : #fff;
	font-family:  'SUITE-Regular';	
}
.justify{
	justify-content : space-between;
}
.menu{
   justify-content : space-between;
}
.review textarea{
	resize : none;
}
.review-img img{
	width : 400px;
	height : auto;
	margin : 0 auto;
	display: block;
	padding : 0 auto;
}
input:read-only {
    background-color: #fff;
}
.mj-btn{
	margin-top: 15px;
	margin-bottom: 15px;
	background-color: transparent;
	border: none;
	cursor: pointer;
	
}
.mj-btn:focus{
	outline: none;
}
.heart-emo{
	font-color: 30px;
}
i.fa-heart{
	color: #bc2222;
}
i.fa-heart:hover{
	color: #fe3434;
	transition: all 300ms;
}
.re-btn{
	border : none;
	cursor : pointer;
}

</style>
</head>
<body>


	<article>
		<div class="container">
			<h2 class = "text-center">Review</h2>
				<div class="mb-3 mt-4">
					<label for="title">제목</label>
					<input type="text" class="form-control" name="subject" id="subject" placeholder="<%=bean.getSubject()%>" readonly>
				</div>
				
			<div class="mb-3 d-flex menu">
               <div>
                  <label for="reg_num"><%=bean.getNum() %> /</label>
                  <label for="reg_id"><%=bean.getUid() %></label>
                  <input type="hidden" name="upass" value="<%=bean.getUpass() %>" />
                  <input type="hidden" name="resnum" value="<%=resnum%>" />
               </div>
               <div>
                  <label for="reg_wdate"><%=bean.getWdate() %> /</label>
                  <label for="reg_readcount"><%=bean.getReadCount() %></label>
               </div>
            </div>  		
            
				<div class="mb-3 mt-4 review">
					<label for="content">내용</label>
					<div class = "mb-3 mt-4 review-img">
					<img src = "../upload/<%=bean.getImg()%>" alt = "">
            	    <textarea class="form-control mt-3" rows="5" name="content" id="content" readonly><%=bean.getContent() %></textarea>
            	    </div>
				</div>
					
							
			<div class ="choi-qna">
					<input type = "hidden" name = "level" id="level" />
					<input type = "hidden" name = "img" id="img" />
					<input type = "hidden" name = "readcount" id="readcount" />
					<input type = "hidden" name = "replycount" id="replycount"/>
					<input type = "hidden" name = "like" id="like" />
				<button type="button" class="btn btn-sm choi-qna-btn" onclick="location.href='reviewUpdate.jsp?num=<%=bean.getNum() %>'">수정</button>
				<button type="button" class="btn btn-sm choi-qna-btn" onclick="location.href='reviewDelete.jsp?num=<%=bean.getNum() %>'">삭제</button>
				<%
				if(level == 99){
				%>
				<a class="btn btn-sm choi-qna-btn" id="btnList" onclick="return confirm('관리자 권한으로 삭제하시겠습니까?')" href="adminDelete.jsp?num=<%=bean.getNum() %>">관리자 권한으로 삭제</a>
				<%
				}
				%>
				<%
					if(lresult){
				%>
				<form action="LikeCancel.jsp?num=<%= bean.getNum()%>" method="post">
				<input type="hidden" name="subject" value="<%=bean.getSubject() %>" />
				<input type="hidden" name="num" value="<%=bean.getNum() %>" />
				<button type="submit" class="mj-btn"><span class="heart-emo"><i class="fa-solid fa-heart fa-xl"></i></span></button>
				</form>
				<%
					}else{
				%>
				<form action="LikeAction.jsp?num=<%= bean.getNum()%>" method="post">
				<input type="hidden" name="subject" value="<%=bean.getSubject() %>" />
				<input type="hidden" name="num" value="<%=bean.getNum() %>" />
				<button type="submit" class="mj-btn"><span class="heart-emo"><i class="fa-regular fa-heart fa-xl"></i></span></button>
				</form>
			</div>
			<%
					}
			%>
			

<!-- comment -->
		
<div class="card mb-2">
	<div class="card-header bg-light">
	        <i class="fa fa-comment fa"></i> COMMENT
	</div>
	<form method = "post" action = "reviewCommentProc.jsp" name = "form" id = "form">
	<input type ="hidden" name = "ref" value=<%=bean.getNum() %>>
	<div class="card-body">
		<ul class="list-group list-group-flush">
		    <li class="list-group-item">
<%-- 			<div class="form-inline mb-2">
				<input type="text" class="form-control ml-2" placeholder="<%=bean.getUid() %>" id="uid" readonly />
			</div>
 --%>
			<textarea class="form-control" name="replyContent" rows="3" placeholder = "댓글을 입력해주세요"></textarea>
		
		<%
			if(uid==null){
		%>
			<div class ="choi-qna">
				<button type="submit" class="btn btn-sm choi-qna-btn mt-2" ></button>
				<a onclick = "return confirm('로그인 후 이용하실 수 있습니다.')" href="../user/login.jsp">등록</a>
		    </div>
		<% }else{ %>
			<div class ="choi-qna">
				<button type="submit" class="btn btn-sm choi-qna-btn mt-2" id="btnSave" value="등록" >등록</button>
		    </div>
		<% } %>
		    </li>
		</ul>
	</div>
  </form>
  </div>
  
	<table class="table table-striped"
		style="text-align: center; border: 1px solid #dddddd;">
	<thead>
			<tr>
				<th colspan="3" style="background-color: #eeeeeee; text-align: center;">댓글</th>
			</tr>
			<thead>
						
			<%
				
				ArrayList<RCommentBean> list = dao.getList(bean.getNum());
				for(int i = 0; i<list.size(); i++){
				
			%>
				
		</thead>
		
		
			<tbody>
				<tr>
					<td style="text-align: left;"><%=list.get(i).getUid() %></td>  
					<td style = "text-align : center;"><%= list.get(i).getReplyContent() %></td>
					<td style = "text-align: right;"><%=list.get(i).getWdate().substring(0,11) %>
				
				 <%
				 	if(level == 99){
				 %>
					<%-- <a href = "#" type="button" class="re-btn" id="re-review<%= i %>">대댓글</a> --%>
					<a onclick = "return confirm('정말로 삭제하시겠습니까?')" href="reviewCommentDelete.jsp?num=<%=bean.getNum()%>&bbsId=<%=list.get(i).getBbsId() %>" class="btn-del">삭제</a>
					</td>
				<% } %>
				</tr>
				
			</tbody>
			 <% } %>	
 </table >
		   
			
</div>	
</article>
<jsp:include page="../include/footer.jsp" />
</body>
</html>