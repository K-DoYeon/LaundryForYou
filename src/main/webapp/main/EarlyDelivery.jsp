<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, user.UserDAO " %>
    
<jsp:include page="../include/header.jsp"></jsp:include>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="../css/EarlyDelivery.css" />

    <body>
        <div class="banner-k">
            <img src="../img/EDbanner.jpg" alt="banner">
            <div class="content-k">
                <h1>LAUNDRY</h1>
                <h1>반짝배송</h1>
                <p>문 앞에 내놓기만 하면</p>
                <p>깨끗해진 세탁물이 아침에 도착합니다</p>
            </div>
        </div>
        <!--/배너 사진-->
        <div class="first-k">
            <div class="container-k">
                <div class="title-k">
                    <h1>아침이 밝을 때가 가장 깨끗할때</h1>
                    <h1>반짝배송</h1>
                </div>
                <div class="box-k">
                    <div class="top-k">
                        <p>번거로움 없이 문앞에서</p>
                    </div>
                    <div class="bottom-k">
                        <p>
                            세탁이 끝나면 어디보다 빠르게
                            <br>
                            문 앞까지 배달서비스
                        </p>
                    </div>
                </div>
                <div class="box-k">
                    <div class="top-k">
                        <p>100% 반짝배송</p>
                    </div>
                    <div class="bottom-k">
                        <p>
                            기다릴 필요없이 자고 일어나면
                            <br>
                            깨끗한 세탁물이 문앞에
                        </p>
                    </div>
                </div>
                <div class="box-k">
                    <div class="top-k">
                        <p>친환경 세재 사용</p>
                    </div>
                    <div class="bottom-k">
                        <p>
                            인체에 무해한 제품만을 사용
                            <br>
                            향기도 향긋하게
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <!-- /첫번째 content -->
        
        <div class="search-k">
        	<div class="container-k">
        		<div class="search-content">
		        	<h1>우리집이 반짝배송 지역인지</h1>
		        	<h1>확인해보세요</h1>
	        	</div>
	        	<button onclick="Postcode();">배송 지역 검색하기 <i class="fa-solid fa-magnifying-glass"></i></button>
	        	<form onsubmit="checkAddress(event)">
		        	<input type="text" id="postcode" class="postcode-k" placeholder="우편번호" readonly/> <br />
		        	<input type="text" id="address" class="address-k" placeholder="주소" readonly/> <br />
		        	<input type="submit" value="확인" class="submit-k"/>        	
		       	</form>
        	</div>
        </div>
        
	  <div id="myModal" class="modal">
  		<div class="modal-content">
    		<p id="modal-content"></p>
    		<img src="../img/delivery2.png" alt="delivery" /> <br />
    		<p>매일매일 깨끗한 세탁을 위해 <br /> 노력하겠습니다.</p>
    		<button id="modal-close-btn">확인</button>
  		</div>
	  </div>
        
        <div class="second-k">
            <div class="container-k">
                <div class="title-k2">
                    <h1>반짝&택배배송</h1>
                    <h1>일정 보기</h1>
                </div>
                <div class="box-k2">
                    <div class="top-k2">
                        <p>반짝 배송</p>
                    </div>
                    <div class="bottom-k2">
                      <h1>주 7일 반짝배송⚡</h1>
                      <p>오늘 밤 예약하면 새벽이면 도착!</p>
                      <p>런드리 기사님이 직접 배송해드려요.</p>
                      <div class="row-k">
                        <span>지역</span>
                        <span>주문 시간</span>
                        <span>배송 시간</span>
                      </div>
                      <div class="row-k2">
                        <span>서울 전 지역</span>
                        <span>밤 11시 전</span>
                        <span>다음날 아침 7시 전</span>
                      </div>
                      <div class="row-k3">
                        <span>-배송일 :</span>
                        <span><strong>매일(휴무일 없음)</strong> </span>
                      </div>
                      <div class="row-k4">
                        <span>-무료배송 :</span>
                        <span><strong>주문 금액 4만원 이상</strong> </span>
                      </div>
                    </div>
                </div>

                <div class="box-k2">
                    <div class="top-k22">
                        <p>일반 배송</p>
                    </div>
                    <div class="bottom-k2">
                      <h1>주 6일 일반배송🚛</h1>
                      <p>오늘 예약하면 내일 도착!</p>
                      <p>새벽배송 불가 지역은 일반 배송으로 배송해드려요.</p>
                      <div class="row-k">
                        <span>지역</span>
                        <span>주문 시간</span>
                        <span>배송 시간</span>
                      </div>
                      <div class="row-k2">
                        <span>서울 외 지역</span>
                        <span>밤 11시 전</span>
                        <span>다음날 까지 도착</span>
                      </div>
                      <div class="row-k3">
                        <span>-배송일 :</span>
                        <span><strong>월요일 ~ 토요일(일요일, 공휴일 휴무)</strong> </span>
                      </div>
                      <div class="row-k4">
                        <span>-무료배송 :</span>
                        <span><strong>주문 금액 4만원 이상</strong> </span>
                      </div>
                    </div>
                </div>

            </div>
        </div>

          <!-- /세번째 content -->
          
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="../js/EarlyDelivery.js"></script>

<jsp:include page="../include/footer.jsp"></jsp:include>
