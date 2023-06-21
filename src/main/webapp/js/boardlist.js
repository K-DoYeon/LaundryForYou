$(function(){
    //tab
    $('.tab a').click(function(e){
        e.preventDefault(); //a태그의 기능을 없애는, a태그를 누르면 위로 올라가기떄문에
        $('.tab a').removeClass('active'); //탭의 모든 active를 지운다.
        $(this).addClass('active'); //누른 탭에 active를 추가한다.
        const myid = $(this).data("idx"); //누른 탭에 data-idx값을 가져온다.
        $('.faq-container>div').removeClass('active'); //tab-content의 모든 active를 지운다.
        $(myid).addClass('active'); // 가져온 data-idx 값과 같은 tab-content값에 active를 추가한다.
    });
    
    $('#tab-QA').click(function(e){
		e.preventDefault();
		location.reload();
	});
	
	$('#tab-bbs').click(function(e){
		e.preventDefault();
		location.reload();
	});
});

const toggles = document.querySelectorAll(".faq-toggle");

toggles.forEach((toggle) => {
  toggle.addEventListener("click", () => {
    toggle.parentNode.classList.toggle("active");
  });
});

function srchDataCheck() {
	if( document.getElementById("srch-no").value == "" ){
	  	alert("검색할 단어를 입력하세요");
	  	history.back();
		document.getElementById("srch-no").focus();
		return false;
	}
	document.form.submit();
	
}

function dodel(){
	const url = "boarddelete.jsp";
	const width=500, height=350;
	let left = (document.body.offsetWidth / 2) - (width / 1.5);
	let top = (document.body.offsetHeight / 2) - (height);
	left += window.screenLeft;
	
	window.open(
		url, 
		"popup", 
		`width=${width}, 
		 height=${height}, 
		 left=${left}, 
		 top=${top}`
    );
}

function choimod(){
	const url = "boardModify.jsp";
	const width=500, height=350;
	let left = (document.body.offsetWidth / 2) - (width / 1.5);
	let top = (document.body.offsetHeight / 2) - (height);
	left += window.screenLeft;
	
	window.open(
		url, 
		"popup", 
		`width=${width}, 
		 height=${height}, 
		 left=${left}, 
		 top=${top}`
    );
}

function windowClose(){
	window.close();
}

function emulAcceptCharset(form) {
    if (form.canHaveHTML) { // detect IE
        document.charset = form.acceptCharset;
    }
    return true;
}

function loginalert(){
	alert("회원 전용 입니다. 로그인 해주세요!");
	location.href='../user/login.jsp';
}