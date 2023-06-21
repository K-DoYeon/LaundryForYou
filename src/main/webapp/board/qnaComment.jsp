<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" 
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" 
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" 
	crossorigin="anonymous" />
</head>
<style>
@font-face {
    font-family: 'IM_Hyemin-Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2106@1.1/IM_Hyemin-Bold.woff2') format('woff');
    font-weight: normal;
    font-style: normal;
}
body {
  padding-top: 70px;
  padding-bottom: 30px;
  font-family: 'IM_Hyemin-Bold';
}
.qna{
	text-align : right;
}
.qna-btn{
	background-color : #58A3BC;
	color : #fff;
}
.qna-btn:hover{
	background-color : #3E83A8;
	color : #fff;
}

</style>
<body>
<div class="container">
    <form id="commentForm" name="commentForm" method="post">
    <br><br>
        <div>
            <div>
                <span><strong>Comments</strong></span> <span id="cCnt"></span>
            </div>
            <div>
                <table class="table">                    
                    <tr>
                        <td>
                            <textarea style="width: 930px" rows="3" cols="30" placeholder="댓글을 입력하세요"></textarea>
                            <br>
                            <div class = "qna">
                                <a href='#' class="btn qna-btn">등록</a>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <input type="hidden"  />        
    </form>
</div>
<div class="container">
    <form id="comment" name="comment" method="post">
        <div id="commentList">
        </div>
    </form>
</div>
</body>
</html>