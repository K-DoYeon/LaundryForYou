<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@page import="board.BoardDAO, board.BoardBean, java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<body>

<jsp:useBean id="bean" class ="board.BoardBean">
	<jsp:setProperty name = "bean" property ="*" />
</jsp:useBean>
<%
	//데베연결
	BoardDAO dao = new BoardDAO();
	//정보 수정 메소드
	int result = dao.modifyBoard(bean);
	
	//수정완료일때
	if(result == 1){ 	
%>
<script type = "text/javascript">
		alert("게시글 수정이 완료되었습니다.");
		location.href = 'boardlist.jsp';
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