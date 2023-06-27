<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Vector"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.io.PrintWriter" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css" />
<link rel="stylesheet" href="../css/boardlist.css">
<jsp:include page="../include/header.jsp"></jsp:include>
</head>
<body>
<%	BoardDAO bbsDAO = new BoardDAO();
    ArrayList<BoardBean> list = bbsDAO.getSearch(request.getParameter("searchField"), request.getParameter("searchText"));

			if (list.size() == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('검색결과가 없습니다.')");
			script.println("history.back()");
			script.println("</script>");
			}
			
			int pageSize = 5; // 페이지당 게시글 수
			int currentPage = 1; // 현재 페이지 번호
			if (request.getParameter("pageNum") != null) {
			currentPage = Integer.parseInt(request.getParameter("pageNum"));
			}
			
			int startRow = (currentPage - 1) * pageSize;
			int endRow = currentPage * pageSize;
			if (endRow > list.size()) {
			endRow = list.size();
			}
			
			for (int i = startRow; i < endRow; i++) {
			BoardBean bean = list.get(i);
/*  				String wdateStr = bean.getWdate();

				SimpleDateFormat sdfInput = new SimpleDateFormat("yyyy-MM-dd"); // 현재 형식
				Date wdate = sdfInput.parse(wdateStr); // 문자열을 Date 객체로 변환

				SimpleDateFormat sdfOutput = new SimpleDateFormat("yyyy.MM.dd"); // 변경하고자 하는 형식
				String formattedWdate = sdfOutput.format(wdate); // 변경된 형식으로 날짜를 문자열로 변환 */
%>
<div class="do-container">
 	<div class="active" id="QA">
      <div class="faq">
      	<div class="do-title">
	      	<div class="do-day">
	      		<span class="big">01</span>
	      		<%-- <span><%=formattedWdate%></span> --%>
	      	</div>
	      	<div><h3 class="faq-title"><%=bean.getSubject() %></h3></div>
      	</div>
		
		<div>
        	<p class="faq-text"><%=bean.getContent() %></p>
			<p class="faq-plus"><a href="#">더보기..</a></p>
		</div>
        <button class="faq-toggle">
          <i class="fas fa-chevron-down"></i>
          <i class="fas fa-times"></i>
        </button>
	   </div>
	</div>
	
        <%
        }

        int pageCount = list.size() / pageSize + (list.size() % pageSize == 0 ? 0 : 1);
        int startPage = ((currentPage - 1) / 10) * 10 + 1;
        int endPage = startPage + 9;
        if (endPage > pageCount) {
            endPage = pageCount;
        }
        %>
        <div class="page txt-align active">
		<div class="btn">
              <%
                if (startPage > 1) {
              %>
                <a href="boardSearchList.jsp?pageNum=<%= startPage - 1 %>&searchField=<%= request.getParameter("searchField") %>&searchText=<%= request.getParameter("searchText") %>" id="a-prev">이전</a>
              <%
                }
                for (int i = startPage; i <= endPage; i++) {
              %>
                <a href="boardSearchList.jsp?pageNum=<%= i %>&searchField=<%= request.getParameter("searchField") %>&searchText=<%= request.getParameter("searchText") %>" id="a-now"><%= i %></a>
              <%
                }
                if (endPage < pageCount) {
              %>
                <a href="boardSearchList.jsp?pageNum=<%= endPage + 1 %>&searchField=<%= request.getParameter("searchField") %>&searchText=<%= request.getParameter("searchText") %>" id="a-next">다음</a>
              <%
                }
              %>
		</div>
		</div>
		</div>

	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="../js/boardlist.js"></script>
</body>
</html>