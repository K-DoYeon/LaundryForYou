/* 
** Initialize seat number to 2
*/
var seat = 1;

/* 
** Initialize List array
*/
var List = [];
List.weekend = [];
List.week = [];

/* 
** Initializing available dates
*/

var advancedTime = [
  {
    'weekend': [
      { time: "12:30", available: true, seats: 2 },
      { time: "13:30", available: true, seats: 2 },
      { time: "13:45", available: true, seats: 2 },
      { time: "19:30", available: true, seats: 2 },
      { time: "20:00", available: true, seats: 2 },
      { time: "20:15", available: true, seats: 2 },
      { time: "20:30", available: true, seats: 2 },
      { time: "20:45", available: true, seats: 2 },
      { time: "21:00", available: true, seats: 2 },
      { time: "21:15", available: true, seats: 2 },
      { time: "21:30", available: true, seats: 2 }
    ],
    'week': [
      { time: "12:30", available: true, seats: 2 },
      { time: "13:30", available: true, seats: 2 },
      { time: "13:45", available: true, seats: 2 },  
      { time: "19:30", available: true, seats: 2 },
      { time: "20:00", available: true, seats: 2 },
      { time: "20:15", available: true, seats: 2 },
      { time: "20:30", available: true, seats: 2 },
      { time: "20:45", available: true, seats: 2 },
      { time: "21:00", available: true, seats: 2 },
      { time: "21:15", available: true, seats: 2 },
      { time: "21:30", available: true, seats: 2 },
      { time: "21:45", available: true, seats: 2 },
      { time: "22:00", available: true, seats: 2 },
    ]
  }
]

/* 
** Filter times list available for a specific seats number
*/
var filterList = function(seatNumber){
  List = [];
  List.weekend = [];
  List.week = [];
  
  for(var i=0; i<advancedTime[0].weekend.length; i++) {
    if( (advancedTime[0].weekend[i].seats - seatNumber) >= 0) {
      List.weekend.push(advancedTime[0].weekend[i]);
    }
  }

  for(var i=0; i<advancedTime[0].week.length; i++) {
    if( (advancedTime[0].week[i].seats - seatNumber) >= 0) {
      List.week.push(advancedTime[0].week[i]);
    }
  }

  $('.datetimepicker').datetimepicker({allowTimes: advancedListAvailable()}); // Update datepicker times option
    
}

/* 
** List available times from date availability
*/
var advancedListAvailable = function(dayIndex) {

  var selectedSeat = $('#number').html(); // Seats value
  var timeList = [];
  
  // If no specific date, initializing with current date
  if(dayIndex == null || dayIndex == undefined ) {
     dayIndex = new Date().getDay(); // [Number] Return day Index (Starting from 0 - Sunday)
  }

  // If dayIndex is not on regular days (friday, saturday, sunday)
  if(dayIndex == 0 || dayIndex >= 5) {
    
    if(List.weekend.length > 0) {

      for(var i=0; i<List.weekend.length; i++) {    

        if(List.weekend[i].available == true) { // Verify the time is set available & the number of seats required is ok
          timeList.push(List.weekend[i].time); // Push time to List
        }

      }
      
      $('.datetimepicker').datetimepicker({allowTimes: timeList}); // Update datepicker times option

    } else {

      //Deactivate day
      $('.datetimepicker').datetimepicker({disabledWeekDays: [dayIndex]});

    }
    
  } else { // else dayIndex is on regular days
    
    if(List.week.length > 0) {
      for(var i=0; i<List.week.length; i++) {

        if(List.week[i].available == true) { // Verify the time is set available & the number of seats required is ok
          timeList.push(List.week[i].time); // Push time to List
        }

      }

      $('.datetimepicker').datetimepicker({allowTimes: timeList}); // Update datepicker times option
    
    } else {

      //deactivate day
      $('.datetimepicker').datetimepicker({disabledWeekDays: [dayIndex]});

    }
  }
  
}

/* 
** Settings the max days range available
*/
var maxDays = function() {
  var initial = new Date(); // FROM value
  var addDays = 6; // TO value
  return initial.setDate(initial.getDate() + addDays); 
} // Source => http://stackoverflow.com/questions/3818193/how-to-add-number-of-days-to-todays-date


/* 
** Setting datetimepicker default options
*/
var options = {
  format: 'Y년 m월 d일',
  value: Date.now(),
  minDate: 0,
  maxDate: maxDays(),
  step: 15,
  closeOnWithoutClick: true,
  todayButton: false,
  lang: 'fr',
  onSelectDate: function(ct) {
    advancedListAvailable(ct.getDay()); // Send day Index of the current date
  }
}


/* 
* OnReady
* Functions
*/
$(document).ready(function() {
  
  $(".infos span").html(seat); // Display the default seat value
  $("#minus").addClass("disabled"); // Disable seat removing with default value  
  
  // Initialize datetimepicker with default options
  $('.datetimepicker').datetimepicker(options);

  filterList(seat); // Filter the available times with the seat default value
  
  /* 
  ** When clicking 
  ** on (-) icon 
  */
  $("#minus").click(function(e) {    
    e.preventDefault();
    
    if(seat !== 2) { // Used to prevent seat animation when seat equals 2
      
      $(".infos span").fadeOut("fast", function() { // FadeIn out the seat number
        if(seat > 3) {
          seat--; // Remove seat one by one
          filterList(seat); // Filtering the available day times
        } else if(seat === 3) {
          seat--;
          filterList(seat); // Filtering the available day times
          $("#minus").addClass("disabled"); // Adding disabled style when seat equals 2
        }

        $(".infos span").html(seat).fadeIn(400); // Displaying the new seat value with fade-in effect
      });   
      
    }
    
  });
  
  /* 
  ** When clicking 
  ** on (+) icon 
  */
  $("#plus").click(function(e) {
    e.preventDefault();
    
    $(".infos span").fadeOut("fast", function() {
      
      if(seat >= 2) {
        $("#minus").removeClass("disabled"); // Removing the disabled style when seat > 2
      }
      
      seat++; // Adding seat one by one
      filterList(seat); // Filtering the available day times
      
      $(this).html(seat).fadeIn(400); // Display the new seat value with fade-in effect
      
    });
   
  });
  
});

function inputValueChange(){
    var inputValue = document.getElementsByClassName('xdsoft_datetimepicker').
    console.log(inputValue);
}

const absoluteDiv = document.querySelector('.xdsoft_datetimepicker');

function fixDivPosition() {
  const windowWidth = window.innerWidth;
  const windowHeight = window.innerHeight;
  const scrollTop = window.pageYOffset || document.documentElement.scrollTop;

  const divWidth = absoluteDiv.offsetWidth;
  const divHeight = absoluteDiv.offsetHeight;

  const desiredLeft = (windowWidth - divWidth) / 2;
  const desiredTop = (windowHeight - divHeight) / 2 + scrollTop;

  absoluteDiv.style.left = desiredLeft + 'px';
  absoluteDiv.style.top = desiredTop + 'px';
}

window.addEventListener('resize', fixDivPosition);
window.addEventListener('scroll', fixDivPosition);

// 초기 위치 설정
fixDivPosition();
