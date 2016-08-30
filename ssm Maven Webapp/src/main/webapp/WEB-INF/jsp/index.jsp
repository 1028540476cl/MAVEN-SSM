<%@ page language="java" import="java.util.*" pageEncoding="utf-8" import="com.cl.ssm.util.*"%>
<%-- <%request.getSession().setAttribute("md5RandomKey", MD5.getRandomNum(10));  %> --%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>登陆</title>
<link href="css/css.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="style/jquery.1.10.1.min.js"></script>
<script type="text/javascript" src="js/index.js"></script>
</head>
<body>
	<form action="student.do?to" method="post" id="login" name="login">
		<div class="login">
			<div class="top">
				<div class="logo">
					<img src="image/logo.png" width="192" height="64">
				</div>
				<div class="wenzi">登录界面</div>
			</div>
			<div class="center">
				<div class="username">
					学&nbsp;&nbsp;&nbsp;号：<input type="text" id="studentid"
						name="studentid" height="25px" width="190px" style=" padding:5px;"
						placeholder="  请输入你的学号" onMouseOut="getpassword()">
				</div>
				<div class="tp">
					<img src="image/center.jpg" width="450" height="210">
				</div>
				<div class="username">
					密&nbsp;&nbsp;&nbsp;码：<input type="password" id="password"
						name="password" height="25px" width="190px" style=" padding:5px;"
						placeholder="  请输入你的密码"><input name="check" id="check"
						type="checkbox" height="25px" value="y" onclick="checkbox()">记住
				</div>
				<div class="username">
					验证码：<input type="text" id="inputCode" height="25px" width="190px"
						style=" padding:5px;" placeholder="  请输入验证码">
				</div>
				<div class="code" id="checkCode" onclick="createCode()"></div>
				<div class="s">
					<a onclick="createCode()">换一张</a>
				</div>
				<div style="clear:both"></div>
				<div class="bt">
					<input type="button" value="登录" class="btn1"
						onclick="validateCode()">
				</div>
				<div class="bt">
					<input type="reset" value="重置" class="btn2">
				</div>
			</div>
		</div>
	</form>
</body>
</html>
