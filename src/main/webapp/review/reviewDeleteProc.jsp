<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="review.ReviewBean, review.ReviewDAO, java.io.*"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<body>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String upass = request.getParameter("upass");
	
	ReviewDAO rdao = new ReviewDAO();
	int result = rdao.deleteReview(num, upass);
	if(result == 1){
		%>
		<script type = "text/javascript">
				alert("게시글 삭제가 완료되었습니다.");
				location.href = 'review.jsp';
		</script>	
		<% }else if(result ==0){ %>
			<script type = "text/javascript">
					alert("비밀번호를 다시 입력해주세요.");
					history.back();
			</script>	
			<%}else{ %>
			<script type = "text/javascript">
					alert("게시글이 없습니다. 다시 확인해주세요.");
					history.back();
			</script>	
		<% } %>

</body>
</html>