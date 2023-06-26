<%@page import="reservation.PaymentDAO"%>
<%@page import="reservation.PaymentBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="pay" class="reservation.PaymentBean" scope="page" />
<jsp:setProperty name="pay" property="*" />
<html>
<body>

<% 
    PaymentDAO pdao = new PaymentDAO();
    pdao.insert(pay);

    response.sendRedirect("payment.jsp");
%>

</body>
</html>