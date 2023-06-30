<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	UserDAO udao = new UserDAO();
	String upass = request.getParameter("upass");
	String newpass = request.getParameter("newpass");
	String uid = (String)session.getAttribute("uid");
	
	if(udao.login(uid, upass) == 1) {
		
		boolean flag = udao.changePass(uid, newpass);
		if(flag) {
			session.setAttribute("upass", newpass);
%>
	<script>
		alert("비밀번호가 정상적으로 변경되었습니다.");
		document.location.href="myPage.jsp";
	</script>
<%
		}else {
%>
		<script>
			alert("비밀번호 변경에 실패했습니다.");
			history.back();
		</script>
<%		
		}
	}else {
%>
	<script>
		alert("기존 비밀번호를 다시 확인해주세요.");
		history.back();
	</script>
<%		
	}
%>