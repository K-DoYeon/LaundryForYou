//비밀번호 확인 popup
function userCheck(){
	const url = "userCheck.jsp";
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
		 top=${top}`
	);
}

