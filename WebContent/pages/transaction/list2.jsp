<%@page language="java" pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
.query form:nth-child(2) input{
display: none;
}

.query form:nth-child(2) span:hover {
	color: green;
	text-decoration: underline;
	cursor: pointer;
}
</style>
</head>
<body>
	<div class="query">
		<form>
			<input name="query.key" placeholder="请输入查询内容关键字" value="">
			<input type="button" value="查询" class="btn" onclick="toJump(1)">
		</form>
		<form>
			<span>我要发布新闻</span>
			<input name="content" placeholder="请输入新闻内容" value="">
			<input type="button" value="发布" class="btn" onclick="toAdd()">
			<input type="button" value="取消" class="btn" onclick="toCancel()">
		</form>
	</div>
	<div class="list">
		<div></div>
		<table>
			<tr>
				<td>序号</td>
				<td>项目名称</td>
				<td>产权人</td>
				<td>身份证号</td>
				<td>房屋类型</td>
				<td>使用面积</td>
				<td>建造时间</td>
			</tr>
			<c:forEach items="${pa.items }" var="r" varStatus="i">
			<tr bgcolor="${i.index%2 == 0 ? 'lightblue' : 'lightgray' }">
				<td>${i+1 }</td>
				<td>${r.projectName }</td>
				<c:forEach items="${usersList }" var="u" varStatus="i">
					<c:if test="${r.cardId == u.cardId }">
						<td>${u.name }</td>
					</c:if>
				</c:forEach>
				<td>${r.cardId }</td>
				<td>${r.houseType }</td>
				<td>${r.area }</td>
				<td>
					<fmt:formatDate value="${r.buildTime }" pattern="yyyy年MM月dd日"/>
				</td>
			</tr>
			</c:forEach>
			
			<tr>
				<td colspan="4">
					共${pa.totalPage}页,
					当前第${pa.currPage }页,
					显示 第${pa.start+1 }条 到
					第${pa.start+pa.pageSize > pa.count ? pa.count : pa.start+pa.pageSize }条
				</td>
				<td colspan="4">
				<c:if test="${pa.currPage != 1 }">
					<a href="javascript:toJump(1)">首页</a>
					<a href="javascript:toJump(${pa.currPage-1})">上一页</a>
				</c:if>
				<c:if test="${pa.currPage != pa.totalPage }">
					<a href="javascript:toJump(${pa.currPage+1})">下一页</a>
					<a href="javascript:toJump(${pa.totalPage})">尾页</a>
				</c:if>
				跳转到<select onchange="toJump()" name="page">
					<c:forEach begin="1" end="${pa.totalPage }" step="1" var="n">
					<option value="${n }"
						<c:if test="${n == pa.currPage }">selected</c:if>
					>${n }</option>
					</c:forEach>
				</select>页
				
				每页<select onchange="toJump()" name="size">
					<c:forEach begin="5" end="25" step="5" var="n">
					<option value="${n }"
						<c:if test="${n == pa.pageSize }">selected</c:if>
					>${n }</option>
					</c:forEach>
				</select>条
				</td>
			</tr>
		</table>
	</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
<script type="text/javascript">

//添加新闻
function toAdd(){
	var content = $(".query [name=content]").val();
	if(content.trim()){
		$.post(
		"${pageContext.request.contextPath }/reply_save",
		"reply.content="+content,
		function (data){
			$("#main").html(data);
		},
		"html"
		);
	alert(content);
	}
}
function toJump(target) {
	//判断, target是否有值
	if(!target){
		target = $("[name='page'] option:selected").val();
	}
	//获取页面大小
	var size = $("[name='size'] option:selected").val();
	//alert("pa.currPage="+target+"&pa.pageSize="+size+"&"+$(".query form:first").serialize());
	$.post(
		"${pageContext.request.contextPath }/reply_query",
		"pa.currPage="+target+"&pa.pageSize="+size+"&"+$(".query form:first").serialize(),
		function (data) {
			$("#main").html(data);
		},
		"html"
	);
}

$(".query form:nth-child(2) span").bind("click",function(){
	$(".query form:nth-child(2) span").hide();
	$(".query form:nth-child(2) input").show();
})
function toCancel(){
	$(".query form:nth-child(2) span").show();
	$(".query form:nth-child(2) input").hide();
}
</script>
</html>












