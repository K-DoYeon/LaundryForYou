function memLevel(e, i, num) {
	const val = e.value;
	const mems = ["일반회원", "VIP회원", "관리자"];
	let y = confirm("회원정보를 " + mems[val] + "로 수정하시겠습니까?");
	
	if(y){
      
      //회원정보 수정
      fetch("/LaundryForYou/LevelUpdate?vip=" + val + "&num=" + num)
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






