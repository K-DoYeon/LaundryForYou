<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="user.UserDAO, review.ReviewDAO, likey.LikeyDAO, java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%
// 로그인한 유저의 아이디를 가져오기(세션 확인)

	String uid = null;

	if(session.getAttribute("uid") != null) {

		uid = (String) session.getAttribute("uid");

	}



	if(uid == null) {

		PrintWriter script = response.getWriter();

		script.println("<script>");

		script.println("alert('로그인을 해주세요.');");

		script.println("history.go(-1)");

		script.println("</script>");

		script.close();

		return;



	}



	request.setCharacterEncoding("UTF-8");
	
	// 이전의 파라매터로 보낸 게시판 글제목 가져오기
		LikeyDAO ldao = new LikeyDAO();
		ReviewDAO rdao = new ReviewDAO();
		int num = Integer.parseInt(request.getParameter("num"));;
		String subject = (String) request.getParameter("subject");
		
		int result = ldao.delete(uid, subject);


		// 정상적으로 1번 데이터가 들어가면 1이 출력되고

		if (result == 1) {

			result = rdao.delete(num);

			if (result == 1) { // 1인경우 디비에서 해당 게시물 추천 완료
				
				PrintWriter script = response.getWriter();

				script.println("<script>");

				script.println("alert('좋아요를 취소했습니다.');");

				script.println("location.href='review.jsp'");

				script.println("</script>");

				script.close();

			} else {

				PrintWriter script = response.getWriter();

				script.println("<script>");

				script.println("alert('데이터베이스 오류가 발생했습니다.');");

				script.println("history.back();");

				script.println("</script>");

				script.close();

			}



		}
		
%>
</body>
</html>