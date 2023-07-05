<%@page import="java.io.OutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="user.UserDAO"%>
<%@page import="user.UserBean"%>
<%@ page import="java.io.PrintWriter" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<body>
	<%
	UserDAO udao = new UserDAO();
	UserBean ubean = new UserBean();

	String uid = (String)session.getAttribute("uid");
	String upass = request.getParameter("upass");
	String uname = request.getParameter("uname");
	String uemail = request.getParameter("uemail");
	String tel = request.getParameter("tel");
	int postcode = Integer.parseInt(request.getParameter("postcode"));
	String addr = request.getParameter("addr");
	String detailaddr = request.getParameter("detailaddr");
	int birth = Integer.parseInt(request.getParameter("birth"));
	int level = udao.userLevel(uid);
	int vip = udao.userVip(uid);
	String gender = udao.userGender(uid);
	
	if(udao.login(uid, upass) == 1) {
		
		boolean flag = udao.updateInfo(uname, uemail, tel, postcode, addr, detailaddr, birth, uid);
		if(flag) {
			session.setAttribute("level", level);
			session.setAttribute("vip", vip);
			session.setAttribute("uname", uname);
			session.setAttribute("uemail", uemail);
			session.setAttribute("tel", tel);
			session.setAttribute("postcode", postcode);
			session.setAttribute("addr", addr);
			session.setAttribute("detailaddr", detailaddr);
			session.setAttribute("gender", gender);
			session.setAttribute("birth", birth);
	%>
		<script>
			alert("회원정보가 정상적으로 변경되었습니다.");
			document.location.href="myPage.jsp";
		</script>
	<%
			}else {
	%>
			<script>
				alert("회원정보 변경에 실패했습니다.");
				history.back();
			</script>
	<%		
			}
		}
	%>
</body>
</html>