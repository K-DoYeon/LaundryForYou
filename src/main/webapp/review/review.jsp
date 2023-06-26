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
<%
	String uid = null;
	if(session.getAttribute("uid") != null){
		uid = (String)session.getAttribute("uid");
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
                </tr>
 <%
  		}
 %>
                </tbody>
            </table>
      <%
      	if(uid == null){
      %>
     	<div>
     	 	<a onclick = "return confirm('로그인 후 이용하실 수 있습니다.')" href="../user/login.jsp" class="write-review">글쓰기</a>
      	</div>
      	
      <% }else{ %>
     	 <div>
            <a href="reviewWrite.jsp" class="write-review">글쓰기</a>
         </div>
      <% } %>
       
        </div>
    </div>

</section>
</body>
</html>