<%@page language="java" pageEncoding="utf-8"
	contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>主页</title>
<link href="${pageContext.request.contextPath }/css/common.css"
	rel="stylesheet" type="text/css">
</head>
<body class="main">
	<div id="self">
		<h1>PICC 中国人民保险(香港)有限公司</h1>
		<h6 style="color: white;">THE PEOPLE'S INSURANCE COMPANY OF CHINA
			(HONG KONG),LTD.</h6>
		<div class="cardNoShow">
			欢迎：<span>${user.realName }</span>
			<ul>
				<li><a href="#">个人资料</a></li>
				<li><a
					href="${pageContext.request.contextPath }/users_loginOff"
					onclick="return confirm('是否退出!')">退出登录</a></li>
			</ul>
		</div>
	</div>
	<div id="main1">
		<div id="left">
			<ul id=menu>
				<li class="firstMenu"><span>承保子系统</span>
				<div class="RTriangle1"></div>
					<ul class="toubao">
						<li>投保管理
							<ul>
								<li>投保处理</li>
								<li>投保查询</li>
							</ul>
						</li>
						<li>保单管理</li>
					</ul></li>
				<li>批改子系统</li>
				<li>收付子系统</li>
				<li>双核子系统</li>
				<li>理赔子系统</li>
				<li>平台子系统</li>
			</ul>
		</div>
		<div id="right">
			<div class="welcome">
				<h1>欢迎使用产险系统</h1>
				<h6>${insertMsg }</h6>
				<c:remove var="insertMsg" scope="session" />
			</div>
		</div>
	</div>
</body>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.8.3.js">
	
</script>
<script type="text/javascript">
	//加载事件
	$().ready(function() {
		$("#right h6").hide(3 * 1000);
		$(".cardNoShow ul").hide();
		$(".toubao").hide();
	})
	$(".cardNoShow").click(function() {
		$(".cardNoShow ul").slideToggle();
	})
	$(".cardNoShow").mouseleave(function() {
		$(".cardNoShow ul").slideUp(300);
	})
	//承保子系统
	var CB = $(".firstMenu span");
	//添加点击事件
	var flag1 = true;
	CB.click(function(){
		if(flag1){
			$(".toubao").show(300);
			$(".RTriangle1").css({"transform":"rotate(90deg)","right":"5px","top":"17px"});
			flag1 = false;
		}else{
			$(".toubao").hide(300);
			$(".RTriangle1").css({"transform":"rotate(0deg)","right":"0px","top":"12px"});
			flag1 = true;
		}
	}) 
	var flag2 = true;
	$(".RTriangle1").click(function(){
		if(flag2){
			$(".toubao").show(300);
			$(".RTriangle1").css({"transform":"rotate(90deg)","right":"5px","top":"17px"});
			flag2 = false;
		}else{
			$(".toubao").hide(300);
			$(".RTriangle1").css({"transform":"rotate(0deg)","right":"0px","top":"12px"});
			flag2 = true;
		}
	})
	
	$(".RTriangle1").mouseenter(function(){
		$(".firstMenu span").addClass("first");		
	})
	$(".firstMenu span").mouseenter(function(){
		$(".firstMenu span").addClass("first");
	})
</script>
</html>





















