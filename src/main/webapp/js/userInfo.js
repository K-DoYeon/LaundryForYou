function fileName(){
	var preview = new FileReader();
        preview.onload = function (e) {
        // img id 값 
        document.getElementById("imgFile").src = e.target.result;
    };
    // input id 값 
    preview.readAsDataURL(document.getElementById("img").files[0]);
};

function Postcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var address = ''; // 주소 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    address = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    address = data.jibunAddress;
                }
                var extraRoadAddr = ""; //참고항목 
                //도로명에 동,로,가가 있는 경우 추가
                if(data.bname !== '' &&/[동|로|가]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
            }
            //건물명, 공동주택 추가
            if(data.bname !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== ''?','+data.buildingName : data.buildingName);
            }
                //표시할 참고항목이 있을 경우
                if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

                 // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = address;
                document.getElementById("address").value += extraRoadAddr;
                // 커서를 상세주소 필드로 이동한다.
                //document.getElementById("detailaddr").focus();
            }
        }).open();

}

function imgSelect(){
	const url = "imgSelect.jsp";
	const width=900, height=450;
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