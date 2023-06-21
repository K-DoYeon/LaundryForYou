<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String rememberId = request.getParameter("rememberId");
		String uid = request.getParameter("uid");
		Cookie cookieRememberId;
		Cookie cookieId;
		Cookie cookieLoginStatus;
		
		if(rememberId != null && rememberId.equals("keep")){
			cookieRememberId = new Cookie("rememberId","keep");
		}else{
			cookieRememberId = new Cookie("rememberId", "temp");
		}
		cookieId = new Cookie("uid", uid);
		cookieLoginStatus = new Cookie ("loginStatus","login");
		
		response.addCookie(cookieRememberId);
		response.addCookie(cookieId);
		response.addCookie(cookieLoginStatus);
		
		out.println(cookieRememberId.getValue());
		response.sendRedirect("CookieSessionChk.jsp");
	%>

</body>
</html>