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
<body>
	<div id="self">
		<div>
			<div class="cardNoShow">
				卡号:<span>${account.cardNo }</span> <a
					href="${pageContext.request.contextPath }/account_loginOff"
					onclick="return confirm('是否退出!')">退出登录</a>
			</div>
		</div>
		<div class="selfLeft">
			<ul>
				<li><a href="#" onclick="queryBalance()">查询余额</a></li>
				<li><a href="#" onclick="transfer()">转账</a></li>
				<li><a href="#" onclick="queryTransaction()">查询交易记录</a></li>
				<li><a href="#" onclick="changePwd()">修改密码</a></li>
			</ul>
		</div>
		<div id="right">
			<h1>欢迎使用仙灵银行系统</h1>
		</div>
	</div>
</body>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.8.3.js">
	
</script>
<script type="text/javascript">
var cardNo = "${session.account.cardNo}";
/* 修改密码 */
function changePwd(){
	$.post(
		"${pageContext.request.contextPath}/pages/transaction/changePwd.jsp",
		function(data){
			$("#right").html(data);
		},
		"html"
	);
}

/* 查询交易记录 */
function queryTransaction(){
	$.post(
		//"${pageContext.request.contextPath}/pages/transaction/transaction.jsp",
		"${pageContext.request.contextPath}/transactionRecord_transactionQuery",
		"account.cardNo=" + cardNo, 
		function(data){
			$("#right").html(data);
		},
		"html"
	);	
}
/* 转账 */
function transfer(){
	$.post(
		"${pageContext.request.contextPath}/pages/transaction/transfer.jsp",
		function(data){
			$("#right").html(data);
		},
		"html"
	);
}
/* 查询余额 */
function queryBalance(){
	$.post(
		"${pageContext.request.contextPath}/account_queryBalance",
		"account.cardNo=" + $(".cardNoShow span").text(),
		function(data){
			$("#right").html(data);
		},
		"html"
	);
}

</script>
</html>





















