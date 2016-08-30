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
function add(){   
    window.location.href="<%=request.getContextPath()%>/student.do?to";   
}   
  
function del(id){
 var con = confirm("您确定删除么！");
 if(con){
 window.location.href="<%=request.getContextPath()%>/student.do?del&id=" + id;
 }else{
 alert("删除失败");
 return;
 }  
}   
function update(id){
 var con = confirm("您确定更新信息吗！");
 if(con){
 window.location.href="<%=request.getContextPath()%>/student.do?one&id="
					+ id;
		} else {
			return;
		}
	}
	function checkCourse() {
		var con = document.getElementById("course");
		//alert(con);
		var butt = document.getElementById("butt");
		if (con.style.display = "block") {
			butt.value = "查看我的课程";
			con.style.display = "none";
		} else {
			butt.value = "隐藏我的课程";
			con.style.display = "block";
		}
	}
	window.onload = function() {
		var row = document.getElementById("tab").getElementsByTagName("tr");
		for ( i = 0; i <row.length; i++) {
			if(i%2==0)row[i].style.backgroundColor="";
			if(i%2==1)row[i].style.backgroundColor="red";
		}
	}
</script>
</head>
<body>
	<div align="center">${message }</div>

	<table align="center" id="tab">
		<Tr align="right">
			<td colspan="7"><input id="add" type="button" onclick="add()"
				value="添加" />
			</td>
		</Tr>
		<tr align="center">
			<td>序号</td>
			<td>姓名</td>
			<td>密码</td>
			<td>年龄</td>
			<td>性别</td>
			<td>课程</td>
			<td>操作</td>
		</tr>
		<c:forEach items="${studentlist}" var="student">
			<tr id="<c:out value="${student.id}"/>">
				<td><c:out value="${student.id}" />
				</td>
				<td><c:out value="${student.name}" />
				</td>
				<td><c:out value="${student.psw}" />
				</td>
				<td><c:out value="${student.age}" />
				</td>
				<td><c:out value="${student.sex}" />
				</td>
				<td><input type="button" id="butt" value="查看我的课程"
					onclick="checkCourse()"></td>
				<td><input type="button"
					onclick="update('<c:out value="${student.id}"/>')" value="编辑" /> <input
					type="button" onclick="del('<c:out value="${student.id}"/>')"
					value="删除" /></td>
			</tr>
		</c:forEach>

	</table>
	<%-- <div id="course" style="display:none">
		<table align="center">
			<tr align="center">
				<td>课程编号</td>
				<td>课程名称</td>
			</tr>
			<c:forEach items="${studentlist}" var="student">
				<c:forEach items="${student.courses}" var="course">
					<tr id="<c:out value="${course.id}"/>" align="center">
						<td>${course.id }</td>
						<td>${course.name }</td>
					</tr>
				</c:forEach>
			</c:forEach>
		</table>
	</div> --%>
</body>
</html>
