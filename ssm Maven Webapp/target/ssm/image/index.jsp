<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>首页界面</title>
<script type="text/javascript">   
function turnback(){   
    window.location.href="student.do?all";   
}
function login(){   
    window.location.href="teacher.do?tostudent";   
} 

function tturnback(){   
    window.location.href="teacher.do?all";   
}
function tlogin(){   
    window.location.href="teacher.do?to";   
} 
</script>
</head>
<body>
<table >
<tr><td>这是一个springMVC+hibernate+spring，我们来开始添加学生等。</td></tr>
<tr align="center"><td>
<input type="button" onclick="login()" value="添加" />
	
	<input type="button" onclick="turnback()" value="列表" />

</td>
</tr>
<tr><td>这是一个springMVC+hibernate+spring，我们来开始对老师进行操作。</td></tr>
<tr align="center"><td>
<input type="button" onclick="tlogin()" value="添加" />
	
	<input type="button" onclick="tturnback()" value="列表" />

</td></tr>
	</table>
</body>
</html>