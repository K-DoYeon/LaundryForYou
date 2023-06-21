<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@page import="user.UserDAO"%>
<%@page import="user.UserBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/remixicon@2.2.0/fonts/remixicon.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/gh/sunn-us/SUITE/fonts/variable/woff2/SUITE-Variable.css" rel="stylesheet">
<link rel="stylesheet" href="../css/header.css">

<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet" href="../css/footer.css">
</head>
<body>
	<%
	UserBean ubean = new UserBean();
	String uid = (String) session.getAttribute("uid");
	String img = (String) session.getAttribute("img");
	Integer level = (Integer) session.getAttribute("level");
	%>
	<header>
		<div class="container-header">
				<a href="../main/main.jsp"> 
				<!-- <img src="../img/logo.png" alt="logo"> -->
				<span class="logo-l">세탁의</span>&nbsp;<span class="logo-r">당신</span>
				</a>

				<ul class="gnb-header">
					<li><a href="../reservation/reservation.jsp">예약</a></li>
					<li><a href="../board/boardlist.jsp">문의게시판</a></li>
					<li><a href="../review/review.jsp">후기게시판</a></li>
					<li><a href="../main/service.jsp">서비스안내</a></li>
					<li><a href="../main/BlackLaundry.jsp">명품관</a></li>
				</ul>

				<%
				if (uid == null) {
				%>
				<div class="member">

					<a href="../user/login.jsp">Login <i class="ri-login-box-line"></i></a>
					<a href="../user/register.jsp">Join <i class="ri-user-add-line"></i></a>

				</div>
				<%
				} else {
				%>
				
					<div class="welcome-header">
					<%
						if(level == 99){
					%>
						<a class="user-header" href="#">
							<img class="userImg-header" src="../img/<%=img %>">
							<span><%=uid%></span>
						</a>
						<a class="user-admin" href="../user/memberList.jsp">
							회원관리
						</a>
					<%
						} else {
					%>
						<a class="user-header" href="../user/myPage.jsp">
							<img class="userImg-header" src="../img/<%=img %>">
							<span><%=uid%></span>
						</a>
						
					<%
						}
					%>
						
						<a href="../user/logout.jsp">Logout <i class="ri-login-box-line"></i></a>
					</div>
				
				<%
				}
				%>


		</div>
	</header>