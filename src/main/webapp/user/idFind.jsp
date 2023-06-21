<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" href="../css/idfind.css">
</head>
<body>
	<form name="idfindscreen" method="post">

		<h3 id="idfind_h3_jeon">아이디 찾기</h3>
		<div>
			<label id="idfind_label_jeon">이름</label>
			<input type="text" name="uname" placeholder="이름을 입력해주세요" id="idfind_input_jeon">
		</div>
		<div>
			<label id="idfind_label_jeon">휴대폰 번호</label>
			<input type="text" name="tel" placeholder="휴대폰 번호를 입력해주세요" id="idfind_input_jeon">
		</div>
		<div class="center_jeon">
			<input type="button" id="idfind_button_jeon" value="찾기" onClick="id_search();">
			<input type="button" id="idfind_button_jeon" value="취소" onClick="self.close();">
		</div>
	</form>
	<script src="../js/idfind.js"></script>
</body>
</html>