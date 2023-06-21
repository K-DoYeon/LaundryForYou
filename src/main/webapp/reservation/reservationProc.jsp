<%@page import="reservation.ReservationDAO"%>
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>

<jsp:useBean id="bean" class="reservation.ReservationBean">
	<jsp:setProperty name="bean" property="*" />
</jsp:useBean>

<%
	ReservationDAO rdao = new ReservationDAO();
	rdao.insert(bean);
	
	response.sendRedirect("../main/main.jsp");
%>
</body>
</html>