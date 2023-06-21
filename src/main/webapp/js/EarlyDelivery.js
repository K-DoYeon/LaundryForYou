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


function Modal(content) {
  var modal = document.getElementById('myModal');
  var modalContent = document.getElementById('modal-content');
  var closeBtn = document.getElementById('modal-close-btn');

  modal.style.display = "block";
  modalContent.textContent = content;
  

  closeBtn.onclick = function() {
    modal.style.display = "none";
  }

  window.onclick = function(event) {
    if (event.target == modal) {
      modal.style.display = "none";
    }
  }
}


  function checkAddress(event) {
        event.preventDefault(); // 폼의 기본 제출 동작을 막음

        var addressInput = document.getElementById('address');
        var addressValue = addressInput.value;

         // 주소 값이 없는지 확인
    	if (addressValue.trim() === '') {
        	alert("주소를 입력해주세요!");
    	} else if (addressValue.includes("서울")) {
	        // 팝업 창을 띄움
	        Modal("해당 주소는 반짝배송⚡ 지역입니다");
	    } else {
	        Modal("해당 주소는 일반배송🚛 지역입니다");
	    }
		
	
    }