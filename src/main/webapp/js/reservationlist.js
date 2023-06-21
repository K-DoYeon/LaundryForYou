function resCondition(e, i, num) {
   const val = e.value;
   const reservation = ["입금대기", "입금완료", "수거준비", "수거완료", "배송완료"];
   let y = confirm("예약상태를 " + reservation[val] + "로 수정하시겠습니까?");
   
   if(y){
      
      //회원정보 수정
      fetch("/LaundryForYou/ConditionUpdate?condition=" + val + "&num=" + num)
         .then(res =>
            res.json())
            .then(data =>{
             if (data > 0) {
             alert("수정했습니다.");
          } else {
             alert("문제가 발생했습니다. 다시 시도하세요.");
             location.reload();
          }
   
            });
      
      }else{
         e.options[i].selected = true;
         return false;
   }
}