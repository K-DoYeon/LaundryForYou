<%@page import="java.util.Vector"%>
<%@page import="reservation.ReservationBean"%>
<%@page import="reservation.ReservationDAO"%>
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<body>

<jsp:useBean id="bean" class="reservation.ReservationBean">
	<jsp:setProperty name="bean" property="*" />
</jsp:useBean>

<%
	
	ReservationBean rbean = new ReservationBean();
	ReservationDAO rdao = new ReservationDAO(); 
	
	int mynum = rdao.insert(bean);
	
	
	String uid = (String) session.getAttribute("uid");
	
	int totalprice = rdao.Total(uid, mynum);
	session.setAttribute("totalprice", totalprice);

	
	response.sendRedirect("../reservation/MyReservation.jsp");
%>
</body>
</html>