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
	String uid = (String)session.getAttribute("uid");
	rdao.insert(bean);
	rdao.vipLevel(uid);
	
	response.sendRedirect("payment.jsp");
%>
</body>
</html>