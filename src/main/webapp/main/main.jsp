<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp"></jsp:include>
<%
		Cookie[] cookies = request.getCookies();
		String loginStatus = null;
		String rememberId = null;
		String uid =  null;
		
		if(cookies != null && cookies.length>0){
			for (int i=0; i<cookies.length; i++){
				
				if(cookies[i].getName().equals("loginStatus")){
					loginStatus = cookies[i].getValue();
				}
				if(cookies[i].getName().equals("rememberId")){
					
					rememberId = cookies[i].getValue();
				}
				if(cookies[i].getName().equals("uid")){
					uid = cookies[i].getValue();
				}
			}
		}
	%>
<div class="main-container">
	<div class="main-banner">
		<div class="banner-inside">
			<div class="main-delivery">
				<p class="delivery-p">우리집이<span> 반짝 배송 </span>지역인지<br>확인해보세요!</p>
				<p class="delivery-p-s">남들보다 빠르게, 신속한 반짝배송을 받아보세요.</p>
				<a href="EarlyDelivery.jsp">
				<input type="search" id="delivery-search" placeholder="거주지의 지역명을 검색해보세요." class="delivery-search" name="searchText" autocomplete="off" disabled>
				</a>
				<span class="delevery-search-btn"><i class="ri-search-line"></i></span>
				<p class="delivery-hashtag">
					<span>#</span>
					&nbsp;&nbsp;반짝 배송
					&nbsp;&nbsp;전날 수거
					&nbsp;&nbsp;다음날 배송
					&nbsp;&nbsp;깔끔하고
					&nbsp;&nbsp;신속하게
				</p>
			</div>
			<a href="../reservation/reservation.jsp" class="main-reservation">
				<i class="ri-arrow-right-s-line sBannerBtn-main"></i>
				<img alt="smallBanner" src="../img/smallbanner2.png">
			</a>
			<!-- <div class="main-reservation">
				<p class="reservation-p">지금<span> 세탁의 민족 </span>을<br>이용해보세요!</p>
				<form action="../reservation/reservation.jsp" method="post" name="main-reservation-form" class="mainReservation-main">
					<div class="userInfoBox-main">
						<label>이름</label>
						<input type="text" id="reservation-name" class="reservation-name" name="rname" placeholder="이름을 적어주세요">
					</div>
					<div class="userInfoBox-main">
						<label>연락처</label>
						<input type="text" id="reservation-tel" class="reservation-tel" name="rtel" placeholder="숫자만 입력해주세요">
					</div>
					<input type="submit" class="reservation-submit" onsubmit='#' value="세탁 예약하기" />
				</form>
			</div> -->
		</div>
	</div>
	
	<div class="main-review">
		<div class="review-left">
			<div class="review-left-header">
				<img src="../img/main-reservation-hand.png" alt="thumbs-up">
				<p>이달의 <span>BEST</span> 후기</p>
			</div>
			<img src="../img/main-clothes.jpg" alt="clean-clothes" class="main-clothes">
			<div class="review-left-bottom">
				<img src="../img/review-woman.png" alt="woman" class="review-woman">
				<p><span class="review-span">전** 고객님의 후기 : </span><br>
				   새벽배송 이용했는데 배송이 정말 빨라요!  <br> 깔끔한 옷 받고 기분이 너무 좋네요. 단골 고객 예약이요 ^^</p>
			</div>	
		</div>
		<div class="review-right">
			<p class="review-right-top"><i class="ri-single-quotes-l"></i><span>세탁의 <span>당신</span></span><i class="ri-single-quotes-r"></i>
				 고객님들의 실시간 리뷰</p>
			<p class="review-right-bottom">소중한 고객님들의 만족스러운 서비스 후기</p>
			
			<!-- db로 review for문 예정 -jeon -->
			<div class="review-db-for">
				<div class="review-for-for">
					<div class="review-for">
						<img src="../img/review-tshirt.png" alt="t-shirt">
						<span>강** 님의 후기</span>
						<span>2023-06-13</span>
					</div>
				</div>
				<div class="review-for-for">
					<div class="review-for">
						<img src="../img/review-shirt.png" alt="shirt">
						<span>최** 님의 후기</span>
						<span>2023-06-11</span>
					</div>
				</div>
				<div class="review-for-for">
					<div class="review-for">
						<img src="../img/review-towel.png" alt="towel">
						<span>차** 님의 후기</span>
						<span>2023-06-10</span>
					</div>
				</div>
				<div class="review-for-for">
					<div class="review-for">
						<img src="../img/review-shoes.png" alt="shoes">
						<span>홍** 님의 후기</span>
						<span>2023-06-08</span>
					</div>
				</div>
				<div class="review-for-for">
					<div class="review-for">
						<img src="../img/review-pants.png" alt="pants">
						<span>김** 님의 후기</span>
						<span>2023-06-07</span>
					</div>
				</div>	
			</div>
			<!-- db로 review for문 예정 -jeon -->
		</div>
	</div>
	
	<!-- slide -->
	 <div class="s-container">
        <div class="slide-container">
            <div class="slide"><img src="../img/slide1.png" alt="slide1"></div>
            <div class="slide"><img src="../img/slide2.png" alt="slide2"></div>
            <div class="slide"><img src="../img/slide3.png" alt="slide3"></div>
            <div class="slide"><img src="../img/slide4.png" alt="slide4"></div>
            <div class="slide"><img src="../img/slide5.png" alt="slide5"></div>
            <div class="slide"><img src="../img/slide6.png" alt="slide6"></div>
        </div>
    </div>
    <!-- slide -->
    
</div>
	
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="../js/main-slide.js"></script>


<jsp:include page="../include/footer.jsp"></jsp:include>
