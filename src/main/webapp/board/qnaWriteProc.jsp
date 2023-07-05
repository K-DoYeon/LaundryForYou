<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ page import ="board.BoardDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<body>
<jsp:useBean id="bean" class = "board.BoardBean" />
<jsp:setProperty property="*" name="bean"/>
<%
	//데베쪽으로 빈 클래스 넘겨줌	
	BoardDAO dao = new BoardDAO();

	//데이터 저장 메소드 호출
	dao.insertBoard(bean);
	
	//저장 후 전체 게시글 보기
	response.sendRedirect("boardlist.jsp");
%>
</body>
</html>