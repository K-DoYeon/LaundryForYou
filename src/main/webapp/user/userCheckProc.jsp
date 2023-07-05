<%@page import="java.io.PrintWriter"%>
<%@page import="user.UserBean"%>
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<body>
	<%
		UserDAO udao = new UserDAO();
		UserBean ubean = new UserBean();
		
		ubean.setUid((String) request.getParameter("uid"));
		ubean.setUpass((String) request.getParameter("upass"));
		
		int result = udao.login(ubean.getUid(), ubean.getUpass());
		
		
		if(result == 1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("opener.location.href='userInfo.jsp'");
			script.println("window.close()");
			script.println("</script>");
		}
		else if(result == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호를 확인해주세요')");
			script.println("history.back()");
			script.println("</script>");
		}
		else if(result == -2){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>
</body>
</html>