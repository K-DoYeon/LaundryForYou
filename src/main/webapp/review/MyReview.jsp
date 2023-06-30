
<%@page import="review.ReviewDAO"%>
<%@page import="reservation.ReservationBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp"></jsp:include>
<jsp:useBean id="bean" class="reservation.ReservationBean" scope="page" />
<jsp:useBean id="rdao" class="reservation.ReservationDAO" scope="page" />

<link rel="stylesheet" href="../css/myReview.css">
<%
	int listNum = 7;
	int pageNum = 10;
	
	String pg = request.getParameter("page");
   int mypg = 1;
   try {
      mypg = Integer.parseInt(pg);
      if (mypg < 1) mypg = 1;
   } catch (Exception e) {
      mypg = 1;
   }
   int limitNum = (mypg - 1) * listNum;
   
   String uid = (String) session.getAttribute("uid");
   Vector<ReservationBean> review = rdao.myReviewList(uid, limitNum, listNum);
   
   int totalCount = rdao.myReviewCount(uid);
   int reviewCount = review.size();
   
   /*
      1. 전체 페이지 수 2. 전체 블럭수 3. 현재 블록번호 4. 블록당 시작번호 5. 블록당 마지막 번호
   */
   int totalPage = (int) Math.ceil(totalCount / (double) listNum);
   int totalBlock = (int) Math.ceil(totalPage / (double) pageNum);
   int nowBlock = (int) Math.ceil(mypg / (double) pageNum);
   int startNum = (nowBlock - 1) * pageNum + 1;
   int endNum = nowBlock * pageNum;
   if (endNum > totalPage) endNum = totalPage;
	   
%>
	<div class="container-myre">
		<h1>결제목록</h1>
		<p>총 결제 완료 : <%=totalCount%> <%=reviewCount%>건</p>
		<div class="reviewList-myre">
			<div class="tableHeader-myre">
				<h4 class="resnum-myre">예약번호</h4>			
				<h4>예약상품</h4>
				<h4>예약날짜</h4>
				<h4>후기관리</h4>
			</div>
			
			<div class="reviewBody-myre">
				<%
					for(int i = 0; i < reviewCount; i++){
						ReservationBean rbean = review.elementAt(i);
						
						int resnum = rbean.getResnum();
						
						ReviewDAO redao = new ReviewDAO();
						int userReview = redao.userReview(resnum);
						int reNum = redao.reNum(resnum);
				%>
					<form action="MyReviewProc.jsp" method="post" class="reviewForm-myre">
						<p class="resnum-myre"><input type="text" name="resnum" value="<%= rbean.getResnum() %>" readonly /></p>
						<div class="producName-myre">
							<p>세탁의 당신 : 세탁배송</p>
							<p>결제 금액 : <%= rbean.getTotalprice() %>원</p>
						</div>
						<p><%= rbean.getWdate() %></p>
						<%
							if(userReview == 1){
						%>
							<a href="reviewInfo.jsp?num=<%=reNum%>&resnum=<%=rbean.getResnum()%>">후기 보러가기</a>
						<%
							} else {
						%>
							<a href="reviewWrite.jsp?resnum=<%=rbean.getResnum()%>">후기 쓰러가기</a>
						<%
							}
						%>
					</form>
				<%
					}
					
				%>
			</div>
		</div>
	</div>
<jsp:include page="../include/footer.jsp"></jsp:include>