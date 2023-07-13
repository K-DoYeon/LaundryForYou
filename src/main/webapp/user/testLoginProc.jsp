<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="user.UserDAO, reservation.ReservationBean, reservation.PaymentDAO"%>
<%@page import="user.UserBean"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<body>
	<%
		UserDAO udao = new UserDAO();
		UserBean ubean = new UserBean();
		
		
		String uid = "test";
		String testpw = udao.testpw();
		ubean.setUname((String) request.getParameter("uname"));
		ubean.setImg((String) request.getParameter("img"));
		
		int result = udao.login(uid, testpw);
		String img = udao.userImg(uid, testpw);
		int level = udao.userLevel(uid);
		int vip = udao.userVip(uid);
		String uname = udao.userName(uid);
		String uemail = udao.userEmail(uid);
		String tel = udao.userTel(uid);
		int postcode = udao.userPostcode(uid);
		String addr = udao.userAddr(uid);
		String detailaddr = udao.userDetailaddr(uid);
		String gender = udao.userGender(uid);
		int birth = udao.userBirth(uid);
		
		
		String rememberId = request.getParameter("rememberId");
		uid = "test";
		Cookie cookieRememberId;
		Cookie cookieId;
		Cookie cookieLoginStatus;
		
		if(rememberId != null && rememberId.equals("keep")){
			cookieRememberId = new Cookie("rememberId","keep");
		}else{
			cookieRememberId = new Cookie("rememberId", "temp");
		}
		cookieId = new Cookie("uid", uid);
		cookieLoginStatus = new Cookie ("loginStatus","login");
		
		response.addCookie(cookieRememberId);
		response.addCookie(cookieId);
		response.addCookie(cookieLoginStatus);
		
		out.println(cookieRememberId.getValue());
		
		
		
		if(result == 1){
			session.setAttribute("uid","test");//세션부여
			session.setAttribute("img", img);
			session.setAttribute("level", level);
			session.setAttribute("vip", vip);
			session.setAttribute("upass", testpw);
			session.setAttribute("uname", uname);
			session.setAttribute("uemail", uemail);
			session.setAttribute("tel", tel);
			session.setAttribute("postcode", postcode);
			session.setAttribute("addr", addr);
			session.setAttribute("detailaddr", detailaddr);
			session.setAttribute("gender", gender);
			session.setAttribute("birth", birth);
			
			PaymentDAO pdao = new PaymentDAO();
			int total = pdao.getTotalReservationPrice(uid);
			System.out.println(uid);
			if(total >= 500000 && vip == 0){
				udao.updateVIP(uid);
				
			}
			
			
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href='../main/main.jsp'");//로그인에 성공하면 main페이지로
			script.println("</script>");
		}
		else if(result == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('아이디 / 비밀번호를 확인해주세요')");
			script.println("history.back()");
			script.println("</script>");
		}
		else if(result == -2){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생했습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>
</body>
</html>