<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="../css/userCheck.css">
</head>
<body>
	<%
		String uid = (String) session.getAttribute("uid");
		UserDAO udao = new UserDAO();
	    String testpw = udao.testpw();
	%>
	
	<form name="userCheck" method="post" class="checkBox-userch" action="userCheckProc.jsp">
		<div class="checkTitleBox-userch">
			<h2 class="checkTitle-userch">본인확인</h2>
		</div>
		<div class="Box-userch">
			<label class="title-userch">아이디</label>
			<input type="text" name="uid" id="uid" value="<%= uid%>" readonly />
		</div>
		<%
			if(uid == "test"){
		%>
		<div class="Box-userch">
			<label class="title-userch">비밀번호</label>
			<input type="password" name="upass" value="<%= testpw %>" id="upass">
		</div>
		<%
			}else{
		%>
		<div class="Box-userch">
			<label class="title-userch">비밀번호</label>
			<input type="password" name="upass" placeholder="비밀번호를 입력해주세요" id="upass">
		</div>
		<%
			}
		%>
		<div class="userSearchBtn-userch">
			<input type="submit" class="userSearch-userch" value="확인">
		</div>
	</form>

</body>
</html>