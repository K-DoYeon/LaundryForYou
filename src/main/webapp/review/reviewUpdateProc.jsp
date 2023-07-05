<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="review.ReviewBean, review.ReviewDAO, java.io.*"  %>
<%
request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<body>
<jsp:useBean id="bean" class ="review.ReviewBean">
	<jsp:setProperty name = "bean" property ="*" />
</jsp:useBean>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String upass = request.getParameter("upass");
	
	ReviewDAO rdao = new ReviewDAO();
	int result = rdao.reviewUpdate(bean);
	if(result == 1){
		%>
		<script type = "text/javascript">
		alert("게시글 수정이 완료되었습니다.");
		location.href = 'review.jsp';
		</script>
		<% }else if(result == 0){ %>
		<script type = "text/javascript">
				alert("비밀번호가 틀렸습니다. 다시 확인해주세요!");
				history.go(-1);
		</script>	
		<% }else{ %>	
		<script type = "text/javascript">
				alert("다시 시도해주세요.");
				history.go(-1);
		</script>	
		<% } %>
</body>
</html>