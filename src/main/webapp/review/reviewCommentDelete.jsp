<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "review.ReviewBean, review.ReviewDAO, review.RCommentBean" %>
<%@ page import = "java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<jsp:useBean id="bean" class = "review.RCommentBean" scope = "page"/>
<jsp:setProperty property="*" name="bean"/>
<body>
<%

	ReviewDAO dao = new ReviewDAO();
	bean.setBbsId(Integer.parseInt(request.getParameter("bbsId")));
	
	int result = dao.commentDelete(bean.getBbsId());
	if(result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('댓글 삭제에 실패했습니다ㅠㅠ')");
		script.println("history.back();");
		script.println("</script>");
	}else{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href=document.referrer;");
		script.println("</script>");
	}
	
%>
</body>
</html>