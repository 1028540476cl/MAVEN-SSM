<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>主页</title>
<script language="javascript"
	src="../../style/jquery.1.10.1.min.js"></script>
<script type="text/javascript">
function turnback(){   
    window.location.href="<%=request.getContextPath()%>/teacher.do?all";
    }
    function check(){
    var student = document.getElementById("student");
    var butt = document.getElementById("butt");
    //alert(student);
    if(student.style.display=="block"){
    butt.value="显示学生";
    student.style.display="none";
    }else{
     butt.value="隐藏学生";
    student.style.display="block";
    }
    }
</script>
</head>
<body>
	<c:choose>
		<c:when test="${teacher==null }">

			<form method="post" action="teacher.do?save">
				<table>
					<tr>
						<td>姓名</td>
						<td><input id="name" name="name" type="text" /></td>
					</tr>
					<tr>
						<td>职位</td>
						<td><input id="job" name="job" type="text" /></td>
					</tr>
					<tr>
						<td>班级</td>
						<td><input id="classs" name="classs" type="text" /></td>
					</tr>
					<tr>
						<td>头像</td>
						<td><input id="picture" name="picture" type="file" /></td>
					</tr>
					<tr>
						<td colSpan="2" align="center"><input type="submit"
							value="添加" /> <input type="button" onclick="turnback()"
							value="返回" />
						</td>
					</tr>
				</table>
			</form>
		</c:when>

		<c:otherwise>
			<form method="post" action="teacher.do?update">
				<table>
					<tr>

						<td colspan="2"><input id="id" name="id" type="hidden"
							value=${teacher.id }></td>
					</tr>
					<tr>
						<td>姓名</td>
						<td><input id="name" name="name" type="text"
							value=${teacher.name }></td>
					</tr>
					<tr>
						<td>职位</td>
						<td><input id="job" name="job" type="text"
							value=${teacher.job }></td>
					</tr>
					<tr>
						<td>班级</td>
						<td><input id="classs" name="classs" type="text"
							value=${teacher.classs }></td>
					</tr>
					<tr>
						<td>头像</td>
						<td><img src="image/f.jpg"></td>
					</tr>
						<tr>
						<td colspan="2"><input id="picture" name="picture" type="file" /></td>
					</tr>
					<tr>
						<td colSpan="2" align="center"><input type="submit"
							value="更新" /> <input type="button" onclick="turnback()"
							value="返回" />
							
						</td>
					</tr>
					</table>
					<input id ="butt" type="button" onclick="check()"
							value="显示学生" />
					<div id="student" style="display:none" >
					<table >
					<tr>
						<td>序号</td>
						<td>姓名</td>
						<td>密码</td>
						<td>年龄</td>
						<td>性别</td>
					</tr>
					<c:forEach items="${teacher.students }" var="student">
						<tr id="<c:out value="${student.id}"/>">
							<td><c:out value="${student.id}" /></td>
							<td><c:out value="${student.name}" /></td>
							<td><c:out value="${student.psw}" /></td>
							<td><c:out value="${student.age}" /></td>
							<td><c:out value="${student.sex}" /></td>
						</tr>
					</c:forEach>
				</table>
				</div>
			</form>
		</c:otherwise>
	</c:choose>
</body>
</html>