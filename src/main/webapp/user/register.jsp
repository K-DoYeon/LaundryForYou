<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../include/header.jsp"></jsp:include>
<link rel="stylesheet" href="../css/register.css">
	<div class="container-regi">
		<h1 class="title-regi">회원가입</h1>
	
		<form action="registerProc.jsp" method="post" name="registerFrom" onsubmit="return validateForm()">
			<input type="hidden" name="img" value="default.png">
			<div class="select-regi">
				<label class="selectName-regi">아이디</label>
				<input type="text" class="selectVal-regi readonly-regi" onclick="idCheck();" name="uid"  maxlength="16" placeholder="아이디를 입력해주세요" pattern="[a-z0-9]{4,16}" title="영어 소문자 또는 숫자로 4~16자" required readonly/>
				<input type="button" value="중복확인" onclick="idCheck()" class="idCheck-regi">
			</div>
			
			<div class="select-regi">
				<label class="selectName-regi">비밀번호</label>
				<input type="password" name="upass" id="password" class="selectVal-regi" maxlength="16" placeholder="영어 대소문자, 숫자로 된 8~16자리" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[A-Za-z\d]{8,16}$" title="영어 대소문자, 숫자로 된 8~16자리" required />
			</div>
			
			<div class="select-regi">
				<label class="selectName-regi">비밀번호확인</label>
				<input type="password" name="upasscheck" id="upassch" class="selectVal-regi" maxlength="16" placeholder="비밀번호를 한번 더 입력해주세요" required  />
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
				<input type="text" name="tel" class="selectVal-regi" placeholder="숫자만 입력해주세요" pattern="\d{11}" title="숫자로 이루어진 11자리" required />
			</div>
			
			<div class="select-regi">
				<label class="selectName-regi">우편번호</label>
				<input type="number" name="postcode" class="selectVal-regi" id="postcode" readonly >
                <button type="button" onclick="Postcode();" class="searchBtn-regi"><i class="ri-search-line"></i> 찾기</button>
			</div>
			
			<div class="select-regi addr-regi">
				<label class="selectName-regi addrName-regi">주소</label>
				<div class="selectValBox-regi">
					<input onclick="Postcode();" type="text" name="addr" class="selectVal-regi addrVal-regi" id="address" placeholder="우편번호 찾기를 통해 작성해주세요" required/>
					<input type="text" name="detailaddr" class="selectVal-regi" id="detailaddr" placeholder="상세주소를 입력해주세요" required />
				</div>
			</div>
			
			<div class="select-regi">
				<label class="selectName-regi">성별</label>
				<input type="radio" name="gender" value="female" required/> <span class="chVal-regi">여성</span>
				<input type="radio" name="gender" value="male" required/> <span class="chVal-regi">남성</span>
				<input type="radio" name="gender" value="none" required/> <span class="chVal-regi">선택안함</span>
			</div>
			
			<div class="select-regi formLine-regi">
				<label class="selectName-regi">생년월일</label>
				<input type="text" name="birth" placeholder="YYYYMMDD" class="selectVal-regi" pattern="\d{4}(0[1-9]|1[0-2])(0[1-9]|[12]\d|3[01])" title="올바른 생년월일 형식 (YYYYMMDD)" required />
			</div>
			
			<div class="select-regi agreement-regi">
				<label class="selectName-regi">이용약관</label>
				<div class="agreementBox-regi">
					<div class="allCheck-regi">
						<input type="checkbox" id="allcheck-regi" value="allCheck" required/>
						<span class="allCheck-regi">전체 동의합니다.</span>
					</div>
					<div class="checkGroup-regi">
						<input type="checkbox" class="checkVal-regi" value="check01" required/>
						<span class="check-regi">개인정보 수집 * 이용동의 <span class="es-regi">(필수)</span></span>
					</div>
					<div class="checkGroup-regi">
						<input type="checkbox" class="checkVal-regi" value="check02" required/>
						<span class="check-regi">이 정보는 포트폴리오용으로 사용되지 않습니다.(필수)</span></span>
					</div>
				</div>
			</div>
			<div class="submitBtnBox-regi">
				<input type="submit" class="submitBtn-regi" value="가입하기" onclick="checkPasswordMatch()"/>
			</div>
		</form>
		
	</div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="../js/idcheck.js"></script>
<script src="../js/register.js"></script>
<jsp:include page="../include/footer.jsp" />
</body>
</html>