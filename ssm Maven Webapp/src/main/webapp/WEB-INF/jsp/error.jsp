<%@page pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>错误界面</title>
<style>
#error {
	width: 960px;
	text-align: center;
	margin-top: 400px;
	padding-left:250px;
}

#error a:hover {
	text-decoration:none;
	cursor: pointer;
}

body.error_page {
	background-color: #00629f;
	background-image: url(image/error.png);
	background-position: center top;
	background-repeat: no-repeat;
}

#error {
	color: #FFF;
}

#error span,#error a {
	color: Yellow;
}

#error a:hover {
	color: #FFF;
}
</style>
<script language="javascript" type="text/javascript">
            var timer;
            //启动跳转的定时器
            function startTimes() {
                timer = window.setInterval(showSecondes,1000);
            }

            var i = 5;
            function showSecondes() {
                if (i > 0) {
                    i--;
                    document.getElementById("secondes").innerHTML = i;
                }
                else {
                    window.clearInterval(timer);
                    location.href = "student.do?tologin";
                }
            }

            //取消跳转
            function resetTimer() {
                if (timer != null && timer != undefined) {
                    window.clearInterval(timer);
                    location.href = "student.do?tologin";
                }
            }
        </script>
</head>
<body class="error_page" onload="startTimes();">
	<h1 id="error">
		${message},&nbsp;<span id="secondes">5</span>&nbsp;秒后将自动跳转登录界面，立即跳转请点击&nbsp; <a
			href="javascript:resetTimer();">返回</a>
	</h1>
</body>
</html>
