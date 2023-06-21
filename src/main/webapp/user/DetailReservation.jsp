<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="reservation.ReservationDAO"%>
<%@page import="reservation.ReservationBean"%>

<!DOCTYPE html>
<html>
<head>
    <title>Reservation Details</title>
    <link rel="stylesheet" href="../css/DetailReservation.css" />
</head>
<body>
    <jsp:include page="../include/header.jsp"></jsp:include>

    <jsp:useBean id="bean" class="reservation.ReservationBean" scope="page" />
    <jsp:useBean id="rdao" class="reservation.ReservationDAO" scope="page" />

    <%
        String reservationNum = request.getParameter("num");
        ReservationDAO rdaoo = new ReservationDAO();
        ReservationBean rbean = rdaoo.getReservationByNum(reservationNum);


        String uid = rbean.getUid();
        String tel = rbean.getTel();
        int postcode = rbean.getPostcode();
        String addr = rbean.getAddr();
        String detailaddr = rbean.getDetailaddr();
        int daily = rbean.getDaily();
        int blanket = rbean.getBlanket();
        int shirt = rbean.getShirt();
        int dry = rbean.getDry();
        int care = rbean.getCare();
        int totalprice = rbean.getTotalprice();
        
        
        int dailyPrice = rbean.getDaily() * 900;
        int blanketPrice = rbean.getBlanket() * 10000;
        int shirtPrice = rbean.getShirt() * 2000;
        int dryPrice = rbean.getDry() * 5000;
        int carePrice = rbean.getCare() * 1500;
        
    %>

    <div class="container">
    <div class="title">
       <span class="logo-l">세탁의</span> 
       &nbsp;
       <span class="logo-r">당신</span>
     </div>
        
	        <p>예약번호: <%=reservationNum %></p>
	        <p><%=uid %></p>
        
        	<p><%=tel %></p>
	        <p>[<%=postcode %>] <%=addr %> <%=detailaddr %></p>
        <div class="bottom">
        <div class="row">
	        <p>생활빨래: <%=daily %> 개</p>
	        <p><%=dailyPrice %> 원</p> 
	     </div>
	     <div class="row">
	        <p>이불: <%=blanket %> 개</p>
	        <p><%=blanketPrice %> 원</p>
	     </div>
	     <div class="row">
	        <p>셔츠: <%=shirt %> 개</p>
	     	<p><%=shirtPrice %> 원</p>
	     </div>
	     <div class="row">
	        <p>드라이 클리닝: <%=dry %> 개</p>
	     	<p><%=dryPrice %> 원</p>
	     </div>
	     <div class="row">
	        <p>개별 클리닝: <%=care %> 개</p>
	     	<p><%=carePrice %> 원</p>
	     </div>
	     <div class="row lastRow">
	        <p>Total </p>
	     	<p><%=totalprice %> 원</p>
	     </div>
        </div>
        <button onclick="history.back()">확인</button>
    </div>

    <jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>
