$('.submitBtn-upPw').on('click', function updatePwProc() {
	var newpass = document.getElementById("newpass").value;
  	var newpasscheck = document.getElementById("newpasscheck").value;

  	if (newpass != newpasscheck) {
	    alert("패스워드가 일치하지 않습니다.");
	    return false;
 	 }

 	 return;
});