<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    request.setCharacterEncoding("UTF-8");
    %>
<!DOCTYPE html>
<html>
<body>

<jsp:useBean id="bean" class="user.UserBean">
	<jsp:setProperty name="bean" property="*" />
</jsp:useBean>

<%
  
	UserDAO udao = new UserDAO();
	udao.insert(bean);
	
	response.sendRedirect("login.jsp");
%>
</body>
</html>