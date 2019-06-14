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
	<div>
		<h3>查看库存：</h3>
		<span>商品名称：</span> <select name="productChioose">
			<option value="0">--请选择商品--</option>
			<c:forEach items="${productList }" var="p">
				<option value="${p.quantity }"
					<c:if test="${p.pId == productChioose }">selected</c:if>>${p.productName }</option>
			</c:forEach>
		</select><input type="button" value="查询" onclick="toQuery()">
		<h4></h4>
	</div>
</body>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.8.3.js">
	
</script>
<script type="text/javascript">
	//查询
	function toQuery() {
		var productChioose = $("[name='productChioose'] option:selected").val();
		if(productChioose == 0){
			$("h4").text("请选择正确的商品查询!");
		}else{
			$("h4").text("该商品的库存是:" + productChioose);
		}
	}
</script>
</html>





















