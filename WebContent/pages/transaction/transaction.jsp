<%@page language="java" pageEncoding="utf-8"
	contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="${pageContext.request.contextPath }/css/common.css"
	rel="stylesheet" type="text/css">
</head>
<body>
	<div class="transaction">
		<h2>当前操作：查询交易记录。请选择时间范围后点“查询”按钮</h2>
		<form>
			<span>查询日期范围:</span> <input type="date" name="startTime" value=<fmt:formatDate value="${query.startTime }"
								pattern="yyyy-MM-dd" />> <span>到</span>
			<input type="date" name="endTime" value=<fmt:formatDate value="${query.endTime }"
								pattern="yyyy-MM-dd" />> <input type="button"
				value="查询" onclick="transactionQuery()">
		</form>
		<h3>${errMsg }</h3>
		<c:remove var="errMsg" scope="session" />
		<div class="list">
			<table>
				<tr>
					<td>交易日期</td>
					<td>交易额</td>
					<td>账户余额</td>
					<td>交易类型</td>
					<td>备注</td>
				</tr>
				<c:forEach items="${pa.items }" var="u" varStatus="i">
					<tr bgcolor="${i.index%2 == 0 ? 'lightblue' : 'lightgray' }">
						<td><fmt:formatDate value="${u.transactionDate }"
								pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td>${u.transactionAmount }</td>
						<td>${u.balance }</td>
						<td>${u.transactionType }</td>
						<td>${u.remark }</td>
					</tr>
				</c:forEach>

				<tr>
					<td colspan="4">共${pa.totalPage}页, 当前第${pa.currPage }页, 显示
						第${pa.start+1 }条 到 第${pa.start+pa.pageSize > pa.count ? pa.count : pa.start+pa.pageSize }条
					</td>
					<td colspan="4"><c:if test="${pa.currPage != 1 }">
							<a href="javascript:toJump(1)">首页</a>
							<a href="javascript:toJump(${pa.currPage-1})">上一页</a>
						</c:if> <c:if test="${pa.currPage != pa.totalPage }">
							<a href="javascript:toJump(${pa.currPage+1})">下一页</a>
							<a href="javascript:toJump(${pa.totalPage})">尾页</a>
						</c:if> 跳转到<select onchange="toJump()" name="page">
							<c:forEach begin="1" end="${pa.totalPage }" step="1" var="n">
								<option value="${n }"
									<c:if test="${n == pa.currPage }">selected</c:if>>${n }</option>
							</c:forEach>
					</select>页 每页<select onchange="toJump()" name="size">
							<c:forEach begin="5" end="25" step="5" var="n">
								<option value="${n }"
									<c:if test="${n == pa.pageSize }">selected</c:if>>${n }</option>
							</c:forEach>
					</select>条</td>
				</tr>
			</table>
		</div>
	</div>
</body>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<script type="text/javascript">
var time = "${session.query.startTime}";
var cardNo = "${session.account.cardNo}";
var mp = /^\d{4}-\d{2}-\d{2}$/;
/* 查询 */
function transactionQuery() {
var startTime = $("[name='startTime']").val();
var endTime = $("[name='endTime']").val();
	if (mp.test(startTime) && mp.test(endTime)) {
		$.post(
			"${pageContext.request.contextPath}/transactionRecord_transactionQuery",
			"query.startTime=" + startTime + "&query.endTime="+ endTime + "&account.cardNo=" + cardNo,
			function(data) {
				$("#right").html(data);
			},
			"html"	
		);
	}else {
		$.post(
			"${pageContext.request.contextPath}/transactionRecord_transactionQuery",
			"account.cardNo=" + cardNo, 
			function(data) {
				$("#right").html(data);
			},
			"html"	
		);
	}   
}

function toJump(target) {
	var startTime = $("[name='startTime']").val();
	var endTime = $("[name='endTime']").val();
	//判断, target是否有值
	if (!target) {
		target = $("[name='page'] option:selected").val();
	}
	//获取页面大小
	var size = $("[name='size'] option:selected").val();
	//alert("pa.currPage="+target+"&pa.pageSize="+size+"&"+$(".query form:first").serialize());
	if (mp.test(startTime) && mp.test(endTime)) {
		$.post(
			"${pageContext.request.contextPath}/transactionRecord_transactionQuery",
			"pa.currPage=" + target + "&pa.pageSize=" + size +
			"&query.startTime=" + startTime + "&query.endTime="+ endTime + "&account.cardNo=" + cardNo,
			function(data) {
				$("#right").html(data);
			},
			"html"	
		);
	} 
	if (!startTime || !endTime) {
		$.post("${pageContext.request.contextPath }/transactionRecord_transactionQuery",
			"pa.currPage=" + target + "&pa.pageSize=" + size
			+ "&account.cardNo=" + cardNo,
			function(data) {
					$("#right").html(data);
			}, 
			"html"
		);
	}
} 
</script>
</html>












