<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<meta charset="UTF-8">
<title>Reservation</title>
<jsp:include page="../include/header.jsp"></jsp:include>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="stylesheet" href="../css/BlackReservation.css">
<link rel="stylesheet" href="../css/BlackDatetimepicker.css">
<body>
	<%
		String uid = (String) session.getAttribute("uid");
		if(uid == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인 후 이용해 주세요')");
			script.println("location.href='../user/login.jsp'");
			script.println("</script>");
		}
		
		String img = (String) session.getAttribute("img");
		String uname = (String) session.getAttribute("uname");
		String tel = (String) session.getAttribute("tel");
		Integer postcode = (Integer) session.getAttribute("postcode");
		String addr = (String) session.getAttribute("addr");
		String detailaddr = (String) session.getAttribute("detailaddr");
	%>
	<div class="container-reser">
		<form class="reservation-reser" name="reservaionForm" action="BlackReservationProc.jsp" method="post">
			<div class="userInfo-reser">
				<h2 class="title-reser">정보를 입력해 주세요</h2>
				<div class="userID-reser">
					<img alt="user" src="../img/<%= img%>" class="userImg-reser">
					<p><%= uid %></p>
					<input type="hidden" name="uid" value="<%=uid%>">
				</div>
				<div class="infoBox-reser">
					<label class="infoName-reser">이름</label>
					<input type="text" name="uname" class="infoVal-reser" value="<%= uname %>"  placeholder="이름을 입력해주세요" required />
				</div>
				<div class="infoBox-reser">
					<label class="infoName-reser">연락처</label>
					<input type="text" name="tel" class="infoVal-reser" value="<%= tel %>" placeholder="숫자만 입력해주세요" required />
				</div>
				<div class="infoBox-reser">
					<label class="infoName-reser">우편번호</label>
					<input type="number" name="postcode" class="infoVal-reser" value="<%= postcode %>" id="postcode" readonly >
	            </div>
				
				<div class="infoBox-reser addr-reser">
					<label class="infoName-reser addrName-reser">주소</label>
					<div class="infoValBox-reser">
						<input type="text" name="addr" class="infoVal-reser addrVal-reser" value="<%= addr %>" id="address" readonly />
						<input type="text" name="detailaddr" class="infoVal-reser" value="<%= detailaddr %>" id="detailaddr" placeholder="상세주소를 입력해주세요" required />
					</div>
				</div>
				<div class="infoBox-reser">
					<label class="infoName-reser">특이사항</label>
					<textarea name="comment" class="infoVal-reser" placeholder="ex:청바지 물빠짐이 있어요" required></textarea>
				</div>
			</div>
		
		<div class="do-calendar">
			<input name="selectdate" class="datetimepicker" type="hidden" id="inputValue" onchange="inputValueChange()">
		</div>
		<div class="do-confirm">
			<div class="selectOption-reser">
				<div class="selectName-reser">
					<h4>생활빨래</h4>
					<span>빠쁜 일상 속 편리하게!</span>
				</div>
				<input type="hidden" name="dailyprice" id="dailyprice" value="50000">
				<button type="button" name="minus" onclick="dailyMinus();" class="cursorPt-reser"><i class="ri-subtract-line"></i></button>
				<input type="text" name="daily" id="daily" value="0" size="3" max="" class="selectCount-reser">
				<button type="button" name="add" onclick="dailyPlus();" class="cursorPt-reser"><i class="ri-add-line"></i></button>
				<div class="">
					<input type="text" name="dailySumprice" id="dailySumprice" value="0" class="selectPrice-reser" size="11" readonly>원
				</div>
			</div>
			<div class="selectOption-reser">
				<div class="selectName-reser">
					<h4>이불빨래</h4>
					<span>매일 쓰는 이불도 보송하게!</span>
				</div>
				<input type="hidden" name="blanketprice" id="blanketprice" value="100000">
				<button type="button" name="minus" onclick="blanketMinus();" class="cursorPt-reser"><i class="ri-subtract-line"></i></button>
				<input type="text" name="blanket" id="blanket" value="0" size="3" max="" class="selectCount-reser">
				<button type="button" name="add" onclick="blanketPlus();" class="cursorPt-reser"><i class="ri-add-line"></i></button>
				<div>
					<input type="text" name="blanketSumprice" id="blanketSumprice" value="0" class="selectPrice-reser" size="11" readonly>원
				</div>
			</div>
			<div class="selectOption-reser">
				<div class="selectName-reser">
					<h4>셔츠</h4>
					<span>신경 쓰이는 셔츠도 빠르게!</span>
				</div>
				<input type="hidden" name="shirtprice" id="shirtprice" value="25000">
				<button type="button" name="minus" onclick="shirtMinus();" class="cursorPt-reser"><i class="ri-subtract-line"></i></button>
				<input type="text" name="shirt" id="shirt" value="0" size="3" max="" class="selectCount-reser">
				<button type="button" name="add" onclick="shirtPlus();" class="cursorPt-reser"><i class="ri-add-line"></i></button>
				<div>
					<input type="text" name="shirtSumprice" id="shirtSumprice" value="0" class="selectPrice-reser" size="11" readonly>원
				</div>
			</div>
			<div class="selectOption-reser">
				<div class="selectName-reser">
					<h4>드라이</h4>
					<span>드라이클리닝도 빠르게!</span>
				</div>
				<input type="hidden" name="dryprice" id="dryprice" value="80000">
				<button type="button" name="minus" onclick="dryMinus();" class="cursorPt-reser"><i class="ri-subtract-line"></i></button>
				<input type="text" name="dry" id="dry" value="0" size="3" max="" class="selectCount-reser">
				<button type="button" name="add" onclick="dryPlus();" class="cursorPt-reser"><i class="ri-add-line"></i></button>
				<div>
					<input type="text" name="drySumprice" id="drySumprice" value="0" class="selectPrice-reser" size="11" readonly>원
				</div>
			</div>
			<div class="selectOption-reser">
				<div class="selectName-reser">
					<h4>개별빨래</h4>
					<span>번거로운 빨래도 간편하게!</span>
				</div>
				<input type="hidden" name="careprice" id="careprice" value="90000">
				<button type="button" name="minus" onclick="careMinus();" class="cursorPt-reser"><i class="ri-subtract-line"></i></button>
				<input type="text" name="care" id="care" value="0" size="3" max="" class="selectCount-reser">
				<button type="button" name="add" onclick="carePlus();" class="cursorPt-reser"><i class="ri-add-line"></i></button>
				<div>
					<input type="text" name="careSumprice" id="careSumprice" value="0" class="selectPrice-reser" size="11" readonly>원
				</div>
			</div>			
			
			<div class="totalPriceBox-reser">
				<h2 class="sizeDown-reser">총</h2> <input type="text" name="totalprice" id="total" value="0" size="11"> <h2>원</h2>
			</div>
			
			<button type="submit" class="do-reser" value ="submit">예약하기</button>
		</div>
		
		</form>
	</div>

	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.4/build/jquery.datetimepicker.full.min.js"></script>
	<script src="../js/datetimepicker.js"></script>
	<script src="../js/BlackReservation.js"></script>
<jsp:include page="../include/footer.jsp"></jsp:include>






<%-- <h1>"<span><%= uname %></span>"님 예약 상세 정보</h1>
		<p class="do-res">예약 날짜</p>
		<input name="selectdate" class="datetimepicker" type="text" id="inputValue" onchange="inputValueChange()">
		<div class="do-information">
			<p><%= addr %></p> 
			<p><%= detailaddr %></p>
			<p><%= tel %></p>
			<p>특이사항 : </p>
		</div> --%>