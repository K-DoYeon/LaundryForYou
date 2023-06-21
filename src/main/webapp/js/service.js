$(function(){
    //tab
    $('.tab a').click(function(e){
        e.preventDefault(); //a태그의 기능을 없애는, a태그를 누르면 위로 올라가기떄문에
        $('.tab a').removeClass('active'); //탭의 모든 active를 지운다.
        $(this).addClass('active'); //누른 탭에 active를 추가한다.
        const myid = $(this).data("idx"); //누른 탭에 data-idx값을 가져온다.
        $('.service-content>div').removeClass('active'); //tab-content의 모든 active를 지운다.
        $(myid).addClass('active'); // 가져온 data-idx 값과 같은 tab-content값에 active를 추가한다.
    });
});