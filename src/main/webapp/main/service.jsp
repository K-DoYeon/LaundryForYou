<%@page import="reservation.ReservationDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<jsp:include page="../include/header.jsp"></jsp:include>
<link rel="stylesheet" href="../css/service.css">
<body>
<div class="top-tab">
	<div class="tab">
		<h1 class="do-cost"><a href="#" id="tab-cost" class="active n" data-idx="#cost">기본 요금</a></h1>
		<h1><a href="#" class="n" data-idx ="#pr">Pr</a></h1>
	</div>
</div>
<div class="service-container">
	
	<div class="service-content">
		<div class="active" id="cost">
			<div class="daily-laundry">
				<div class="daily-left">
					<h2>생활빨래</h2>
					<p>일반 가정에서 발생하는 의류, 수건, 양말 등을 세탁하고 건조하는 서비스 입니다.</p>
				</div>
				<div class="daily-right">
					<table class="daily-data">
						<thead>
							<tr>
								<th>품목</th>
								<th>요금</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th>생활빨래</th>
								<th>900원</th>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			
			<div class="daily-laundry">
				<div class="daily-left">
					<h2>침구</h2>
					<p>개별 품목의 권장된 케어라벨에 따라 세탁하고 오염제거를 위한 기본케어가 진행되는 서비스입니다.</p>
				</div>
				<div class="daily-right">
					<table class="daily-data">
						<thead>
							<tr>
								<th>품목</th>
								<th>요금</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th>이불</th>
								<th>10,000원</th>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			
			<div class="daily-laundry">
				<div class="daily-left">
					<h2>셔츠</h2>
					<p>개별 품목의 권장된 케어라벨에 따라 세탁하고 오염 제거를 위한 기본케어가 진행되는 서비스입니다.</p>
				</div>
				<div class="daily-right">
					<table class="daily-data">
						<thead>
							<tr>
								<th>품목</th>
								<th>요금</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th>셔츠</th>
								<th>2,000원</th>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			
			<div class="daily-laundry">
				<div class="daily-left">
					<h2>드라이</h2>
					<p>특별 세탁제를 사용해 탁월한 오염제거와 소재에 맞는 맞춤 건조를 통해 특별케어를 제공하는 서비스입니다.</p>
				</div>
				<div class="daily-right">
					<table class="daily-data">
						<thead>
							<tr>
								<th>품목</th>
								<th>요금</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th>드라이</th>
								<th>5,000원</th>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			
			<div class="daily-laundry">
				<div class="daily-left">
					<h2>개별 클리닉</h2>
					<p>단독 세탁물이나 물빠짐이 있는 세탁물을 따로 받아 이염없이 깔끔한 세탁을 위한 서비스입니다.</p>
				</div>
				<div class="daily-right">
					<table class="daily-data">
						<thead>
							<tr>
								<th>품목</th>
								<th>요금</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th>개별 클리닉</th>
								<th>1,500원</th>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		
		<div id="pr">
			<div class="top-title">
				<img alt="pr-bg" src="../img/pr-bg.jpg">
				<div class="pr-font">
					<p>세탁 없는 삶.</p>
					<p class="pr-logo">세탁의 <span>당신</span></p>
				</div>
			</div>
			<div class="pr-second">
				<h1>사람을 위한</h1>
				<h1>현대적이고 편리한</h1>
				<p>세탁의 당신은 1인가구도 부담없이 편리하게 세탁서비스를 사용할 수 있게 하자는 트랜드적인 사고로 시작 되었습니다. 각 분야의 전문가들이 모여 사람들의 삶이 더욱 행복해질 수 있도록 고민하고 땀흘리고 있습니다.</p>
				<div class="pr-se-item">
					<div class="pr-price">
						<h3>부담없는 세탁 가격과 높은 품질</h3>
						<p>1인 가구들을 고려하여 최대한 거품가격은 내리고 좋은 품질을 유지하기 위해 다양한 서비스를 시행하고 있습니다.</p>
					</div>
					<div class="pr-deliver">
						<h3>직접 찾아가는 세탁소</h3>
						<p>전문적인 수거 업체가 빠르고 신속하게 세탁물을 수거해 여러분의 시간을 절약해드립니다.</p>
					</div>
				</div>
			</div>
			
			<div class="pr-three">
				<h1>세탁의 모든 것을</h1>
				<h1>한번에</h1>
				<div class="pr-icon">
					<div class="icon">
						<img class="laun" alt="물세탁" src="../img/laundry.png">
						<img alt="세탁기" src="../img/washing.png">
						<img alt="실" src="../img/thread.png">
						<img alt="옷" src="../img/clothes.png">
						<img alt="다리미" src="../img/iron.png">
					</div>
					<div class="icon-name">
						<span class="lau">손세탁</span>
						<span class="wash">드라이클리닝</span>
						<span class="thread">수선</span>
						<span class="cloth">얼룩케어</span>
						<span class="iron">프레스</span>
					</div>
					<p>누구보다 좋은 제품 품질을 위해 모든 세탁물을 철저한 단계별 클리닝 시스템으로 케어합니다.</p>
				</div>
			</div>
			
			<div class="pr-delivery">
				<h1>반짝 배송으로 시작 한</h1>
				<h1 class="pr-first">첫 걸음</h1>
				<img alt="delivery" src="../img/delivery.jpg">
				<p>눈 깜빡할 사이에 도착, 1인가구도 4인가구도 부담없이 배달가능한 서비스로 단숨에 모두를 사로잡은 반짝 배송</p>
			</div>
			
			<div class="pr-last">
				<img alt="" src="../img/drum.jpg">
				<div class="last-text">
					<p>당신의 삶,</p>
					<p>귀찮은 세탁은</p>
					<p>세탁의 당신에게</p>
					<p class="last-go"><a href="../reservation/reservation.jsp">예약하기</a></p>
				</div>
			</div>
			
		</div>
	</div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="../js/service.js"></script>
</body>
<jsp:include page="../include/footer.jsp"></jsp:include>
</html>