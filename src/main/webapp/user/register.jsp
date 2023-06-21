<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../include/header.jsp"></jsp:include>
<link rel="stylesheet" href="../css/register.css">
	<div class="container-regi">
		<h1 class="title-regi">회원가입</h1>
	
		<form action="registerProc.jsp" method="post" name="registerFrom">
			<input type="hidden" name="img" value="default.png">
			<div class="select-regi">
				<label class="selectName-regi">아이디</label>
				<input type="text" class="selectVal-regi readonly-regi" onclick="idCheck();" name="uid"  maxlength="16" placeholder="아이디를 입력해주세요" required readonly/>
				<input type="button" value="중복확인" onclick="idCheck()" class="idCheck-regi">
			</div>
			
			<div class="select-regi">
				<label class="selectName-regi">비밀번호</label>
				<input type="password" name="upass" class="selectVal-regi" maxlength="16" placeholder="비밀번호를 입력해주세요" required />
			</div>
			
			<div class="select-regi">
				<label class="selectName-regi">비밀번호확인</label>
				<input type="password" name="upasscheck" class="selectVal-regi" maxlength="16" placeholder="비밀번호를 한번 더 입력해주세요" required />
			</div>
			
			<div class="select-regi">
				<label class="selectName-regi">이름</label>
				<input type="text" name="uname" class="selectVal-regi" placeholder="이름을 입력해주세요" required />
			</div>
			
			<div class="select-regi">
				<label class="selectName-regi">이메일</label>
				<input type="email" name="uemail" class="selectVal-regi" placeholder="이메일형식으로 입력해주세요" required />
			</div>
			
			<div class="select-regi">
				<label class="selectName-regi">휴대폰</label>
				<input type="text" name="tel" class="selectVal-regi" placeholder="숫자만 입력해주세요" required />
			</div>
			
			<div class="select-regi">
				<label class="selectName-regi">우편번호</label>
				<input type="number" name="postcode" class="selectVal-regi" id="postcode" readonly >
                <button type="button" onclick="Postcode();" class="searchBtn-regi"><i class="ri-search-line"></i> 찾기</button>
			</div>
			
			<div class="select-regi addr-regi">
				<label class="selectName-regi addrName-regi">주소</label>
				<div class="selectValBox-regi">
					<input type="text" name="addr" class="selectVal-regi addrVal-regi" id="address" readonly />
					<input type="text" name="detailaddr" class="selectVal-regi" id="detailaddr" placeholder="상세주소를 입력해주세요" required />
				</div>
			</div>
			
			<div class="select-regi">
				<label class="selectName-regi">성별</label>
				<input type="radio" name="gender" value="female"/> <span class="chVal-regi">여성</span>
				<input type="radio" name="gender" value="male"/> <span class="chVal-regi">남성</span>
				<input type="radio" name="gender" value="none"/> <span class="chVal-regi">선택안함</span>
			</div>
			
			<div class="select-regi formLine-regi">
				<label class="selectName-regi">생년월일</label>
				<input type="text" name="birth" placeholder="YYYYMMDD" class="selectVal-regi" required />
			</div>
			
			<div class="select-regi agreement-regi">
				<label class="selectName-regi">이용약관</label>
				<div class="agreementBox-regi">
					<div class="allCheck-regi">
						<input type="checkbox" id="allcheck-regi" value="allCheck"/>
						<span class="allCheck-regi">전체 동의합니다.</span>
					</div>
					<div class="checkGroup-regi">
						<input type="checkbox" class="checkVal-regi" value="check01"/>
						<span class="check-regi">개인정보 수집 * 이용동의 <span class="es-regi">(필수)</span></span>
					</div>
					<div class="checkGroup-regi">
						<input type="checkbox" class="checkVal-regi" value="check02"/>
						<span class="check-regi">만 14세 이상입니다. <span class="es-regi">(필수)</span></span>
					</div>
				</div>
			</div>
			<div class="submitBtnBox-regi">
				<input type="submit" class="submitBtn-regi" onsubmit='return registerProc()' value="가입하기" />
			</div>
		</form>
		
	</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="../js/idcheck.js"></script>
<script src="../js/register.js"></script>
</body>
</html>