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

bean.setNum(Integer.parseInt(request.getParameter("num")));

int orderNum = rdao.ConditionUpdate(bean.getNum());

response.sendRedirect("../reservation/MyReservation.jsp");
	
	
	

%>
</body>
</html>