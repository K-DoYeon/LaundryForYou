<%@page import="user.UserBean"%>
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
	UserDAO udao = new UserDAO();
	UserBean ubean = new UserBean();
	
	String uid = (String) session.getAttribute("uid");
	
	int mynum = rdao.insert(bean);
	rdao.vipLevel(uid);
	
	
	int totalprice = rdao.Total(uid, mynum);
	session.setAttribute("totalprice", totalprice);
	boolean flag = rdao.vipLevel(uid);
	if(flag) {
		session.setAttribute("vip", 1);
	}
	
	response.sendRedirect("MyReservation.jsp");

	
%>
</body>
</html>