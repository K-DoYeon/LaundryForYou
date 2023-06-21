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



$('#allcheck-regi').on('click', function(){
	var checked = $(this).is(':checked');
    
    if(checked) {
    	$(this).closest('.agreementBox-regi').find('.checkVal-regi').prop('checked', true);
    } else {
    	$(this).closest('.agreementBox-regi').find('.checkVal-regi').prop('checked', false);
    }
});
$('.agreementBox-regi .checkVal-regi').on('click', function(){
	var chkGroup = $(this).closest('.agreementBox-regi').find('.checkGroup-regi');
	var chkGroup_cnt = chkGroup.length;
    checked_cnt = $('.checkGroup-regi .checkVal-regi:checked').length;
    
    if (checked_cnt < chkGroup_cnt) {
    	$('#allcheck-regi').prop('checked', false);
    } else if (checked_cnt == chkGroup_cnt) {
   		$('#allcheck-regi').prop('checked', true);
    }
});

$('.submitBtnBox-regi').on('click', function registerProc() {
	if($('#allcheck-regi').is(":checked") == false){
		alert("동의버튼을 눌러주세요.");
		return false;
	}else if($('#allcheck-regi').is(":checked") == true){
		return;
	}
});
