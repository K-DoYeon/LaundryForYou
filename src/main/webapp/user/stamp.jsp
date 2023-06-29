<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="user.UserBean, review.ReviewDAO"%>
<jsp:include page="../include/header.jsp"></jsp:include>
<link rel="stylesheet" href="../css/stamp.css">
	
	<%
	UserBean ubean = new UserBean();
	String uid = (String) session.getAttribute("uid");
	String img = (String) session.getAttribute("img");
	
	ReviewDAO rdao = new ReviewDAO();
	int reviewCount = rdao.getReviewCount(uid);
	int maxColorPhotos = reviewCount % 5; 
	int blackAndWhitePhotos = 5 - maxColorPhotos;
	%>
	
	<div class="stamp-container">
		<div class="stamp-left">
			<div class="stamp-user">
				<img alt="userImg" src="../img/<%=img %>" class="stamp-user-img">
				<h3 class="stamp-user-name"> <span><%= uid %></span> 님</h3>
			</div>
			<div class="stapm-userpage">
				<a href="myPage.jsp" class="stamp-mypage">마이페이지</a> <br>
				<a href="myPage.jsp" class="stamp-coupon">무료배송 쿠폰 : 0개</a>
			</div>
		</div>
		
		<div class="stamp-right">
			<h2 class="stamp-h2">내 스탬프 현황
				<span class="stamp-span"><%=uid %> 님의 스탬프 : <%=reviewCount % 5 %> 개</span>
			</h2>
			<div class="stamp-img-container">
				<div class="stamp-img">
					<div class="bubbleMono-my">
         <%
               for(int i = 0; i < maxColorPhotos; i++) {
            %>
               <img alt="bubble_mono" src="../img/bubble.png" class="bubbleImg-my">
            <%
               }
         	%>
            <%
           	   for (int i = 0; i < blackAndWhitePhotos; i++) {
            %>
               <img alt="bubble_mono" src="../img/bubble_mono.png" class="bubbleImg-my">
            <%
               }
            %>
           
            
         </div>
				</div>
			</div>
			<div class="stamp-info">
				<h3>스템프 모으는 방법</h3>
				<div class="stamp-info-flex">
					<img src="../img/writing.png">
					<p>세탁의 당신을 이용하고 <span class="stamp-bold">리뷰</span>를 작성해보세요! 
						<a href="../review/MyReview.jsp" class="stamp-go">리뷰 작성하러 가기 <i class="ri-arrow-right-s-line"></i></a></p>
				</div>
				<div class="stamp-info-flex">
					<img src="../img/delivery.png">
					<p>스탬프 5개마다 <span class="stamp-bold">무료배송 쿠폰</span>을 드립니다.</p>
				</div>
				<div class="stamp-info-flex">
					<img src="../img/present.png">
					<p>스탬프를 모으며 다양한 <span class="stamp-bold">이벤트</span>를 놓치지 마세요!</p>
				</div>
				<div class="stamp-info-flex">
					<img src="../img/question.png">
					<p>궁금한점이 있다면 <span class="stamp-bold">QnA게시판</span>에 문의해주세요.
					<a href="../board/boardlist.jsp" class="stamp-go">문의하러 가기 <i class="ri-arrow-right-s-line"></i></a></p>
				</div>
			</div>
		</div>
	</div>
	
	
	
</body>
</html>