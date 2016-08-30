<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>主界面</title>
<link href="css/check.css" rel="stylesheet" type="text/css">
</head>

<body>

	<div class="top">
		<div class="logo">
			<div class="im">

				<div class="bj">
					<div class="wenzi">
						欢迎你：<a style="color:red; font-size:14px;">${student.name }&nbsp;${student.studentclass }</a>
					</div>
					<div class="wenzi">
						当前<a style="color:red; font-size:14px;">1</a>个人在线
					</div>

					<div class="wenzi" style="float:right; padding-right:10px;">
						<a href="#">[友情链接]</a>
					</div>
					<div class="wenzi" style="float:right; ">
						<a href="student.do?loginout">[退出]</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div style="clear:both"></div>
	<div class="centre">
		<div class="left">
			<div style="clear:both"></div>
			<div class="lefttop">课程类别</div>
			<div class="course">
				<div class="kc">
					<a href="course.do?all&coursetype=1" target="iframe"> 体育任选[体育]</a>
				</div>
				<div class="kc">
					<a href="course.do?all&coursetype=2" target="iframe"> 必修</a>
				</div>
				<div class="kc">
					<a href="course.do?all&coursetype=3" target="iframe"> 专选</a>
				</div>
				<div class="kc">
					<a href="course.do?all&coursetype=4" target="iframe">
						必修分组</a>
				</div>
				<div class="kc">
					<a href="course.do?all&coursetype=5" target="iframe">
						专选分组</a>
				</div>
				<div class="kc">
					<a href="course.do?all&coursetype=6" target="iframe"> 任选[公选]</a>
				</div>
				<div class="kc">
					<a href="course.do?all&coursetype=7" target="iframe"> 已选课程</a>
				</div>
			</div>
		</div>
		<div class="right">
			<div class="righttop2">
				<div class="ce">
					<IFRAME src="default.html" frameBorder=0 scrolling="auto" class="if"
						name="iframe" id="iframe"></IFRAME>
				</div>

				<div style="clear:both"></div>
			</div>

		</div>
	</div>
</body>
</html>

