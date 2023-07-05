<%@page import="user.UserBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp"></jsp:include>
<link rel="stylesheet" href="../css/userInfo.css">
	<%
		UserBean ubean = new UserBean();
		String uid = (String) session.getAttribute("uid");
		String upass = (String) session.getAttribute("upass");
		String uname = (String) session.getAttribute("uname");
		String img = (String) session.getAttribute("img");
		String uemail = (String) session.getAttribute("uemail");
		String tel = (String) session.getAttribute("tel");
		Integer postcode = (Integer) session.getAttribute("postcode");
		String addr = (String) session.getAttribute("addr");
		String detailaddr = (String) session.getAttribute("detailaddr");
		Integer level = (Integer) session.getAttribute("level");
		String gender = (String) session.getAttribute("gender");
		Integer birth = (Integer) session.getAttribute("birth");
	%>
	<div class="container-info">
		<h1 class="title-info">회원수정</h1>
		<form action="userInfoProc.jsp" method="post" class="userInfoForm">
			<div class="userImgBox-info">
				<img alt="userImg" src="../img/<%=img %>" name="img" class="userImg-info" id="imgFile">
				<a onclick="imgSelect()" class="imgBox-info" >
					<i class="ri-settings-3-fill"></i>
				</a>
			</div>
			
			<div class="select-info">
				<label class="selectName-info">아이디</label>
				<input type="text" class="selectVal-info readonly-info" value="<%= uid %>" name="uid" readonly/>
			</div>
			
			<div class="select-info">
				<label class="selectName-info">비밀번호</label>
				<input type="text" class="selectVal-info readonly-info" value="<%= upass %>" name="upass" readonly/>
			</div>
			
			<div class="select-info">
				<label class="selectName-info">이름</label>
				<input type="text" class="selectVal-info" value="<%= uname %>" placeholder="이름을 입력해주세요" name="uname"/>
			</div>
			
			<div class="select-info">
				<label class="selectName-info">이메일</label>
				<input type="email" class="selectVal-info" value="<%= uemail %>" placeholder="이메일형식으로 입력해주세요"  name="uemail"/>
			</div>
			
			<div class="select-info">
				<label class="selectName-info">휴대폰</label>
				<input type="text" class="selectVal-info" value="<%= tel %>" placeholder="숫자만 입력해주세요"  name="tel"/>
			</div>
			
			<div class="select-info">
				<label class="selectName-info">우편번호</label>
				<input type="number" class="selectVal-info readonly-info" value="<%= postcode %>" name="postcode" id="postcode" readonly/> 
                <button type="button" onclick="Postcode();" class="searchBtn-info"><i class="ri-search-line"></i> 찾기</button>
			</div>
			<input type="hidden" name="gender" value="<%= gender %>">
			<div class="select-info addr-info">
				<label class="selectName-info addrName-info">주소</label>
				<div class="selectValBox-info">
					<input type="text" class="selectVal-info readonly-info addrVal-info" value="<%= addr %>" name="addr" id="address" readonly />
					<input type="text" class="selectVal-info" value="<%= detailaddr %>" placeholder="상세주소를 입력해주세요" name="detailaddr" id="detailaddr"/>
				</div>
			</div>
			
			
			<div class="select-info">
				<label class="selectName-info">생년월일</label>
				<input type="text" class="selectVal-info" value="<%= birth %>" name="birth" maxlength="8" required />
			</div>
			
			<div class="submitBtnBox-info">
				<input type="submit" class="submitBtn-info" onsubmit='return userInfoProc()' value="수정하기" />
			</div>
		</form>
		<div class="cancleBox-info">
			<a href="myPage.jsp" class="cancle-info">취소</a>
		</div>
	</div>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<script src="../js/userInfo.js"></script>
	<jsp:include page="../include/footer.jsp" />
</body>
</html>