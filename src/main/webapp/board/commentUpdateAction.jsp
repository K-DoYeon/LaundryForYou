<%@page import="board.CommentBean"%>
<%@page import="board.BoardBean"%>
<%@page import="board.BoardDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="comment" class="board.CommentBean" scope="page"/>
<jsp:setProperty name="comment" property="content"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%   
BoardBean bean = new BoardBean();
BoardDAO bdao = new BoardDAO();

comment.setRef(Integer.parseInt(request.getParameter("ref")));
comment.setCommentid(Integer.parseInt(request.getParameter("commentid")));
comment.setContent(request.getParameter("content"));

int rs = bdao.update(comment.getRef(), comment.getCommentid(), comment.getContent());
if (rs == -1) {
   PrintWriter script = response.getWriter();
   script.println("<script>");
   script.println("alert('댓글 수정에 실패했습니다.');");
   script.println("history.back();");
   script.println("</script>");
   script.close();
} else {
  
   PrintWriter script = response.getWriter();
   script.println("<script>");
   script.println("location.href = \"qnaBoard.jsp?num=" + comment.getRef() + "\";");
   script.println("</script>");
   script.close();
}
   
%>

</body>
</html>