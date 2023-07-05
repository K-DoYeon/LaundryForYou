<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Vector"%>
<%@page import="board.BoardDAO"%>
<%@page import="board.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

 <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css"
      integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog=="
      crossorigin="anonymous"
    />
<link rel="stylesheet" href="../css/boardlist.css">
</head>
<jsp:include page="../include/header.jsp"></jsp:include>
<body>
<%
	BoardDAO bdao = new BoardDAO();
	Vector<BoardBean> vec = bdao.getAllBoard();
	
	int cnt = bdao.getBoardCount();
	
	int pageSize = 5;
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum = "1";
	}
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1) * pageSize + 1;
	int endRow = currentPage * pageSize;
	
	System.out.println(bdao.getBoardCount());
	
	ArrayList<BoardBean> boardlist = null;
	
	if(cnt != 0){
		boardlist = bdao.getBoardList(startRow, pageSize);
	}
%>

<div class="do-list-title">
	<h1>게시판</h1>
</div>
<%
	String uid = null;
	if(session.getAttribute("uid") != null){
	uid = (String)session.getAttribute("uid");
		}
%>
<div class="top-tab">
	<ul class="tab">
		<a href="#" id="tab-QA" class="active n" data-idx="#QA"><li>Q&A</li></a>
		<a href="#" class="n" data-idx ="#notice"><li>FAQ</li></a>
	</ul>
</div>

	<div class="do-container">
    <div class="faq-container">
	
	<div class="do-search active">
		<form name=form action="boardSearchList.jsp" method="post">
			<div class="srch">
				<select class="select-no" name="searchField">
					<option value=subject>제목</option>
					<option value=content>내용</option>
					<option value=writer>작성자</option>
				</select>
				<input onmouseover="this.focus()" type="search" id="srch-no" placeholder="검색어를 입력하세요" class="srch_btn" name="searchText">
				<div onclick="srchDataCheck()">
	                검색	           	
	            </div>
				
			</div>
		</form>
	</div>
  
<% 
	for(int i = 0; i < boardlist.size(); i++){
		BoardBean bean = boardlist.get(i);
%>
<%
String wdateStr = bean.getWdate();

SimpleDateFormat sdfInput = new SimpleDateFormat("yyyy-MM-dd"); // 현재 형식
Date wdate = sdfInput.parse(wdateStr); // 문자열을 Date 객체로 변환

SimpleDateFormat sdfOutput = new SimpleDateFormat("yyyy.MM"); // 변경하고자 하는 형식
String formattedWdate = sdfOutput.format(wdate); // 변경된 형식으로 날짜를 문자열로 변환

SimpleDateFormat sdfBigOutput = new SimpleDateFormat("dd"); // 변경하고자 하는 형식 ("dd")
String formattedBigWdate = sdfBigOutput.format(wdate); // 변경된 형식으로 날짜를 문자열로 변환

%>
 	<div class="active" id="QA">
      <div class="faq">
      	<div class="do-title">
	      	<div class="do-day">
	      		<span class="big"><%=formattedBigWdate%></span>
	      		<span><%=formattedWdate%></span>
	      	</div>
	      	<div><h3 class="faq-title"><%=bean.getSubject() %></h3></div>
      	</div>
		
<% if(uid == null) { %>		
		<div>
        	<p class="faq-text"><%=bean.getContent() %></p>
			<p class="faq-plus"><a href="#" onclick = "loginalert();">더보기..</a></p>
		</div>
<% }else{ %>
		<div>
        	<p class="faq-text"><%=bean.getContent() %></p>
			<p class="faq-plus"><a href="qnaBoard.jsp?num=<%=bean.getNum()%>">더보기..</a></p>
		</div>
<% } %>
        <button class="faq-toggle">
          <i class="fas fa-chevron-down"></i>
          <i class="fas fa-times"></i>
        </button>
	   </div>
	</div>
	
<%
	}
%>	

<%
	if(cnt != 0){
		int pageCount = cnt / pageSize + (cnt % pageSize == 0? 0:1);
		int pageBlock = 5;
		int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		if(endPage > pageCount){
			endPage = pageCount;
		}
%>
	<div class="page txt-align active">
		<div class="btn">
		<%
			if(startPage > pageBlock){
		%>
			<a href="boardlist.jsp?pageNum=<%= startPage - pageBlock %>">
				<span class="prv"><i class="fa-solid fa-angle-left"></i></span>
			</a>
		<%
			}
		%>
			<div class="number">
		<%
			for(int i = startPage; i <= endPage; i++){
		%>
			<a class="number" href="boardlist.jsp?pageNum=<%= i %>"><span><%= i %></span></a>
		<%
			}
		%>
		</div>
		<%
			if(endPage < pageCount){
		%>
			<a href="boardlist.jsp?pageNum=<%= startPage + pageBlock %>">
				<span class="nxt"><i class="fa-solid fa-angle-right"></i></span>
			</a>
		<%
			}
		%>
	</div>
	</div>
<%
	}
%>
<% if(uid == null) { %>
<div class="write-button active">
	<button onclick="loginalert();">글쓰기</button>
</div>
<% }else{ %>
<div class="write-button active">
	<button onclick="location.href='qnaWrite.jsp'">글쓰기</button>
</div>
<%  } %>	

	<div id="notice">
      <div class="faq">
      	<div class="do-title-a">
	      	<div class="do-day-a">
	      		<span class="Question">Q</span>
	      	</div>
	      	<div><h3 class="faq-title-a">세탁물을 배송하기 위해 어떻게 주문해야 하나요?</h3></div>
      	</div>
		
		<div class="faq-answer">
			<div class="do-ans">
				<div class="do-day-b">
			      	<span class="Question">A</span>
			    </div>
		        <div class="ans-item">
		        	<ul>
		        		<li>세탁의 당신 웹사이트를 방문하여 주문 하실 수 있습니다.</li>
		        		<li>예약페이지를 통해 주문 양식이 제공되며, 필요한 세탁물의 종류와 수량, 주소 등을 입력 후 제출 해 주세요.</li>
		        	</ul>
		        </div>
			</div>
		</div>
		
        <button class="faq-toggle">
          <i class="fas fa-chevron-down"></i>
          <i class="fas fa-times"></i>
        </button>
	   </div>
	  
	    <div class="faq">
      	<div class="do-title-a">
	      	<div class="do-day-a">
	      		<span class="Question">Q</span>
	      	</div>
	      	<div><h3 class="faq-title-a">세탁물을 배송하는데 얼마나 걸리나요?</h3></div>
      	</div>
		
		<div class="faq-answer">
			<div class="do-ans">
				<div class="do-day-b">
			      	<span class="Question">A</span>
			    </div>
		        <div class="ans-item">
		        	<ul>
		        		<li>배송 시간은 고객님의 거주 위치에 따라 다를 수 있습니다.</li>
		        		<li>보통은 제품 수거 후 1~2일 안으로 받아보실 수 있으며,</li>
		        		<li>주문 폭주, 천재지변으로 인한 배송 지연은 미리 안내문자를 통해 고지되며 최대 1주 정도 지연 될 수 있습니다.</li>
		        	</ul>
		        </div>
			</div>
		</div>
		
        <button class="faq-toggle">
          <i class="fas fa-chevron-down"></i>
          <i class="fas fa-times"></i>
        </button>
	   </div>
	   
	    <div class="faq">
      	<div class="do-title-a">
	      	<div class="do-day-a">
	      		<span class="Question">Q</span>
	      	</div>
	      	<div><h3 class="faq-title-a">세탁물을 어떻게 포장해야 하나요?</h3></div>
      	</div>
		
		<div class="faq-answer">
			<div class="do-ans">
				<div class="do-day-b">
			      	<span class="Question">A</span>
			    </div>
		        <div class="ans-item">
		        	<ul>
		        		<li>세탁의 당신에서 제공 된 박스가방에 세탁물을 넣고 신청하신 수거날짜에 맞춰 지정된 장소에 놓아주시면<br>
		        		 업체의 택배기사가 신속하게 수거해갑니다.</li>
		        		
		        	</ul>
		        </div>
			</div>
		</div>
		
        <button class="faq-toggle">
          <i class="fas fa-chevron-down"></i>
          <i class="fas fa-times"></i>
        </button>
	   </div>
	   
	    <div class="faq">
      	<div class="do-title-a">
	      	<div class="do-day-a">
	      		<span class="Question">Q</span>
	      	</div>
	      	<div><h3 class="faq-title-a">세탁 배송 업체는 어떤 종류의 세탁물을 다루나요?</h3></div>
      	</div>
		
		<div class="faq-answer">
			<div class="do-ans">
				<div class="do-day-b">
			      	<span class="Question">A</span>
			    </div>
		        <div class="ans-item">
		        	<ul>
		        		<li>세탁의 당신은 의류, 침구류, 수건, 커튼 등 다양한 종류의 세탁물을 다룹니다. </li>
		        		<li>자세한 사항은 웹사이트를 통해 세부 정보를 확인해 주세요.</li>
		        	</ul>
		        </div>
			</div>
		</div>
		
        <button class="faq-toggle">
          <i class="fas fa-chevron-down"></i>
          <i class="fas fa-times"></i>
        </button>
	   </div>
	   
	    <div class="faq">
      	<div class="do-title-a">
	      	<div class="do-day-a">
	      		<span class="Question">Q</span>
	      	</div>
	      	<div><h3 class="faq-title-a">세탁 배송 업체는 어떤 지역에 서비스를 제공하나요?</h3></div>
      	</div>
		
		<div class="faq-answer">
			<div class="do-ans">
				<div class="do-day-b">
			      	<span class="Question">A</span>
			    </div>
		        <div class="ans-item">
		        	<ul>
		        		<li>세탁의 당신은 고객님의 거주 지역에 따라 서비스 제공이 다를 수 있습니다.</li>
		        		<li>웹사이트에서 서비스 가능한 지역을 확인해주세요.</li>
		        	</ul>
		        </div>
			</div>
		</div>
		
        <button class="faq-toggle">
          <i class="fas fa-chevron-down"></i>
          <i class="fas fa-times"></i>
        </button>
	   </div>
	   
	</div>
	
	
 </div>
</div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="../js/boardlist.js"></script>

</body>
</html>

<jsp:include page="../include/footer.jsp"></jsp:include>