<%@page import="reservation.PaymentBean"%>
<%@page import="reservation.PaymentDAO"%>
<%@page import="reservation.ReservationDAO"%>
<%@page import="reservation.ReservationBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세탁의 당신</title>
<link rel="icon" href="../img/bubble.png">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
	.ui-dialog-titlebar-close {
		display: none;
	}
	button{
		margin: 30px 0px 0px 150px;
    	padding: 10px 20px;
    	border: none;
	}
</style>
</head>
<body>
  <div id="popup-dialog" title="팝업 제목">
  <form action="payCompleteProc.jsp">
    <p>결제가 완료되었습니다.</p>
    <button type="submit">확인</button>
  </form>
  </div>

  <script>
    $(document).ready(function() {
      // 팝업 다이얼로그 생성
      $("#popup-dialog").dialog({
        autoOpen: true,  // 페이지 로드 시 자동으로 열림
        modal: true,     // 모달 형식으로 띄움
        width: 400,      // 다이얼로그 너비
        height: 200      // 다이얼로그 높이
      });
    });
    
  </script>


</body>
</html>