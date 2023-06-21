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


comment.setCommentid(Integer.parseInt(request.getParameter("commentid")));

int rs = bdao.delete(comment.getCommentid());
if (rs == -1) {
   PrintWriter script = response.getWriter();
   script.println("<script>");
   script.println("alert('댓글삭제에 실패했습니다.');");
   script.println("history.back();");
   script.println("</script>");
   script.close();
} else {
  
   PrintWriter script = response.getWriter();
   script.println("<script>");
   script.println("location.href=document.referrer;");
   script.println("</script>");
   script.close();
}
   
%>

</body>
</html>