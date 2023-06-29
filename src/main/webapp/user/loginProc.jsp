<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="user.UserDAO, reservation.ReservationBean, reservation.PaymentDAO"%>
<%@page import="user.UserBean"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		UserDAO udao = new UserDAO();
		UserBean ubean = new UserBean();
		
		
		ubean.setUid((String) request.getParameter("uid"));
		ubean.setUpass((String) request.getParameter("upass"));
		ubean.setUname((String) request.getParameter("uname"));
		ubean.setImg((String) request.getParameter("img"));
		
		int result = udao.login(ubean.getUid(), ubean.getUpass());
		String img = udao.userImg(ubean.getUid(), ubean.getUpass());
		int level = udao.userLevel(ubean.getUid());
		int vip = udao.userVip(ubean.getUid());
		String upass = udao.userPass(ubean.getUid());
		String uname = udao.userName(ubean.getUid());
		String uemail = udao.userEmail(ubean.getUid());
		String tel = udao.userTel(ubean.getUid());
		int postcode = udao.userPostcode(ubean.getUid());
		String addr = udao.userAddr(ubean.getUid());
		String detailaddr = udao.userDetailaddr(ubean.getUid());
		String gender = udao.userGender(ubean.getUid());
		int birth = udao.userBirth(ubean.getUid());
		
		
		String rememberId = request.getParameter("rememberId");
		String uid = request.getParameter("uid");
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
			session.setAttribute("uid",ubean.getUid());//세션부여
			session.setAttribute("img", img);
			session.setAttribute("level", level);
			session.setAttribute("vip", vip);
			session.setAttribute("upass", upass);
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