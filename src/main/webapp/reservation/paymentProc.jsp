<%@page import="reservation.PaymentDAO"%>
<%@page import="reservation.PaymentBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="pay" class="reservation.PaymentBean" scope="page" />
<jsp:setProperty name="pay" property="*" /> 
<%-- <% 
	PaymentBean pbean = new PaymentBean();
	int num = Integer.parseInt(request.getParameter("num"));
	int daily = Integer.parseInt(request.getParameter("daily"));
	int blanket = Integer.parseInt(request.getParameter("blanket"));
	int shirt = Integer.parseInt(request.getParameter("shirt"));
	int dry = Integer.parseInt(request.getParameter("dry"));
	int care = Integer.parseInt(request.getParameter("care"));
	int totalprice = Integer.parseInt(request.getParameter("totalprice"));
	
	pbean.setNum(num);
	pbean.setDaily(daily);
	pbean.setBlanket(blanket);
	pbean.setShirt(shirt);
	pbean.setDry(dry);
	pbean.setCare(care);
	pbean.setTotalprice(totalprice);
	%> --%>
<html>
<body>

<% 
	
    PaymentDAO pdao = new PaymentDAO();
    pdao.insert(pay);
	
    int totalprice = pdao.Total(pay.getNum());
    session.setAttribute("totalprice", totalprice);
    response.sendRedirect("payment.jsp");
%>

</body>
</html>