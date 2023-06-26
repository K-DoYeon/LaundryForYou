<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="review.ReviewBean, review.ReviewDAO, java.io.*"  %>
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
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script>
	$(document).on('click', '#btnSave', function(e){
		e.preventDefault();	
		$("#form").submit();
	});

	

</script>
<!-- Bootstrap CSS -->
<link rel="stylesheet" 
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" 
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" 
	crossorigin="anonymous" />


<title>후기 삭제</title>
<%
	int num = Integer.parseInt(request.getParameter("num").trim());

	ReviewDAO dao = new ReviewDAO();
	ReviewBean bean = dao.getOneReview(num);
%>
<%
	
	String subject = bean.getSubject();
	String uid = bean.getUid();
	String upass = (String) request.getParameter("upass");
	
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
body {
  padding-top: 70px;
  padding-bottom: 30px;
  font-family:  'SUITE-Regular';
}
.container{
	margin-top : 50px;
}
button a{
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
.review textarea{
	resize : none;
}
.review-img img{
	width : 100%;
	height : auto;
	margin : 0 auto;
	padding : 0 auto;
}
input:read-only {
    background-color: #fff;
}
</style>
</head>
<body>
<jsp:include page="../include/header.jsp"></jsp:include>

<article>
		<div class="container">
		<form action="reviewDeleteProc.jsp?num=<%=bean.getNum() %>" method="post" id="form">
			<h2 class = "text-center">후기 삭제</h2>
				<div class="mb-3 mt-4">
					<label for="title">제목</label>
					<input type="text" class="form-control" name="subject" id="subject" placeholder="<%=bean.getSubject()%>" readonly>
				</div>
				
			<div class="mb-3 d-flex justify">
					<div>
						<label for="uid">작성자</label>
						<input type="text" class="form-control" name="uid" id="uid" value="<%=uid %>" readonly />
					</div>
					<div>
						<label for="upass">비밀번호</label>
						<input type="password" class="form-control" name="upass" id="upass"  />
						
					</div>
				
				</div>	 		
            
				<div class="mb-3 mt-4 review">
					<label for="content">내용</label>
					<div class = "mb-3 mt-4 review-img">
					<img src = "../imgs/<%=bean.getImg() %>" alt = "">
            	    <textarea class="form-control mt-3" rows="5" name="content" id="content" readonly><%=bean.getContent() %></textarea>
            	    </div>
				</div>
				<button type="submit" class="btn btn-sm choi-qna-btn" id="btnList" onclick="location.href='reviewDeleteProc.jsp?num=<%=bean.getNum() %>'">삭제</button>
				</form>
			</div>
		</article>
</body>
</html>