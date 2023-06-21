//id 중복체크
function idCheck(){
	const url = "idCheckForm.jsp";
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

//아이디 중복확인 빈칸체크
function blankCheck(id){
			var uid=id.uid.value;
			uid=uid.trim();
			if(uid.length<4){
				alert("아이디는 4자 이상 입력해주세요.");
				return false;
			}//제대로 입력시에는 true 출력
			return true;
		}//blankCheck() 끝남
