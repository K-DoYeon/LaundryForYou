<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "review.ReviewBean, review.ReviewDAO, review.RCommentBean" %>
<%@ page import = "java.io.*, java.util.*" %>
<%
    request.setCharacterEncoding("UTF-8");
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	int num = Integer.parseInt(request.getParameter("num"));
	int ref = Integer.parseInt(request.getParameter("ref"));
	int replyAvailable = Integer.parseInt(request.getParameter("replyAvailable"));


	ReviewDAO dao = new ReviewDAO();
	ReviewBean bean = dao.getOneReview(num);
	RCommentBean rbean = new RCommentBean();
%>

<div class="card mb-2">
	<div class="card-header bg-light">
	        <i class="fa fa-comment fa"></i> COMMENT
	</div>
	<form method = "post" action = "reviewReCommentProc.jsp" name = "form" id = "form">
	<input type ="hidden" name = "ref" value="#">>
	<div class="card-body">
		<ul class="list-group list-group-flush">
		    <li class="list-group-item">
	<textarea class="form-control" name="replyContent" rows="3" placeholder = "댓글을 입력해주세요"></textarea>
		

			<div class ="choi-qna">
				<button type="submit" class="btn btn-sm choi-qna-btn mt-2" >
				<a onclick = "return confirm('로그인 후 이용하실 수 있습니다.')" href="../user/login.jsp">등록</a></button>
		    </div>

			<div class ="choi-qna">
				<button type="submit" class="btn btn-sm choi-qna-btn mt-2" id="btnSave" value="등록" >등록</button>
		    </div>
		
		    </li>
		</ul>
	</div>
  </form>
  </div>
  
	<table class="table table-striped"
		style="text-align: center; border: 1px solid #dddddd;">
	<thead>
			<tr>
				<th colspan="3" style="background-color: #eeeeeee; text-align: center;">댓글</th>
			</tr>
			<thead>
						
			<%
				
				ArrayList<RCommentBean> list = dao.getList(bean.getNum());
				for(int i = 0; i<list.size(); i++){
				
			%>
				
		</thead>
		
		
			<tbody>
				<tr>
					<td style="text-align: left;"><%=list.get(i).getUid() %></td>  
					<td style = "text-align : center;"><%= list.get(i).getReplyContent() %></td>
					<td style = "text-align: right;"><%=list.get(i).getWdate().substring(0,11) %>
					
					<a onclick = "return confirm('정말로 삭제하시겠습니까?')" href="reviewCommentDelete.jsp?num=<%=bean.getNum()%>&bbsId=<%=list.get(i).getBbsId() %>" class="btn-del">삭제</a>
					</td>
					
				<% } %>
				</tr>
				
			</tbody>
	</table>				
			

	<jsp:include page="../include/footer.jsp" />
</body>
</html>