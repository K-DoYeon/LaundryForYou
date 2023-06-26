<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="review.ReviewBean,review.ReviewDAO, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기</title>
</head>
<jsp:include page="../include/header.jsp"></jsp:include>
<link rel="stylesheet" href="../css/review.css">
<body>
<%
	//전체 게시물의 내용을 jsp 쪽으로 가져와야함
	ReviewDAO rdao = new ReviewDAO();
	
	// 전체 게시글을 리턴 받아주는 소스
	Vector<ReviewBean> vec = rdao.getAllBoard();
	
	ArrayList<ReviewBean> reviewlist = null;
	int cnt = rdao.getReviewCount();
	
	int pageSize = 10;   // 한 페이지당 10개씩
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum = "1";
	}
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1) * pageSize + 1;
	int endRow = currentPage * pageSize;
	if(cnt != 0){
		reviewlist = rdao.getReviewList(startRow, pageSize);
	}
%>
<section class="notice">
  <div class="page-title">
        <div class="container">
            <h3>후기게시판</h3>
        </div>
    </div>

    <!-- board seach area -->
    <div id="board-search">
        <div class="container">
            <div class="search-window">
                <form action="">
                    <div class="search-wrap">
                        <label for="search" class="blind">내용 검색</label>
                        <input id="search" type="search" name="" placeholder="검색어를 입력해주세요." value="">
                        <button type="submit" class="btn btn-dark">검색</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
   
  <!-- board list area -->

    <div id="board-list">
        <div class="container">
            <table class="board-table">
                <thead>
                <tr>
                    <th scope="col" class="th-num">번호</th>
                    <th scope="col" class="th-title">제목</th>
                    <th scope="col" class="th-date">등록일</th>
                    <th scope="col" class="th-date">추천 수</th>
                </tr>
                </thead>
                <tbody>
  <%
  		for (int i = 0; i < reviewlist.size(); i++) {
		ReviewBean bean = reviewlist.get(i); // 백터에 저장되어있는 빈클래스를 하나씩 추출
  %>
                <tr>
                    <td><%=bean.getNum() %></td>
                    <th><a href="reviewInfo.jsp?num=<%=bean.getNum()%>"><%=bean.getSubject() %></a></th>
                    <td><%=bean.getWdate() %></td>
                    <td><%=bean.getLike_this() %></td>
                </tr>
 <%
  		}
 %>
                </tbody>
            </table>
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
			<a href="review.jsp?pageNum=<%= startPage - pageBlock %>">
				<span class="prv"><i class="fa-solid fa-angle-left"></i></span>
			</a>
		<%
			}
		%>
			<div class="number">
		<%
			for(int i = startPage; i <= endPage; i++){
		%>
			<a class="number" href="review.jsp?pageNum=<%= i %>"><span><%= i %></span></a>
		<%
			}
		%>
		</div>
		<%
			if(endPage < pageCount){
		%>
			<a href="review.jsp?pageNum=<%= startPage + pageBlock %>">
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
            <a href="reviewWrite.jsp" class="write-review">글쓰기</a>
        </div>
    </div>

</section>
</body>
</html>