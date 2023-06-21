$('."userSearchBtn-userch"').on('click', function userSearch() {
	var upassch = document.getElementById("upassch").value;
	var upass = '<%=(String)session.getAttribute("upass")%>';
  	if (upassch != upass) {
	    alert("패스워드가 일치하지 않습니다.");
	    return false;
 	 }
 	 return;
});