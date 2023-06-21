<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복확인</title>
<link rel="stylesheet" href="../css/idcheck.css">
</head>
<body>
	<div id="idcheckpro_div_jeon">
		<h3 id="idcheck_h3_jeon">아이디 중복확인 결과</h3>
	<%
	//사용 가능한 아이디일 경우, 아이디 입력 폼에 바로 적용 가능
	String uid = request.getParameter("uid");
	UserDAO userDAO = new UserDAO();
	int count = userDAO.duplicate(uid);
	out.println("<p class='idcheckpro_p_jeon'>입력하신 <span>"+ uid +"</span>는</p>");
	if(count == 0){
		out.println("<p class='idcheckpro_p_jeon'>사용 가능한 아이디입니다.</p>");
		out.println("<a href='javascript:apply(\"" + uid +"\")' class='idcheckpro_a_jeon apply_jeon'>사용하기</a>");
	%>
		<script>
			function apply(uid){
				//중복확인한 아이디를 회원가입창에 적용
				opener.document.registerFrom.uid.value=uid;
				window.close(); //창닫기
			}//apply function 종료
		</script>	
	<%
	}else{
		out.println("<p class='idcheckpro_p_jeon mb80_jeon'>중복된 아이디로 사용하실 수 없습니다.</p>");
	} //if문 종료
	%>	
	<hr>
	<a href="javascript:history.back()" class="idcheckpro_a_jeon">다시시도</a>
	&nbsp;&nbsp;&nbsp;
	<a href="javascript:window.close()" class="idcheckpro_a_jeon">창닫기</a>
	</div>
</body>
</html>