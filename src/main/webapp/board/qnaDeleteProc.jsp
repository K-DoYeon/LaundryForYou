<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.BoardDAO, board.BoardBean, java.io.*"%>
<jsp:useBean id="comment" class="board.CommentBean" scope="page"/>
<jsp:setProperty name="comment" property="content"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="bean" class= "board.BoardBean">
	<jsp:setProperty name = "bean" property = "*" />
</jsp:useBean>

<%
	int num = Integer.parseInt(request.getParameter("num"));
	String upass = request.getParameter("upass");
	
	BoardDAO dao = new BoardDAO();
	int result = dao.deleteBoard(num, upass);
	
	if(result == 1){
%>
<script type = "text/javascript">
		alert("게시글 삭제가 완료되었습니다.");
		location.href = 'boardlist.jsp';
</script>	
<% }else if(result ==0){ %>
<script type = "text/javascript">
		alert("비밀번호오류푱푱푱.");
		history.back();
</script>	
<%}else{ %>
<script type = "text/javascript">
		alert("게시글이 업슴요.");
		history.back();
</script>	
<% } %>

</body>
</html>