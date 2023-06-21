<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="user.UserBean"%>
<jsp:include page="../include/header.jsp"></jsp:include>
<link rel="stylesheet" href="../css/myPage.css">
   
   <%
   UserBean ubean = new UserBean();
   String uid = (String) session.getAttribute("uid");
   String img = (String) session.getAttribute("img");
   Integer vip = (Integer) session.getAttribute("vip");
   %>
   <div class="userInfo-my">
      <div class="userInfoBox-my">
         <div class="userImg-my">
            <div class="userImgTop-my">
               <img alt="userImg" src="../img/<%=img %>" class="userImgScale-my">
               <h3 class="userName-my"> <span><%= uid %></span> 님</h3>
            </div>
            <div class="userBtn-my">
               <a href="updatePw.jsp" class="updatePw-my">비밀번호 수정</a>
               <a onclick="userCheck()" class="updateUser-my">회원정보 수정</a>
               <a href="">후기 관리</a>
               <a href="MyReservation.jsp">예약 관리</a>
            </div>
         </div>
         <div class="stamp-my">
            <a class="Title-my" href="stamp.jsp">
               <h2>스탬프</h2> <i class="ri-arrow-right-s-line"></i>
            </a>
            <p><span class="Count-my">0</span>개</p>
            <img alt="stamp" src="../img/stamp.png" class="stampImg-my">
         </div>
         <div class="coupon-my">
            <a class="Title-my">
               <h2>무료배송 쿠폰</h2>
            </a>
            <p><span class="Count-my">0</span>개</p>
            <img alt="coupon" src="../img/coupon.png" class="couponImg-my">
         </div>
         
         <%
            if (vip == 0) {
         %>
         <div class="vip-my">
            <a class="Title-my">
               <h2>회원등급</h2>
            </a>
            <img alt="normal" src="../img/normal.png" class="vipImg-my">
            <p><span class="point-my">일반</span>회원</p>
         </div>
         <%
            } else {
         %>
         <div class="vip-my">
            <a class="Title-my">
               <h2>회원등급</h2>
            </a>
            <img alt="vip" src="../img/vip.png" class="vipImg-my">
            <p><span class="point-my">VIP</span>회원</p>
         </div>
         <%
            }
         %>
      </div>
   </div>
   <div class="container-my">
      <div class="couponBox-my">
         <h2 class="stampTitle-my">STAMP</h2>
         <div class="bubble-my">
         </div>
         <div class="bubbleMono-my">
            <%
               for(int i = 0; i < 5; i++) {
            %>
               <img alt="bubble_mono" src="../img/bubble_mono.png" class="bubbleImg-my">
            <%
               }
            %>
         </div>
      </div>
      
      <div class="banner-my">
         <img alt="banner" src="../img/banner.png" class="bannerImg-my">
      </div>
      
   </div>

   <script src="../js/myPage.js"></script>
</body>
</html>