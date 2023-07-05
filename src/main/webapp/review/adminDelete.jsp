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
	
	ReviewDAO rdao = new ReviewDAO();
	int aDelete = rdao.deleteReview(num);
		%>
		<%
		if(aDelete > 0){
		%>
		<script type = "text/javascript">
				alert("관리자 권한으로 게시글 삭제가 완료되었습니다.");
				location.href = 'review.jsp';
		</script>	
		<%
		}else{
		%>
		<script type = "text/javascript">
				alert("후기 삭제에 실패했습니다.");
				location.href = 'review.jsp';
		</script>	
		<%
		}
		%>
		
</body>
</html>