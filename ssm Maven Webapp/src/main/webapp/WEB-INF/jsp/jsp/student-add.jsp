<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>主页</title>
<script type="text/javascript">function turnback(){   
	var number = document.getElementById("age").value;
	alert(number);
	for(i =0 ;i<number.length;i++){
	if(number.charAt(i)>"9"||number.charAt(i)<"0"){
	alert("格式错误");
	return ;
	}
	}
	  window.location.href="<%=request.getContextPath()%>/student.do?all";

	}
// -->
</script>
</head>
<body>
<c:choose>
<c:when test="${student==null }">

	<form method="post"
		action="student.do?save">
		<table>
			<tr>
				<td>姓名</td>
				<td><input id="name" name="name" type="text" />
				</td>
			</tr>
			<tr>
				<td>密码</td>
				<td><input id="psw" name="psw" type="text" />
				</td>
			</tr>
			<tr>
				<td>性别</td>
				<td><input id="sex" name="sex" type="radio"  checked="checked" value="男">男
					<input id="sex" name="sex" type="radio" value="女">女
			</tr>
			<tr>
				<td>年龄</td>
				<td><input id="age" name="age" type="text" />
				</td>
			</tr>
			<tr>
			<td colspan="2">请选择班级 <select id="type" name="type" class="textarea">
					<option value="0" selected style="font-size: 12px">全部分类</option>
					<c:forEach var="teacher" items="${teacherlist}">
						<option value="${teacher.id }">${teacher.classs}</option>
					</c:forEach>
			</select></td>
			</tr>
			
			<tr>
				<td colSpan="2" align="center"><input type="submit" value="添加" />
					<input type="button" onclick="turnback()" value="返回" /></td>
			</tr>
		</table>
	</form>
	</c:when>

	<c:otherwise>
	<form method="post"
		action="<%=request.getContextPath()%>/student.do?update">
		<table>
		<tr>
				
				<td colspan="2"><input id="id" name="id" type="hidden" value=${student.id }>
				</td>
			</tr>
			<tr>
				<td>姓名</td>
				<td><input id="name" name="name" type="text" value=${student.name }></td>
			</tr>
			<tr>
				<td>密码</td>
				<td><input id="psw" name="psw" type="text" value=${student.psw }>
				</td>
			</tr>
			<tr>
				<td>性别</td>
				<td><input id="sex" name="sex" type="radio"  checked="checked" value="男">男
					<input id="sex" name="sex" type="radio" value="女">女
			</tr>
			<tr>
				<td>年龄</td>
				<td><input id="age1" name="age" type="text"  value=${student.age }>
				</td>
			</tr>
			<tr>
				<td>班级</td>
				<td>${student.teacher.classs }
				</td>
			</tr>
			<tr>
				<td>老师</td>
				<td>${student.teacher.name }
				</td>
			</tr>
			<tr>
				<td colSpan="2" align="center"><input type="submit" value="更新" />
				<input type="button" onclick="turnback()" value="返回" /></td>
			</tr>
		</table>
	</form>
	</c:otherwise>
	</c:choose>
</body>
</html>