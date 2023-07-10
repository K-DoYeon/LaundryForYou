<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="board.BoardBean, board.BoardDAO" %>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
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
  font-family:  'SUITE-Regular';
}
.gnb-header, .welcome-header{
	margin: 0;
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
.choi-qna{
	text-align : right;
}
.choi-qna-btn{
	background-color : #58A3BC;
	color : #fff;
	font-family:  'SUITE-Regular';
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
</style>
</head>
<body>
<%
	String uid = (String)session.getAttribute("uid");
	String upass = (String)session.getAttribute("upass");
	int num = 0;
	if (request.getParameter("num") != null){
		num = Integer.parseInt(request.getParameter("num"));
	}
	int resnum = Integer.parseInt(request.getParameter("resnum").trim());
%>
<jsp:include page="../include/header.jsp"></jsp:include>

	<article>
		<div class="container">
			<h2 class = "text-center">Review</h2>
			<form action="reviewWriteProc.jsp" id = "form" name = "form" method="post" encType = "multipart/form-data"> 
				<input type="hidden" name="resnum" value="<%=resnum%>" />
				<div class="mb-3 mt-4">
					<label for="title">제목</label>
					<input type="text" class="form-control" name="subject" id="subject" placeholder="제목을 입력해 주세요">
				</div>
				<div class="mb-3 d-flex justify">
					<div>
						<label for="uid">작성자</label>
						<input type="text" class="form-control" name="uid" id="uid" value="<%=uid %>" readonly />
					</div>
					<div>
						<label for="upass">비밀번호</label>
						<input type="password" class="form-control" name="upass" id="upass" value="<%=upass %>" readonly  />
					</div>
				
				</div>			
				<div class="mb-3 mt-4 review">
					<label for="content">내용</label>
					<textarea class="form-control" rows="5" name="content" id="content" placeholder="100자 이내의 내용을 입력해 주세요" maxlength="100"  ></textarea>
					<input type = "file" name = "img" id = "img" class = "img mt-4"/>
				</div>
				<!--1. int 값들과 level input type hidden으로 해서 넣기 
				2. pass 넣기 -->
			</form>									
			<div class ="choi-qna">
					<input type = "hidden" name = "level" id="level" />
					<input type = "hidden" name = "readcount" id="readcount" />
					<input type = "hidden" name = "replycount" id="replycount"/>
					<input type = "hidden" name = "like" id="like" />
					<input type = "hidden" name = "resnum" id="resnum" />
				
				<button type="button" class="btn btn-sm choi-qna-btn" id="btnSave" value ="submit">저장</button>
				<button type="button" class="btn btn-sm choi-qna-btn" id="btnList"><a href = "review.jsp">목록</a></button>
			</div>
			
		</div>
	</article>
	<jsp:include page="../include/footer.jsp" />
</body>
</html>