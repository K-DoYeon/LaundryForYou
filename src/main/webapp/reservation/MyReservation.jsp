<%@page import="user.UserBean"%>
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, reservation.ReservationDAO, reservation.ReservationBean " %>    

<jsp:useBean id="bean" class="reservation.ReservationBean" scope="page" />
<jsp:useBean id="rdao" class="reservation.ReservationDAO" scope="page" />
<%!
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
   
   String userId = (String) session.getAttribute("uid");
   Vector<ReservationBean> data = rdao.getSelectByUser(userId, limitNum, listNum);
   
   int maxColumn = rdao.getSelectCountByUser(userId);
   int size = data.size();
   
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
	      out.println("<script>alert('예약이 취소되었습니다.'); location.href='MyReservation.jsp';</script>");
	   } else {
	      out.println("<script>alert('예약 취소에 실패했습니다.');</script>");
	   }
	}

%>   

<link rel="stylesheet" href="../css/bootstrap.css" />
<style>
	input[type=text],input[type=number] {
		border: 0;
		outline: none;
		width: 100px;
	}
	
	td {
		width: 100px;
	}
	
	a {
		
	}
</style>
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="container lmember">
   <h1 class="mt-3 mb-3 text-center">예약목록</h1>
   <div class="text-end">
      총 예약 : <%=maxColumn %>건
   </div>
   <div class="row">
   

      <table class="table  memberstbl">
         <thead>
            <tr>
               <th>예약번호</th>
               <th>생활빨래</th>
               <th>이불빨래</th>
               <th>셔츠</th>
               <th>드라이</th>
               <th>개별빨래</th>
               <th>총 가격</th>
               <th>상세보기</th>
               <th>결제 상태</th>
               <th>결제</th>
               <th>예약취소</th>
            </tr>
         </thead>
         <tbody>
         

<%
for(int i=0; i < size; i++){
    ReservationBean rbean = data.elementAt(i);
    int num = rbean.getNum();
    String uid = rbean.getUid();
    String tel = rbean.getTel();
    int postcode = rbean.getPostcode();
    String addr = rbean.getAddr();
    String detailaddr = rbean.getDetailaddr();
    int daily = rbean.getDaily();
    int blanket = rbean.getBlanket();
    int shirt = rbean.getShirt();
    int dry = rbean.getDry();
    int care = rbean.getCare();
    int totalprice = rbean.getTotalprice();
    int condition = rbean.getCondition();
 
%>

   <tr>
 	<form action="paymentProc.jsp" method="post"> 
   	  <td>
 
      	 <input type="text" name="num" value="<%=num %>" readonly/>

      </td>
      <td><input type="text" name="daily" value="<%=daily %>개" readonly /> </td>
      <td><input type="text" name="blanket" value="<%=blanket %>개" readonly/> </td>
      <td><input type="text" name="shirt" value="<%=shirt %>개" readonly/> </td>
      <td><input type="text" name="dry" value="<%=dry %>개" readonly/> </td>
      <td><input type="text" name="care" value="<%=care %>개" readonly/> </td>
      <td><input type="text" name="totalprice" value="<%=totalprice %>원" readonly/> </td>

        <td><button type="button" class="btn btn-outline-secondary btn-sm" onclick="location.href='DetailReservation.jsp?num=<%=num %>'">상세보기</button></td>
      <td>
      <%
      	if (condition == 1) {
      %>
      	<p>결제완료</p>
      <%
      	} else {
      %>
      	<p>결제대기</p>
      <%
      	}
      %>
      </td>
      <td><button type="submit" class="btn btn-outline-secondary btn-sm">결제하기</button></td>
 </form>
      
	<td>
      	<form method="post" action="">
         <input type="hidden" name="delete" value="<%=num %>">
         <button type="submit" class="btn btn-outline-danger btn-sm">예약취소</button>
      	</form>
      </td>
      
      
   </tr>

   
<%
}
%>

         </tbody>
         
 </table>
 

   </div> <!-- /row -->
   <div class="mt-3 mb-5 row ">
      <ul class="pagination justify-content-center mb-5">
         <%
            //이전페이지
            if (startNum > 1)  {
               int prevPage = startNum -1;
               out.print("<li class=\"page-item\"><a class=\"page-link\" href=\"?fname=member/memberlist&page="+prevPage+"\">이전</a></li>");
            } else {
               out.print("<li class=\"page-item\"><a class=\"page-link text-muted\" href=\"javascript:void(0)\">이전</a></li>");
            }
         
            //페이지 출력
            for(int i = startNum; i <= endNum; i++) {
               String act = "";
               if (mypg == i) act = "active";
            
         %>
            <li class="page-item <%=act %>"> <a href="?user/memberlist&page=<%=i %>" class="page-link"><%=i %></a></li>
         <%
            }
            // 다음페이지
            if (endNum < totalPage) {
               int nextPage = endNum + 1;
               out.print("<li class=\"page-item\"><a class=\"page-link\" href=\"?fname=member/memberlist&page="+nextPage+"\">다음</a></li>");
            } else {
               out.print("<li class=\"page-item\"><a class=\"page-link text-muted\" href=\"javascript:void(0)\">다음</a></li>");
            }
         %>
      </ul>
   </div>
</div>

<script src="../js/memberlist.js"></script>

<jsp:include page="../include/footer.jsp"></jsp:include>