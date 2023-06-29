<%@page import="reservation.ReservationDAO"%>
<%@page import="reservation.PaymentBean"%>
<%@page import="reservation.PaymentDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<body>
<jsp:useBean id="bean" class="reservation.PaymentBean">
	<jsp:setProperty name="bean" property="*" />
</jsp:useBean>

<%	
	int num = (int) session.getAttribute("num");	

	ReservationDAO rdao = new ReservationDAO();
	int rs = rdao.Newupdate(num);
	
	response.sendRedirect("../reservation/MyReservation.jsp");
%>
</body>
</html>