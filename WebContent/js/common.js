$(document).ready(function(){
	$(".welcome").show();
	$(".balance").hide();
	$(".transfer").hide();
	$(".transaction").hide();
	$(".changPwd").hide();
	$(".transferSuc").hide();
	$(".list").hide();
})

$(".left ul li:nth-child(1) a").bind("click",function(){
	$(".welcome").hide();
	$(".balance").show();
	$(".transfer").hide();
	$(".transaction").hide();
	$(".changPwd").hide();
	$(".transferSuc").hide();
	$(".list").hide();
})

$(".left ul li:nth-child(2) a").bind("click",function(){
	$(".welcome").hide();
	$(".balance").hide();
	$(".transfer").show();
	$(".transaction").hide();
	$(".changPwd").hide();
	$(".transferSuc").hide();
	$(".list").hide();
})

$(".left ul li:nth-child(3) a").bind("click",function(){
	$(".welcome").hide();
	$(".balance").hide();
	$(".transfer").hide();
	$(".transaction").show();
	$(".changPwd").hide();
	$(".transferSuc").hide();
	$(".list").hide();
})

$(".left ul li:nth-child(4) a").bind("click",function(){
	$(".welcome").hide();
	$(".balance").hide();
	$(".transfer").hide();
	$(".transaction").hide();
	$(".changPwd").show();
	$(".transferSuc").hide();
	$(".list").hide();
})

