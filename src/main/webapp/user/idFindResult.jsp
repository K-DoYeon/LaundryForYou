<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="../css/idfind.css">
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String uname = request.getParameter("uname");
		String tel = request.getParameter("tel");
		
		UserDAO userDAO = new UserDAO();
		String uid = userDAO.idFind(uname, tel);
	%>

	<form name="idsearch" method="post">
		
		<%
			if(uid != null){
		%>
		
		<div>
			<h3 id="idfind_h3_jeon">아이디 찾기 결과</h3>
			<p id="idfindresult_p_jeon">회원님의 아이디는 &nbsp;<span><%=uid%></span>&nbsp; 입니다.</p>
		</div>
		
		<div class="center_jeon">
			<input type="button" class="idfindresult_button_jeon apply_jeon" value="사용하기" onClick="uidapply('<%=uid%>');">
		</div>
		
		<hr>
		
		<div class="center_jeon">
			<input type="button" id="back" class="idfindresult_button_jeon" value="다시 찾기" onClick="history.back();">
			<input type="button" id="login" class="idfindresult_button_jeon" value="로그인" onClick="self.close();"/>
		</div>
		
		<%
			}else{
		%>
	
		<div>
			<h3 id="idfind_h3_jeon">아이디 찾기 결과</h3>
			<p id="idfindresult_p_jeon" class="mt50_jeon">등록된 정보가 없습니다.</p>
			<hr>
			<div class="center_jeon">
				<input type="button" id="back" class="idfindresult_button_jeon" value="다시 찾기" onClick="history.back();">
				<input type="button" id="join" class="idfindresult_button_jeon" value="회원가입" onClick="join();/">
			</div>
		</div>
		
		<%
			}
		%>
	</form>
	
	<script src="../js/idfind.js"></script>
</body>
</html>