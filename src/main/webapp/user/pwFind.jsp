<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="../css/idfind.css">
</head>
<body>
	<form name="pwfindscreen" method="post">

		<h3 id="idfind_h3_jeon">비밀번호 찾기</h3>
		<div>
			<label id="idfind_label_jeon">아이디</label>
			<input type="text" name="uid" placeholder="아이디를 입력해주세요" id="idfind_input_jeon">
		</div>
		<div>
			<label id="idfind_label_jeon">휴대폰 번호</label>
			<input type="text" name="tel" placeholder="휴대폰 번호를 입력해주세요" id="idfind_input_jeon">
		</div>
		<div class="center_jeon">
			<input type="button" id="idfind_button_jeon" value="찾기" onClick="pw_search();">
			<input type="button" id="idfind_button_jeon" value="취소" onClick="self.close();">
		</div>
	</form>
	<script src="../js/idfind.js"></script>
</body>
</html>