<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 선택</title>
<link rel="stylesheet" href="../css/imgSelect.css">
</head>
<body>
	<form action="imgSelectProc.jsp" class="imgSelectForm-select">
		<div class="imgForm-select">
			<div class="imgBox-select">
				<img alt="avt01" src="../img/avt01.jpg" class="img-select" >
				<input type="radio" name="img" value="avt01.jpg">
			</div>
			<div class="imgBox-select">
				<img alt="avt02" src="../img/avt02.jpg" class="img-select" >
				<input type="radio" name="img" value="avt02.jpg">
			</div>
			<div class="imgBox-select">
				<img alt="avt03" src="../img/avt03.jpg" class="img-select" >
				<input type="radio" name="img" value="avt03.jpg">
			</div>
			<div class="imgBox-select">
				<img alt="avt04" src="../img/avt04.jpg" class="img-select" >
				<input type="radio" name="img" value="avt04.jpg">
			</div>
			<div class="imgBox-select">
				<img alt="avt05" src="../img/avt05.jpg" class="img-select" >
				<input type="radio" name="img" value="avt05.jpg">
			</div>
		</div>
		<div>
			<input for="img" type="submit" value="이미지 초기화" class="cancleBtn-select">
			<input type="hidden" name="img" value="default.png">
		</div>
		<input type="submit" value="이미지 변경" class="submitBtn-select">
	</form>
</body>
</html>