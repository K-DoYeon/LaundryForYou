<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복확인</title>
<link rel="stylesheet" href="../css/idcheck.css">
</head>
<body>
	<div id="idcheck_div_jeon">
		<h3 id="idcheck_h3_jeon">아이디 중복확인</h3>
		<form method="post" action="idCheckPro.jsp" onsubmit="return blankCheck(this)">
			<p class="idcheck_p_jeon">아이디는 영문(소문자), 숫자로 4~16자 이내로 입력해주세요.<p> 
			<input type="text" name="uid" placeholder="아이디를 입력해주세요." autofocus id="idcheck_input_jeon">
			<input type="submit" value="중복확인" id="idcheck_button_jeon">
			<p class="idcheck_p_jeon">공백 또는 특수문자가 포함된 아이디는 사용할 수 없습니다.<p> 
			<p class="idcheck_p_jeon">숫자로 시작하거나, 숫자로만 이루어진 아이디는 사용할 수 없습니다.<p> 
		</form>
	</div>
	
<script src="../js/idcheck.js"></script>
</body>
</html>