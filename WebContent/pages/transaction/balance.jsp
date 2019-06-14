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
	<div class="balance">
		<h1>您的账户余额是:</h1>
		<h4>
			人民币:&nbsp;&nbsp;&nbsp;&nbsp;<span>${account.balance }</span>元
		</h4>
	</div>
</body>
</html>





















