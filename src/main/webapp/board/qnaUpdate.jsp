<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.BoardDAO, board.BoardBean, java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet" 
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" 
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" 
	crossorigin="anonymous" />

<title>Q&A Update</title>
<script>
	$(document).on('click', '#btnSave', function(e){
		e.preventDefault();	
		$("#form").submit();
	});

</script>
<style>
@font-face {
    font-family: 'IM_Hyemin-Bold';
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
.choi-body {
  padding-top: 70px;
  padding-bottom: 30px;
  font-family: 'SUITE-Regular' ;
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
<jsp:include page="../include/header.jsp"></jsp:include>
<body>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	
	BoardDAO dao = new BoardDAO();
	BoardBean bean = dao.getOneBoard(num);
	
%>
<article>
<form action ="qnaUpdateProc.jsp" id = "form" method = "post">
		<div class="container" role="main">
			<h2 class = "text-center">QnA</h2>
				<div class="mb-3 mt-4 subject">
					<label for="title">제목</label>
					<input type="text" class="form-control" name="subject" id="subject" placeholder="<%=bean.getSubject() %>" readonly>
				</div>
				<div class="mb-3 d-flex menu">
					<div>
						<label for="reg_id"><%=bean.getNum() %> /</label>
						<label for="reg_id"><%=bean.getUid() %></label>
					</div>
					<div>
						<label for="reg_id"><%=bean.getWdate() %> /</label>
						<label for="reg_id"><%=bean.getReadcount()%></label>
					</div>
				</div>	
				<div class="mb-3 mt-4">
				<label for="title">비밀번호</label>
					<input type="password" class="form-control" name="upass" id="upass" placeholder="비밀번호를 입력하세요" >
				</div>				
				<div class="mb-3">
					<label for="content">내용</label>
					<textarea class="form-control" rows="5" name="content" id="content" ><%=bean.getContent() %></textarea>
				</div>		
				
			<div class ="choi-qna">
			<input type="hidden" name="num" value="<%=bean.getNum() %>" />
				<button type="button" class="btn btn-sm choi-qna-btn" id="btnSave" value ="submit">수정</button>
				<button type="button" class="btn btn-sm choi-qna-btn" id="btnList" >삭제</button>
			</div>
	
</form>	
<script src="../js/boardlist.js"></script>
</body>
</html>