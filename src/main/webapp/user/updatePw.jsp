<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="user.UserBean"%>
<jsp:include page="../include/header.jsp"></jsp:include>
<link rel="stylesheet" href="../css/updatePw.css">

<div class="container-upPw">
		<h1 class="title-upPw">비밀번호 변경</h1>
		<form action="updatePwProc.jsp" method="post" name="updatePwForm">
			<div class="Box-upPw">
				<label class="Title-upPw">현재 비밀번호</label>
				<input type="password" id="upass" name="upass" maxlength="16" placeholder="현재 비밀번호를 입력해주세요" required />
			</div>
			<div class="Box-upPw">
				<label class="Title-upPw">비밀번호 변경</label>
				<input type="password" id="newpass" name="newpass" maxlength="16" placeholder="변경될 비밀번호를 입력해주세요" required />
			</div>
			<div class="Box-upPw border-none-pw">
				<label class="Title-upPw">비밀번호 확인</label>
				<input type="password" id="newpasscheck" name="newpasscheck" maxlength="16" placeholder="변경될 비밀번호를 한번 더 입력해주세요" required />
			</div>
			
			<div class="submitBtnBox-upPw">
				<input type="submit" class="submitBtn-upPw" onsubmit='return updatePwProc()' value="변경하기" />
			</div>
		</form>
		<div class="cancleBox-upPw">
			<a href="myPage.jsp" class="cancle-upPw">취소</a>
		</div>
	</div>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="../js/updatePw.js"></script>
</body>
</html>