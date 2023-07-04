<%@page import="user.UserBean"%>
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, user.UserDAO " %>

<jsp:useBean id="bean" class="user.UserBean" scope="page" />
<jsp:useBean id="udao" class="user.UserDAO" scope="page" />
<style>
	.gnb-header, .welcome-header{
		margin: 0;
	}
</style>
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
	
   Vector data = udao.getSelect(limitNum, listNum);
   
	int maxColumn = udao.getAllSelect();
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

%>   

<link rel="stylesheet" href="../css/bootstrap.css" />
<jsp:include page="../include/header.jsp"></jsp:include>
<div class="container lmember">
	<h1 class="mt-3 mb-3 text-center">회원목록</h1>
	<div class="text-end">
		총 회원 : <%=maxColumn %>명
	</div>
	<div class="row">
		<table class="table  memberstbl">
			<thead>
				<tr>
					<th>번호</th>
					<th>아이디</th>
					<th>이름</th>
					<th>주소</th>
					<th>전화번호</th>
					<th>이메일</th>
					<th>회원등급</th>
					<th>회원지역</th>
				</tr>
			</thead>
			<tbody>
<%
for(int i=0; i < size; i++){
    UserBean ubean = (UserBean) data.elementAt(i);
    int num = ubean.getNum();
    String userid = ubean.getUid();
    String username = ubean.getUname();
    int postcode = ubean.getPostcode();
    String addr = ubean.getAddr();
    String detailAddr = ubean.getDetailaddr();
    String tel = ubean.getTel();
    String email = ubean.getUemail();
    int level = ubean.getLevel();
    int vip = ubean.getVip();
 
%>
	<tr>
		<td><%=num %></td>
		<td><%=userid %></td>
		<td><%=username %></td>
		<td>[<%=postcode %>] <%=addr %> <%=detailAddr %></td>
		<td><%=tel %></td>
		<td><%=email %></td>
		<td>
			<%
				if (level == 99) {
			%>
			
			<span class="badge bg-primary px-4 py-2">관리자</span>
			
			<%
				} else {	
			
				String selected1 = "", selected2 = "", selected3 = "", selected4 = "", selected5 = "";
				switch (vip) {
				case 0:
					selected1 = "selected";
					break;
				case 1:
					selected2 = "selected";
					break;

				}
				
			%>
			<select name="vip" class="vip" onchange="memLevel(this, <%=vip %>, <%=num %>);">
				<option value="0" <%=selected1 %> >일반회원</option>
				<option value="1" <%=selected2 %> >VIP회원</option>
			</select>
			<%
				 
				
				}
			%>
		</td>
		
		
		
		
		
		<td>
			<%
				if (level == 99) {
			%>
			
			<span class="badge bg-primary px-4 py-2">관리자</span>
			
			<%
				} else {	
			
				String selected1 = "", selected2 = "", selected3 = "", selected4 = "", selected5 = "";
				switch (level) {
				case 0:
					selected1 = "selected";
					break;
				case 1:
					selected2 = "selected";
					break;
				case 99:
					selected3 = "selected";
				
				}
			%>
			<select name="level" class="level" onchange="memAddr(this, <%=level %>, <%=num %>);">
				<option value="0" <%=selected1 %> >타지역</option>
				<option value="1" <%=selected2 %> >서울지역</option>
				<option value="99" <%=selected3 %> >관리자</option>
			</select>
			<%
				  
				}
			%> 
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