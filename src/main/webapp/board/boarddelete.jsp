<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
body{
	font-family: 'IM_Hyemin-Bold','TheJamsil5Bold';
}
.do-container{
	text-align: center;
}
.do-title{
	padding: 50px 0 30px;
	font-family: 'TheJamsil5Bold';
	border-bottom: 1px solid #3E83A8;
	background: #f5f6f8;
}
.do-form{
	margin-top: 30px;
}
.del label{
	margin-right: 10px;
}
.del input{
	border-radius: 5px;
}
.do-del{
	margin-top: 50px;
}
.do-del button{
	display: inline-block;
	padding: 10px 20px;
	border: none;
	background: #58A3BC;
	color: #fff;
	cursor: pointer;
	transition: all 0.2s;
	border-radius: 10px;
	font-family: 'IMHyemin';
	margin: 0 5px;
}
.do-del button:hover{
	background: #3E83A8;
}
</style>
</head>
<body>

	<div class="do-container">
		<h2 class="do-title">게시글 삭제</h2>
		<form class="do-form" name="del" action="" method="post">
			<div class="del">
                <label class="form-label-rgi"> 비밀번호 :</label>
                <input type="text" id="upass" name="upass" size="35" style="text-align:center; width:200px; height:20px;" placeholder="비밀번호를 입력해주세요." />
            </div>
			<div class="do-del">
				<button type="submit">확인</button>
				<button onclick="windowClose();">취소</button>
			</div>
		</form> 
	</div>
<script src="../js/boardlist.js"></script>
</body>
</html>