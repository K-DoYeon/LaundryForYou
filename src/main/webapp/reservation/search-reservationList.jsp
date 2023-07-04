<%@page import="java.io.PrintWriter"%>
<%@page import="reservation.ReservationBean"%>
<%@page import="reservation.ReservationDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, reservation.ReservationDAO " %>  
<%
	request.setCharacterEncoding("UTF-8");
%> 
<style>
	.gnb-header, .welcome-header{
		margin: 0;
	}
</style>

<jsp:useBean id="bean" class="reservation.ReservationBean" scope="page" />
<jsp:useBean id="rdao" class="reservation.ReservationDAO" scope="page" />
<%
	int listNum = 10; // 한 페이지당 보여줄 목록 수
	int pageNum = 15; // 한 블럭당 보여줄 페이지 수	
%>



<%

	String pg = request.getParameter("page");
	int mypg = 1;
	try {
		mypg = Integer.parseInt(pg);
		if (mypg < 1) mypg = 1;
	} catch (Exception e) {
		mypg = 1;
	}
	int limitNum = (mypg - 1) * listNum;
	
	 String searchField = request.getParameter("searchField");
	    String searchText = request.getParameter("searchText");
	    ArrayList<ReservationBean> list = new ArrayList<ReservationBean>();
	    int searchResultCount = 1;
	
	    if (searchField != null && searchText != null) {
	        list = rdao.getSearch(searchField.trim(), searchText.trim());
	        searchResultCount = list.size();
	    }

	    int maxColumn = searchResultCount;
	    int size = list.size();
	
	/*
		1. 전체 페이지 수 2. 전체 블럭수 3. 현재 블록번호 4. 블록당 시작번호 5. 블록당 마지막 번호
	*/
	int totalPage = (int) Math.ceil(maxColumn / (double) listNum);
    int totalBlock = (int) Math.ceil(totalPage / (double) pageNum);
    int nowBlock = (int) Math.ceil(mypg / (double) pageNum);
    int startNum = (nowBlock - 1) * pageNum + 1;
    int endNum = nowBlock * pageNum;
    if (endNum > totalPage) endNum = totalPage;
	
	
	// 예약 삭제 처리
	String deleteNum = request.getParameter("delete");
	if (deleteNum != null) {
	   int reservationNum = Integer.parseInt(deleteNum);
	   boolean deleteResult = rdao.deleteReservation(reservationNum);
	   if (deleteResult) {
	      out.println("<script>alert('예약이 취소되었습니다.'); location.href='reservationList.jsp';</script>");
	   } else {
	      out.println("<script>alert('예약 취소에 실패했습니다.');</script>");
	   }
	}

%>   

<link rel="stylesheet" href="../css/bootstrap.css" />
<link rel="stylesheet" href="../css/search-reservation.css">
<jsp:include page="../include/header.jsp"></jsp:include>

<div class="container lmember">
    <h1 class="mt-3 mb-3 text-center">예약목록</h1>
    
     <!-- search box -->
   <div class="search-box">
       <form action="search-reservationList.jsp" name="search" method="post" class="form-right">
          <div class="flex-select">
             <select class="form-control w100" name="searchField">
                <option value="0">선택</option>
                <option value="uname">이름</option>
                <option value="tel">전화번호</option>
                <option value="num">예약번호</option>
             </select>
             <input type="text" id="search-input" class="form-control w200" placeholder="검색어를 입력하세요." name="searchText" maxlength="20">
             <button type="submit" class="search-submit"> 검색 </button>
             <a href="reservationList.jsp" class="list-all">전체목록</a> 
          </div>
       </form>
    </div>
    <!-- search box -->
    
    <%-- <div class="text-end">
        전체 예약 : <%= maxColumn %> 건
    </div> --%>
    <div class="row">
        <table class="table  memberstbl">
            <thead>
                <tr>
                    <th>번호</th>
                    <th>이름</th>
                    <th>주소</th>
                    <th>전화번호</th>
                    <th>생활빨래</th>
                    <th>이불빨래</th>
                    <th>셔츠</th>
                    <th>드라이</th>
                    <th>개별빨래</th>
                    <th>총 금액</th>
                    <th>예약상태</th>
                    <th>예약취소</th>
                </tr>
            </thead>
            <tbody>
                <% 
     
               
                if (searchField != null && searchText != null) {
                    list = rdao.getSearch(searchField.trim(), searchText.trim());
                }
               /*  
                if (list.size() == 0) {
                    PrintWriter script = response.getWriter();
                    script.println("<script>");
                    script.println("alert('검색결과가 없습니다.')");
                    script.println("history.back()");
                    script.println("</script>");
                }else{
                	PrintWriter script = response.getWriter();
                	script.println("<script>");
                    script.println("alert('검색됨.')");
                    script.println("</script>");
                } */
				
                
                for (int i = limitNum; i < limitNum + listNum && i < size; i++) {
                    ReservationBean rbean = list.get(i);

                    int num = rbean.getNum();
                    String username = rbean.getUname();
                    int postcode = rbean.getPostcode();
                    String addr = rbean.getAddr();
                    String detailAddr = rbean.getDetailaddr();
                    String tel = rbean.getTel();
                    int daily = rbean.getDaily();
                    int blanket = rbean.getBlanket();
                    int shirt = rbean.getShirt();
                    int dry = rbean.getDry();
                    int care = rbean.getCare();
                    int totalprice = rbean.getTotalprice();
                    int condition = rbean.getCondition();
                %>
                    <tr>
                        <td><%= num %></td>
                        <td><%= username %></td>
                        <td>[<%= postcode %>] <%= addr %> <%= detailAddr %></td>
                        <td><%= tel %></td>
                        <td class="text-align-center"><%= daily %> 개</td>
                        <td class="text-align-center"><%= blanket %> 개</td>
                        <td class="text-align-center"><%= shirt %> 개</td>
                        <td class="text-align-center"><%= dry %> 개</td>
                        <td class="text-align-center"><%= care %> 개</td>
                        <td><%= totalprice %> 원</td>
                        <td>
                            <select name="condition" class="condition" onchange="resCondition(this, <%= condition %>, <%= num %>);">
                                <option value="0" <%= condition == 0 ? "selected" : "" %>>입금대기</option>
                                <option value="1" <%= condition == 1 ? "selected" : "" %>>입금완료</option>
                                <option value="2" <%= condition == 2 ? "selected" : "" %>>수거준비</option>
                                <option value="3" <%= condition == 3 ? "selected" : "" %>>수거완료</option>
                                <option value="4" <%= condition == 4 ? "selected" : "" %>>배송완료</option>
                            </select>
                        </td>
                        <td>
                        	<form method="post" action="">
						         <input type="hidden" name="delete" value="<%=num %>">
						         <button type="submit" class="btn btn-outline-danger btn-sm">예약취소</button>
      						</form>
                        </td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div> <!-- /row -->
    <div class="mt-3 mb-5 row ">
       <ul class="pagination justify-content-center mb-5">
            <% // 이전페이지
            if (startNum > 1) {
                int prevPage = startNum - 1;
                out.print("<li class=\"page-item\"><a class=\"page-link\" href=\"search-reservationList.jsp?page=" + prevPage + "&searchField=" + searchField + "&searchText=" + searchText + "\">이전</a></li>");
            } else {
                out.print("<li class=\"page-item\"><a class=\"page-link text-muted\" href=\"javascript:void(0)\">이전</a></li>");
            }

            // 페이지 출력
            for (int j = startNum; j <= endNum; j++) {
                String act = "";
                if (mypg == j) act = "active";
            %>
                <li class="page-item <%= act %>"><a class="page-link" href="search-reservationList.jsp?page=<%= j %>&searchField=<%= searchField %>&searchText=<%= searchText %>"><%= j %></a></li>
            <% }

            // 다음 페이지
            if (endNum < totalPage) {
                int nextPage = endNum + 1;
                out.print("<li class=\"page-item\"><a class=\"page-link\" href=\"search-reservationList.jsp?page=" + nextPage + "&searchField=" + searchField + "&searchText=" + searchText + "\">다음</a></li>");
            } else {
                out.print("<li class=\"page-item\"><a class=\"page-link text-muted\" href=\"javascript:void(0)\">다음</a></li>");
            } %>
        </ul>
    </div>
</div>

<script src="../js/reservationlist.js"></script>
<jsp:include page="../include/footer.jsp"></jsp:include>
