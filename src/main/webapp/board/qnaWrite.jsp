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
<!-- <script>
	$(document).on('click', '#btnSave', function(e){
		e.preventDefault();	
		$("#form").submit();
	});


</script> -->
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
.gnb-header, .welcome-header{
	margin: 0;
}
.text-center{
	font-size: 45px;
	padding-bottom: 20px;
}
article{
	margin: 50px 0px;
}
.choi-body {
 /*  padding-top: 70px; */
  padding-bottom: 30px;
  font-family: 'SUITE-Regular' ;
}
body {
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
}
.choi-qna-btn:hover{
	background-color : #3E83A8;
	color : #fff;
	font-family:  'SUITE-Regular';	
}
.justify{
	justify-content : space-between;

}
</style>
</head>
<body class = "choi-body">
<jsp:include page="../include/header.jsp"></jsp:include>

	<article>
		<div class="container">
			<h2 class = "text-center">QnA</h2>
			<form action="qnaWriteProc.jsp" id = "form" name = "form" method="post" accept-charset="UTF-8">
				<div class="mb-3 mt-4">
					<label for="title">제목</label>
					<input type="text" class="form-control" name="subject" id="subject" placeholder="제목을 입력해 주세요">
				</div>
				<div class="mb-3 d-flex justify">
					<div>
						<label for="uid">작성자</label>
						<input type="text" class="form-control" name="uid" id="uid" placeholder="아이디를 입력하세요" />
					</div>
					<div>
						<label for="upass">비밀번호</label>
						<input type="passowrd" class="form-control" name="upass" id="upass" placeholder="비밀번호를 입력하세요"  />
					</div>
				
				</div>			
				<div class="mb-3">
					<label for="content">내용</label>
					<textarea class="form-control" rows="5" name="content" id="content" placeholder="내용을 입력해 주세요"  ></textarea>
				</div>
				<!--1. int 값들과 level input type hidden으로 해서 넣기 
				2. pass 넣기 -->
											
			<div class ="choi-qna">
					<input type = "hidden" name = "level" id="level" />
					<input type = "hidden" name = "readcount" id="readcount" />
					<input type = "hidden" name = "replycount" id="replycount"/>
					<input type = "hidden" name = "like" id="like" />
				<button type="submit" class="btn btn-sm choi-qna-btn" id="btnSave" value ="submit">저장</button>
				<button type="button" class="btn btn-sm choi-qna-btn" id="btnList"><a href = "boardlist.jsp">목록</a></button>
			</div>
			</form>	
		</div>
	</article>
</body>
</html>
<jsp:include page="../include/footer.jsp"></jsp:include>