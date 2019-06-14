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
	<div class="changPwd">
		<h2>当前操作：修改密码。请按要求填写完整后点“修改”按钮</h2>
		<form
			action="${pageContext.request.contextPath}/account_updatePassword"
			method="post" onsubmit="return changePassword()">
			<table class="pwdTable">
				<tr>
					<td style="display: none">${account.password }</td>
					<td>请输入现在的密码：</td>
					<td><input name="oldPwd" type="text" maxlength="6"></td>
				</tr>
				<tr>
					<td>请输入新密码：</td>
					<td><input name="account.password" type="text" maxlength="6"></td>
				</tr>
				<tr>
					<td>请再次输入新密码：</td>
					<td><input name="checkPwd" type="text" maxlength="6"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="修改"></td>
				</tr>
				<tr>
					<td></td>
				</tr>
			</table>
		</form>
	</div>
</body>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.8.3.js">
	
</script>
<script type="text/javascript">
	/* 修改密码 */
	function changePassword() {
		var pwd = Number($(".changPwd table tr:first-child td:first-child")
				.text());
		var oldPwd = $(".changPwd [name='oldPwd']").val();
		var newPwd = $(".changPwd [name='account.password']").val();
		var checkPwa = $(".changPwd [name='checkPwd']").val();
		if (oldPwd != pwd) {
			$(".changPwd table tr:last-child td:first-child").text("原密码输入错误!");
			return false;
		}
		if (!/^\d{6}$/.test(newPwd)) {
			$(".changPwd table tr:last-child td:first-child")
					.text("请输入6位数字密码!");
			return false;
		}
		if (newPwd != checkPwa) {
			$(".changPwd table tr:last-child td:first-child")
					.text("两次密码输入不一致!");
			return false;
		}
		return true;
	}
</script>
</html>





















