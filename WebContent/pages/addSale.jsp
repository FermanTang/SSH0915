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
		<h2>添加销售：</h2>
		<form action="${pageContext.request.contextPath }/users_insertSale" method="post" onsubmit="return checkAll()">
			<table>
				<tr>
					<td style="display: none">
						<input name="sale.userId" value="${user.uId }">
					</td>
					<td>商品名称：</td>
					<td><select name="sale.productId">
						<option value="0">--请选择商品--</option>
						<c:forEach items="${products }" var="p">
							<option value="${p.pId }">${p.productName }</option>
						</c:forEach>
					</select></td>
				</tr>
				<tr>
					<td>销售单价：</td>
					<td><input type="text" name="sale.price"></td>
				</tr>
				<tr>
					<td>销售数量：</td>
					<td><input type="text" name="sale.quantity"></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" value="保存"></td>
				</tr>
				<tr>
					<td class="msg" colspan="5"></td>
				</tr>
			</table>
		</form>
	</div>
	<c:remove var="chioose" scope="session"/>
</body>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.8.3.js">
</script>
<script type="text/javascript">
	function checkAll(){
		var productId = $("[name='sale.productId']").val();
		var price = $("[name='sale.price']").val();
		var quantity = $("[name='sale.quantity']").val();
		if(productId == 0){
			$(".msg").text("商品名称错误!");
			return false;
		}
		if(!(/^(\+)?\d+(\.\d+)?$/).test(price)){
			$(".msg").text("销售单价错误!");
			return false;
		}
		if(!/^(\+)?\d+$/.test(quantity)){
			$(".msg").text("销售数量错误!");
			return false;
		}
		return true;
		/* $.post(
			"${pageContext.request.contextPath }/pages/addSale.jsp",
			function(data){
				$("#right").html(data);
			},"html"
		);
		}) */
	}
</script>
</html>





















