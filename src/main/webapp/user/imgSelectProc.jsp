<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="user.UserBean"%>
<%@page import="user.UserDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<body>
	<%
	UserDAO udao = new UserDAO();
	String img = request.getParameter("img");
	String uid = (String)session.getAttribute("uid");
	String upass = (String)session.getAttribute("upass");
	
	if(img != null) {
		
		boolean flag = udao.updateImg(uid, img);
		if(flag) {
			session.setAttribute("img", img);
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("opener.location.href='userInfo.jsp'");
			script.println("window.close()");
			script.println("</script>");
		}else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생했습니다.')");
			script.println("location.href='imgSelect.jsp'");
			script.println("</script>");
		}
	} else {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미지를 선택해주세요')");
		script.println("location.href='imgSelect.jsp'");
		script.println("</script>");
	}
%>

</body>
</html>