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
	<div id="login2">
		<form action="${pageContext.request.contextPath }/users_login"
			method="post" onsubmit="return loginCheckAll()">
			<table>
				<tr>
					<td>Account:</td>
					<td><input name="users.userName" type="text"> <!-- maxlength="19" onkeyup="this.value =this.value.replace(/\s/g,'').replace(/[^\d]/g,'').replace(/(\d{4})(?=\d)/g,'$1 ');"> -->
					</td>
				</tr>
				<tr>
					<td>Password:</td>
					<td><input name="users.password" type="password"></td>
				</tr>
				<tr>
					<td>Language:</td>
					<td><select name="user.language" style="display: none;">
							<option value="0"></option>
							<option value="1"></option>
					</select></td>
				</tr>
				<tr>
					<td></td>
					<td><input value="Login" type="submit"></td>
				</tr>
				<tr>
					<td></td>
					<td class=loginMsg><font color="red">${errMsg }</font> <c:remove
							var="errMsg" scope="session" /></td>
				</tr>
			</table>
		</form>
		<div class="language2">
			<h2>English</h2>
			<div class="down2">
				<h2>Chinese</h2>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<script type="text/javascript">
	var down = $('.down2');
	var up = $('.language2 h2');
	var flag = true;
	/* 加载事件*/
	$().ready(function() {
		down.hide();
	})
	/*点击事件*/
	$(".language2").click(function() {
		down.slideToggle();
	})
	down.click(function() {
		$(location).attr('href','login.jsp');
	})
	$(".language2").mouseleave(function(){
		down.slideUp(300);
	});
	/* 验证 */
	function loginCheckAll() {
		var userName = $("#login2 [name='users.userName']").val();
		var pwd = $("#login2 [name='users.password']").val();
		if (!userName) {
			$(".loginMsg font").text("用户名不能为空!");
			return false;
		}
		if (!pwd) {
			$(".loginMsg font").text("密码不能为空!");
			return false;
		}
		return true;
	}
</script>
</html>