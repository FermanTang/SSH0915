<%@page language="java" pageEncoding="utf-8"
	contentType="text/html; charset=utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录</title>
<link href="${pageContext.request.contextPath }/css/common.css"
	rel="stylesheet" type="text/css">
</head>
<body class="bglogin">
	<div class="logo">
		<h1>PICC 中国人民保险(香港)有限公司</h1>
		<h6 style="color: white;">THE PEOPLE'S INSURANCE COMPANY OF CHINA
			(HONG KONG),LTD.</h6>
	</div>
	<div id="login1">
		<form action="${pageContext.request.contextPath }/users_login"
			method="post" onsubmit="return loginCheckAll()">
			<table>
				<tr>
					<td>账&nbsp;&nbsp;&nbsp;号:</td>
					<td><input name="users.userName" type="text"> <!-- maxlength="19" onkeyup="this.value =this.value.replace(/\s/g,'').replace(/[^\d]/g,'').replace(/(\d{4})(?=\d)/g,'$1 ');"> -->
					</td>
				</tr>
				<tr>
					<td>密&nbsp;&nbsp;&nbsp;码:</td>
					<td><input name="users.password" type="password"></td>
				</tr>
				<tr>
					<td>语&nbsp;&nbsp;&nbsp;言:</td>
					<td><select name="user.language" style="display: none;">
							<option value="0">简体</option>
							<option value="1">英文</option>
					</select></td>
				</tr>
				<tr>
					<td></td>
					<td><input value="登&nbsp;&nbsp;&nbsp;录" type="submit"></td>
				</tr>
				<tr>
					<td></td>
					<td class=loginMsg><font color="red">${errMsg }</font> <c:remove
							var="errMsg" scope="session" /></td>
				</tr>
			</table>
		</form>
		<div class="language1">
			<h2>简体中文</h2>
			<div class="down1">
				<h2>英文</h2>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<script type="text/javascript">
	var down = $('.down1');
	/* 加载事件*/
	$().ready(function() {
		down.hide();
	})
	/*点击事件*/
	$(".language1").click(function() {
		down.slideToggle();
	})
	down.click(function() {
		$(location).attr('href','login2.jsp');
	})
	$(".language1").mouseleave(function(){
		down.slideUp(300);
	});
	/* 每输入4个数字后自动空一格 */
	function loginCheckAll() {
		var userName = $("#login1 [name='users.userName']").val();
		//var cardNo = user.replace(/(^\s+)|(\s+$)/g,"");
		var pwd = $("#login1 [name='users.password']").val();
		if (!userName) {
			$(".loginMsg font").text("用户名不能为空!");
			return false;
		}
		/* if(!/^\d{6}$/.test(pwd)){ */
		if (!pwd) {
			$(".loginMsg font").text("密码不能为空!");
			return false;
		}
		return true;
	}
</script>
</html>