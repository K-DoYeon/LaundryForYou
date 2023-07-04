function dailyMinus(){
	const daily = document.getElementById("daily"),
		sum = document.getElementById("dailySumprice"),
		dailyprice = document.getElementById("dailyprice");
	
	if(daily.value > 0){
		daily.value--;
		sum.value = daily.value * dailyprice.value;
	}else{
		daily.value = 0;
	}
	
	const dailysum = document.getElementById("dailySumprice"),
		blanketsum = document.getElementById("blanketSumprice"),
		shirtsum = document.getElementById("shirtSumprice"),
		drysum = document.getElementById("drySumprice"),
		caresum = document.getElementById("careSumprice"),
		total = document.getElementById("total"),
		sale = document.getElementById("sale");
		
	total.value = parseInt(dailysum.value) + parseInt(blanketsum.value) + 
				parseInt(shirtsum.value) + parseInt(drysum.value) + parseInt(caresum.value);
	sale.value = total.value * 0.9;
}
function dailyPlus(){
		
	const daily = document.getElementById("daily"),
		sum = document.getElementById("dailySumprice"),
		dailyprice = document.getElementById("dailyprice");
	
		sum.value =dailyprice.value;
		
		daily.value++;
		sum.value = daily.value * dailyprice.value;
		
	const dailysum = document.getElementById("dailySumprice"),
		blanketsum = document.getElementById("blanketSumprice"),
		shirtsum = document.getElementById("shirtSumprice"),
		drysum = document.getElementById("drySumprice"),
		caresum = document.getElementById("careSumprice"),
		total = document.getElementById("total"),
		sale = document.getElementById("sale");
		
	total.value = parseInt(dailysum.value) + parseInt(blanketsum.value) + 
				parseInt(shirtsum.value) + parseInt(drysum.value) + parseInt(caresum.value);
	sale.value = total.value * 0.9;
}

function blanketMinus(){
	const blanket = document.getElementById("blanket"),
		sum = document.getElementById("blanketSumprice"),
		blanketprice = document.getElementById("blanketprice");
	
	if(blanket.value > 0){
		blanket.value--;
		sum.value = blanket.value * blanketprice.value;
	}else{
		blanket.value = 0;
	}
	
	const dailysum = document.getElementById("dailySumprice"),
		blanketsum = document.getElementById("blanketSumprice"),
		shirtsum = document.getElementById("shirtSumprice"),
		drysum = document.getElementById("drySumprice"),
		caresum = document.getElementById("careSumprice"),
		total = document.getElementById("total"),
		sale = document.getElementById("sale");
		
	total.value = parseInt(dailysum.value) + parseInt(blanketsum.value) + 
				parseInt(shirtsum.value) + parseInt(drysum.value) + parseInt(caresum.value);
	sale.value = total.value * 0.9;
}
function blanketPlus(){
		
	const blanket = document.getElementById("blanket"),
		sum = document.getElementById("blanketSumprice"),
		blanketprice = document.getElementById("blanketprice");
	
		sum.value =blanketprice.value;
		
		blanket.value++;
		sum.value = blanket.value * blanketprice.value;
		
	const dailysum = document.getElementById("dailySumprice"),
		blanketsum = document.getElementById("blanketSumprice"),
		shirtsum = document.getElementById("shirtSumprice"),
		drysum = document.getElementById("drySumprice"),
		caresum = document.getElementById("careSumprice"),
		total = document.getElementById("total"),
		sale = document.getElementById("sale");
		
	total.value = parseInt(dailysum.value) + parseInt(blanketsum.value) + 
				parseInt(shirtsum.value) + parseInt(drysum.value) + parseInt(caresum.value);
	sale.value = total.value * 0.9;
}

function shirtMinus(){
	const shirt = document.getElementById("shirt"),
		sum = document.getElementById("shirtSumprice"),
		shirtprice = document.getElementById("shirtprice");
	
	if(shirt.value > 0){
		shirt.value--;
		sum.value = shirt.value * shirtprice.value;
	}else{
		shirt.value = 0;
	}
	
	const dailysum = document.getElementById("dailySumprice"),
		blanketsum = document.getElementById("blanketSumprice"),
		shirtsum = document.getElementById("shirtSumprice"),
		drysum = document.getElementById("drySumprice"),
		caresum = document.getElementById("careSumprice"),
		total = document.getElementById("total"),
		sale = document.getElementById("sale");
		
	total.value = parseInt(dailysum.value) + parseInt(blanketsum.value) + 
				parseInt(shirtsum.value) + parseInt(drysum.value) + parseInt(caresum.value);
	sale.value = total.value * 0.9;
}
function shirtPlus(){
		
	const shirt = document.getElementById("shirt"),
		sum = document.getElementById("shirtSumprice"),
		shirtprice = document.getElementById("shirtprice");
	
		sum.value =shirtprice.value;
		
		shirt.value++;
		sum.value = shirt.value * shirtprice.value;
		
	const dailysum = document.getElementById("dailySumprice"),
		blanketsum = document.getElementById("blanketSumprice"),
		shirtsum = document.getElementById("shirtSumprice"),
		drysum = document.getElementById("drySumprice"),
		caresum = document.getElementById("careSumprice"),
		total = document.getElementById("total"),
		sale = document.getElementById("sale");
		
	total.value = parseInt(dailysum.value) + parseInt(blanketsum.value) + 
				parseInt(shirtsum.value) + parseInt(drysum.value) + parseInt(caresum.value);
	sale.value = total.value * 0.9;
}


function dryMinus(){
	const dry = document.getElementById("dry"),
		sum = document.getElementById("drySumprice"),
		dryprice = document.getElementById("dryprice");
	
	if(dry.value > 0){
		dry.value--;
		sum.value = dry.value * dryprice.value;
	}else{
		dry.value = 0;
	}
	
	const dailysum = document.getElementById("dailySumprice"),
		blanketsum = document.getElementById("blanketSumprice"),
		shirtsum = document.getElementById("shirtSumprice"),
		drysum = document.getElementById("drySumprice"),
		caresum = document.getElementById("careSumprice"),
		total = document.getElementById("total"),
		sale = document.getElementById("sale");
		
	total.value = parseInt(dailysum.value) + parseInt(blanketsum.value) + 
				parseInt(shirtsum.value) + parseInt(drysum.value) + parseInt(caresum.value);
	sale.value = total.value * 0.9;
}
function dryPlus(){
		
	const dry = document.getElementById("dry"),
		sum = document.getElementById("drySumprice"),
		dryprice = document.getElementById("dryprice");
	
		sum.value =dryprice.value;
		
		dry.value++;
		sum.value = dry.value * dryprice.value;
		
	const dailysum = document.getElementById("dailySumprice"),
	blanketsum = document.getElementById("blanketSumprice"),
	shirtsum = document.getElementById("shirtSumprice"),
	drysum = document.getElementById("drySumprice"),
	caresum = document.getElementById("careSumprice"),
	total = document.getElementById("total"),
	sale = document.getElementById("sale");
		
	total.value = parseInt(dailysum.value) + parseInt(blanketsum.value) + 
				parseInt(shirtsum.value) + parseInt(drysum.value) + parseInt(caresum.value);
	sale.value = total.value * 0.9;
}

function careMinus(){
	const care = document.getElementById("care"),
		sum = document.getElementById("careSumprice"),
		careprice = document.getElementById("careprice");
	
	if(care.value > 0){
		care.value--;
		sum.value = care.value * careprice.value;
	}else{
		care.value = 0;
	}
	
	const dailysum = document.getElementById("dailySumprice"),
		blanketsum = document.getElementById("blanketSumprice"),
		shirtsum = document.getElementById("shirtSumprice"),
		drysum = document.getElementById("drySumprice"),
		caresum = document.getElementById("careSumprice"),
		total = document.getElementById("total"),
		sale = document.getElementById("sale");
		
	total.value = parseInt(dailysum.value) + parseInt(blanketsum.value) + 
				parseInt(shirtsum.value) + parseInt(drysum.value) + parseInt(caresum.value);
	sale.value = total.value * 0.9;
}
function carePlus(){
		
	const care = document.getElementById("care"),
		sum = document.getElementById("careSumprice"),
		careprice = document.getElementById("careprice");
	
		sum.value =careprice.value;
		
		care.value++;
		sum.value = care.value * careprice.value;
		
		
	const dailysum = document.getElementById("dailySumprice"),
		blanketsum = document.getElementById("blanketSumprice"),
		shirtsum = document.getElementById("shirtSumprice"),
		drysum = document.getElementById("drySumprice"),
		caresum = document.getElementById("careSumprice"),
		total = document.getElementById("total"),
		sale = document.getElementById("sale");
		
	total.value = parseInt(dailysum.value) + parseInt(blanketsum.value) + 
				parseInt(shirtsum.value) + parseInt(drysum.value) + parseInt(caresum.value);
	sale.value = total.value * 0.9;
		
}