//id 찾기
function id_search() {
  var form = document.forms["idfindscreen"];

  if (form.uname.value.length < 1) {
    alert("이름을 입력해주세요.");
    return;
  }

  if (form.tel.value.length != 11) {
    alert("휴대폰 번호를 정확하게 입력해주세요.");
    return;
  }

  form.method = "post";
  form.action = "idFindResult.jsp";
  form.submit();
}


//id 찾기 popup
function idFind(){
	const url = "idFind.jsp";
	const width=500, height=300;
	let left = (document.body.offsetWidth / 2) - (width / 2);
	let top = 200;
	left += window.screenLeft;
	
	//새창 만들기
	window.open(
		url, 
		"idchk", 
		`width=${width}, 
		 height=${height}, 
		 left=${left}, 
		 top=${top}`);
}


//회원가입으로 이동
function join(){
	window.location.href = "register.jsp";
}






	
/******비밀번호 찾기******/
function pw_search(){
	var form = document.forms["pwfindscreen"];

  if (form.uid.value.length < 4) {
    alert("아이디를 입력해주세요.");
    return;
  }

  if (form.tel.value.length != 11) {
    alert("휴대폰 번호를 정확하게 입력해주세요.");
    return;
  }

  form.method = "post";
  form.action = "pwFindResult.jsp";
  form.submit();
}

//pw 찾기 popup	
function pwFind(){
	const url = "pwFind.jsp";
	const width=500, height=300;
	let left = (document.body.offsetWidth / 2) - (width / 2);
	let top = 200;
	left += window.screenLeft;
	
	//새창 만들기
	window.open(
		url, 
		"idchk", 
		`width=${width}, 
		 height=${height}, 
		 left=${left}, 
		 top=${top}`);
}


//찾은 아이디를 로그인창에 적용
function uidapply(uid){
		opener.document.loginform.uid.value=uid;
		window.close(); //창닫기
	}//apply function 종료
	
	
//찾은 비밀번호를 로그인창에 적용
function upassapply(upass){
		opener.document.loginform.upass.value=upass;
		window.close(); //창닫기
	}//apply function 종료
