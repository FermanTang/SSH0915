<%@page language="java" pageEncoding="utf-8"
	contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>主页</title>
<link href="${pageContext.request.contextPath }/css/main.css"
	rel="stylesheet" type="text/css">
</head>
<body>
	<div class="transfer">
	 	<span style="display: none">${account.balance }</span>
		<div class="afterTransfer">
			<h2></h2>
		</div>
		<div class="beforTransfer">
		<h2>当前操作:转账。请输入账号和金额后点“转账”按钮</h2>
			<table>
				<tr>
					<td><span>转入账号:</span>
					<input name="cardNo" type="text" maxlength="19" onkeyup="this.value =this.value.replace(/\s/g,'').replace(/[^\d]/g,'').replace(/(\d{4})(?=\d)/g,'$1 ');">
					</td>
				</tr>
				<tr>
					<td><span>转账金额:</span><input name="money" type="number"
						value=""></td>
				</tr>
				<tr>
					<td><input type="button" value="转账" onclick="cleckTransfer()"></td>
				</tr>
				<tr>
					<td></td>
				</tr>
			</table>
		</div>
	</div>
</body>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.8.3.js">
</script>
<script type="text/javascript">
var balance = "${session.account.balance}";
/* 转账 */
	function cleckTransfer() {
		var cardNo = $(".transfer [name='cardNo']").val();
		var money = $(".transfer [name='money']").val();
		if (cardNo.length != 19) {
			$(".transfer table tr:last-child td").text("请正确填写您的16位卡号!");
			return false;
		}
		if (!money) {
			$(".transfer table tr:last-child td").text("金额不能为空!");
			return false;
		}
		if (!/^\d*\.\d{2}$/.test(money)) {
			$(".transfer table tr:last-child td").text("请正确填写转账金额如：0.00!");
			return false;
		}
		if (balance < money) {
			$(".transfer table tr:last-child td").text("余额不足，请重新输入!");
			return false;
		}
		$.post("${pageContext.request.contextPath}/transactionRecord_update",
				"account.balance=" + money + "&account.cardNo=" + cardNo,
			function(data) {
			if (data.msg == 2) {
				$(".beforTransfer").hide();
				$(".afterTransfer h2").text("转账成功！请选择其它操作！");
			}
			if (data.msg == 0) {
				$(".afterTransfer h2").text(
					"转账失败!目标账户不存在!");
			}
			if (data.msg == 1) {
				$(".afterTransfer h2").text(
					"转账失败!目标账户已被冻结!");
			}
		});
	}
</script>
</html>





















