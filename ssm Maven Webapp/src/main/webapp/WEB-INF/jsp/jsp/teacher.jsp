<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加</title>
<script language="javascript"
	src="<%=request.getContextPath()%>/style/jquery-1.8.0.min.js"></script>
<style>
<!--
table {
	border-collapse: collapse;
}

td {
	border: 1px solid #f00;
}
-->
</style>
<style mce_bogus="1">
table {
	border-collapse: collapse;
}

td {
	border: 1px solid #f00;
}
</style>
<script type="text/javascript">
<!--   
function add(){   
    window.location.href="<%=request.getContextPath() %>/teacher.do?to";   
}   
  
function del(id){
 var con = confirm("您确定删除么！");
 if(con){
 window.location.href="<%=request.getContextPath() %>/teacher.do?del&id=" + id;
 }else{
 alert("删除失败");
 return;
 }  
}   
function update(id){
 var con = confirm("您确定更新信息吗！");
 if(con){
 window.location.href="<%=request.getContextPath() %>/teacher.do?one&id=" + id;
 }else{
 return;
 }  
}   
// --></script>
</head>
<body>
	<div align="center">${message }</div>

	<table align="center">
		<Tr align="right">
			<td colspan="7"><input id="add" type="button" onclick="add()" value="添加" />
			</td>
		</Tr>
		<tr>
			<td>序号</td>
			<td>姓名</td>
			<td>职务</td>
			<td>班级</td>
			<td>头像</td>
			<td>操作</td>
		</tr>
		<c:forEach items="${teacherlist}" var="teacher">
			<tr id="<c:out value="${teacher.id}"/>">
				<td><c:out value="${teacher.id}" />
				</td>              
				<td><c:out value="${teacher.name}" />
				</td>              
				<td><c:out value="${teacher.job}" />
				</td>              
				<td><c:out value="${teacher.classs}" />
				</td>               
				<td><img src="../image/${teacher.picture}" >
				</td>              
				<td><input type="button"
					onclick="update('<c:out value="${teacher.id}"/>')" value="编辑" /> <input
					type="button" onclick="del('<c:out value="${teacher.id}"/>')"
					value="删除" /></td>
			</tr>
		</c:forEach>

	</table>
</body>
</html>
