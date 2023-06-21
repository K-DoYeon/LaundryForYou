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
		Cookie[] cookies = request.getCookies();
		String loginStatus = null;
		String rememberId = null;
		String uid = null;
		
		if(cookies != null && cookies.length>0){
			for(int i=0; i<cookies.length; i++){
				if(cookies[i].getName().equals("loginStatus")){
					loginStatus=cookies[i].getValue();
					cookies[i].setMaxAge(10000);
					response.addCookie(cookies[i]);
					}
				if(cookies[i].getName().equals("rememberId")){
					rememberId = cookies[i].getValue();	
					}
				if(cookies[i].getName().equals("uid")){
					uid=cookies[i].getValue();	
					}
				}
			}
	%>
	
	<h3>[<%=uid %>]님 정상적으로 로그아웃 되었습니다.</h3>

	<%
		if(rememberId != null && rememberId.equals("temp")){
			if(cookies!=null && cookies.length>0){
				for(int i=0; i<cookies.length; i++){
					if(cookies[i].getName().equals("uid")){
						cookies[i].setMaxAge(0);
						response.addCookie(cookies[i]);
					}
				}
			}
		}
	%>
	<form action="CookieSessionLogin.jsp" method="post">
		<input type="submit" value="로그인 페이지로 이동">
	</form>
</body>
</html>