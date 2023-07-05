<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세탁의 당신</title>
<link rel="icon" href="../img/bubble.png">
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
	<%session.invalidate(); %>
	
	<script>
		alert("로그아웃 되었습니다.");
		location.href='../main/main.jsp';
	</script>
</body>
</html>