<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="reservation.ReservationDAO"%>
<%@page import="reservation.ReservationBean"%>

<jsp:include page="../include/header.jsp"></jsp:include>

<jsp:useBean id="bean" class="reservation.ReservationBean" scope="page" />
<jsp:useBean id="rdao" class="reservation.ReservationDAO" scope="page" />

<%
    String reservationNum = request.getParameter("num");
    ReservationDAO rdaoo = new ReservationDAO();
    ReservationBean rbean = rdaoo.getReservationByNum(reservationNum);

    // Display the reservation details
    // Replace the following placeholders with appropriate values from rbean
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
%>

<h1>Reservation Details</h1>
<p>Reservation Number: <%=reservationNum %></p>
<p>User ID: <%=uid %></p>
<p>Telephone: <%=tel %></p>
<p>Address: [<%=postcode %>] <%=addr %> <%=detailaddr %></p>
<p>Daily Laundry: <%=daily %> items</p>
<p>Blanket Laundry: <%=blanket %> items</p>
<p>Shirt Laundry: <%=shirt %> items</p>
<p>Dry Cleaning: <%=dry %> items</p>
<p>Individual Laundry: <%=care %> items</p>
<p>Total Price: <%=totalprice %> won</p>

<jsp:include page="../include/footer.jsp"></jsp:include>