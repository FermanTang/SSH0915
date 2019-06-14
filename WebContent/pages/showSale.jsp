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
			<table>
				<tr>
					<th colspan="4">销售信息查询：排序方式：<select name="chioose">
						<option value="totalPrice">单笔总价</option>
						<option value="saleDate" <c:if test="${chioose == 'saleDate' }">selected</c:if>>销售日期</option>
					</select><input type="button" value="提交" onclick="toQuery()">
				</tr>
				<tr>
				<%-- <td><select name="sale.productId">
						<option value="0">--请选择商品--</option>
						<c:forEach items="${products }" var="p">
							<option value="${p.pId }">${p.productName }</option>
						</c:forEach>
					</select></td> --%>
					<td>ID</td>
					<td>商品</td>
					<td>单价</td>
					<td>数量</td>
					<td>总价</td>
					<td>销售日期</td>
					<td>销售员</td>
				</tr>
				<c:forEach items="${pa.items }" var="u">
					<tr>
						<td>${u.sId }</td>
						<td>${u.product.productName }</td>
						<td>${u.price }</td>
						<td>${u.quantity }</td>
						<td>${u.totalPrice }</td>
						<td><fmt:formatDate value="${u.saleDate }"
						pattern="yyyy-MM-dd"/> </td>
						<td>${u.user.realName }</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="4">共${pa.totalPage }页,当前第${pa.currPage }页,显示 第${pa.start+1}条 到 第${pa.start+pa.pageSize > pa.count ? pa.count : pa.start+pa.pageSize }条
					</td>
					<td colspan="4"><c:if test="${pa.currPage != 1 }">
						<a href="javascript:toJump(1)">首页</a>
						<a href="javascript:toJump(${pa.currPage-1 })">上一页</a>
					</c:if> <c:if test="${pa.currPage != pa.totalPage }">
						<a href="javascript:toJump(${pa.currPage+1 })">下一页</a>
						<a href="javascript:toJump(${pa.totalPage })">尾页</a>
					</c:if>跳转到<select onchange="toJump()" name="page">
						<c:forEach begin="1" end="${pa.totalPage }" step="1" var="n">
							<option value="${n }"
								<c:if test="${n == pa.currPage }">selected</c:if>>${n }
							</option>
						</c:forEach>
					</select>页,每页<select onchange="toJump()" name="size">
						<c:forEach begin="5" end="25" step="5" var="n">
							<option value="${n }" <c:if test="${n == pa.pageSize }">selected</c:if>>${n }</option>
						</c:forEach>
					</select>条</td>
				</tr>
				<tr>
					<td class="msg"></td>
				</tr>
			</table>
	</div>
</body>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.8.3.js">
</script>
<script type="text/javascript">
//查询
	function toQuery(){
		var chioose = $("[name='chioose'] option:selected").val();
		$.post(
			"${pageContext.request.contextPath }/users_querySale",
			"chioose="+chioose,
			function(data){
				$("#right").html(data);
			},"html"
		);
	}
//分页
	function toJump(target){
		//判断，target是否有值
		if(!target){
			target = $("[name='page'] option:selected").val();
		}
		//得到提交的排序的数据
		var chioose = $("[name='chioose'] option:selected").val();
		//获取页面大小
		var size = $("[name='size'] option:selected").val();
		$.post(
			"${pageContext.request.contextPath }/users_querySale",
			"pa.currPage="+target+"&pa.pageSize="+size+"&chioose="+chioose,
			function(data){
				$("#right").html(data);
			},"html"
		);
	}
	/* function checkAll(){
		var productId = $("[name='sale.productId']").val();
		var price = $("[name='sale.price']").val();
		var quantity = $("[name='sale.quantity']").val();
		if(productId == 0){
			$(".msg").text("商品名称错误!");
			return false;
		}
		if(!/^(\+)?\d+$/.test(quantity)){
			$(".msg").text("销售数量错误!");
			return false;
		}
		return true; */
		/* $.post(
			"${pageContext.request.contextPath }/pages/addSale.jsp",
			function(data){
				$("#right").html(data);
			},"html"
		);
		}) */
</script>
</html>





















