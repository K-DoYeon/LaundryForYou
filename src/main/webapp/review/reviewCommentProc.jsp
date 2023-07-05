<%@page import="javax.xml.stream.events.Comment"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "review.ReviewBean, review.ReviewDAO, review.RCommentBean" %>
<%@ page import = "java.io.*, java.util.*" %>

<%
    request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<jsp:useBean id = "bean" class = "review.RCommentBean" scope = "page" />
<jsp:setProperty property="*" name="bean"/>
<head>
<meta charset="UTF-8">

</head>
<body>
<%
	
	ReviewDAO dao = new ReviewDAO();
	String uid = (String)session.getAttribute("uid");
	 
	   if(bean.getReplyContent() == null){
	      PrintWriter script = response.getWriter();
	      script.println("<script>");
	        script.println("alert('댓글을 입력해주세요.')");
	        script.println("history.back()");
	        script.println("</script>");
	   }else{
	     bean.setRef(Integer.parseInt(request.getParameter("ref")));
	      int rs = dao.write(bean.getReplyContent(), uid, bean.getRef()); 
	      if(rs == -1){
	         PrintWriter script = response.getWriter();
	         script.println("<script>");
	            script.println("alert('댓글 쓰기에 실패했습니다.')");
	            script.println("history.back()");
	            script.println("</script>");
	      }else{
	         PrintWriter script = response.getWriter();
	         script.println("<script>");
	         script.println("location.href=document.referrer;");
	         script.println("</script>");
	      }
	   }

%>
</body>
</html>