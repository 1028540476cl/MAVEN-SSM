<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta charset="utf-8">
<link href="css/checklist.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="style/jquery.1.10.1.min.js"></script>
<script type="text/javascript">
	var selAll = document.getElementById("checkAll");
	var xuanke = 0;
	function selectAll() {

		var obj = document.getElementsByName("check");
		if (document.getElementById("checkAll").checked == false) {
			for ( var i = 0; i < obj.length; i++) {
				obj[i].checked = false;
			}
		} else {
			for ( var i = 0; i < obj.length; i++) {
				obj[i].checked = true;

			}
		}

	}
	function setSelectAll(value) {
		var d;
		$.post("course.do?chongfu", {
			type : value
		}, function(data, status) {
			var xuan = "x" + value;
			document.getElementById(xuan).innerHTML = data;
			if(data=="该课程已选过"){
			$("#" + xuan).css({
				"color" : "red"
			});
			}
			
		});
		var obj = document.getElementsByName("check");
		var count = obj.length;
		var selectCount = 0;
		for ( var i = 0; i < count; i++) {
			if (obj[i].checked == true) {
				selectCount++;
			}
		}
		if (count == selectCount) {
			document.getElementById("checkAll").checked = true;
		} else {
			document.getElementById("checkAll").checked = false;
		}
		xuanke = value;
		return xuanke;
	}
	function add() {
		var obj = document.getElementsByName("check");
		var count = obj.length;
		var selectCount = 0;
		var j = 0;
		for ( var i = 0; i < count; i++) {
			if (obj[i].checked == true) {
				selectCount++;
				j = i;
			}

		}
		if (selectCount > 1 || selectCount == 0) {
			alert("一次最多只能选一门！！");
			return;
		} else {
			var va = obj[j].value;
			//alert(va);
			window.location.href = "course.do?save&va=" + va;
		}

	}
	function out() {
		var obj = document.getElementsByName("check");
		var count = obj.length;
		var selectCount = 0;
		var j = 0;
		for ( var i = 0; i < count; i++) {
			if (obj[i].checked == true) {
				selectCount++;
				j = i;
			
			}
		}
		if (selectCount > 1 || selectCount == 0) {
			alert("一次只能退选一门！！");
			return;
		} else {
			var va = obj[j].value;
			window.location.href = "course.do?saveout&va=" + va;
		}
	}
	
	function checkxuanke(){
		if(xuanke==0){
			alert("请选择你要查看的课程！！！");
		}else{
			//alert("yaoqiu"+xuanke);
			var checkxuanke = document.getElementById("yaoqiu"+xuanke).innerText;
			alert(checkxuanke);
		}
	}
	function search(){
		
	}
	$(document).ready(function() {
	/* $("#xuanke").mouseover(function(){
	 //alert(xuanke);
	 if(xuanke!=0){
	 	 $.post("course.do?chongfu", {
				type : xuanke
			}, function(data, status) {
				alert(data);
				}); 
			}
			}); */
		var i = "${message}";
		if (i == null || i == "") {
			return;
		} else {
			alert(i);
		}
	
	});
	
</script>


<body>
	<table width="100%" border="0" cellspacing="0" cellpadding="0"
		height="710">
		<tr class="righttop" align="center">
			<td width="5%" height="28"><a href="javascript:add()" >选课</a>
			</td>
			<td width="9%"><a href="javascript:out()">退选</a>
			</td>
			<td width="11%"><a href="javascript:checkxuanke()">查看选课请求</a>
			</td>
			<td width="14%"><a href="">帮助</a>
			</td>
			<td colspan="7" style="font-size:16px;" align="left">开课单位:<input
				type="text" placeholder="请输入开课单位"
				style="height:25px; padding: 3px;width: 100px;">
				&nbsp;输入关键字:<input type="text"
				style="height:25px; padding: 3px;width: 100px;" placeholder="请输入关键字"><input
				type="button" value="搜索" style="height:25px;" onclick="search()">
			</td>
		</tr>
		<tr align="center" class="rightc1">
			<td height="31"><input type="checkbox" id="checkAll"
				onclick="selectAll()" value="all">&nbsp;全选</td>
			<td>开课单位</td>
			<td>选课类别</td>
			<td>教学班名称</td>
			<td>任课老师</td>
			<td width="12%">上课时间</td>
			<td width="6%">学分</td>
			<td>剩余容量</td>
			<td width="6%">选课人数</td>
			<td width="5%">总容量</td>
			<td width="15%">选课要求</td>
		</tr>
		<tr>
			<td colspan="11" height="618" valign="top"><c:choose>
					<c:when test="${page.list.size()==0||page.list==null }">
						<div align="center">
							<a style="font-size:18pt;">没有该类型课程</a>
						</div>
					</c:when>
					<c:otherwise>
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<c:forEach items="${page.list}" var="course" varStatus="state">
								<c:if test="${(state.index+1)%2==1 }">
									<tr align="center" height="31" class="cent">
										<td width="5%"><input type="checkbox" name="check"
											id="check" onclick="setSelectAll(this.value)"
											value="${course.id }">&nbsp;<a id="x${course.id }">选择

										
										</td>
										<td width="9%" title="${course.teacher.nameclass }">${course.teacher.nameclass
											}</td>
										<td width="11%" title="${coursetype }">${coursetype }</td>
										<td width="14%" title="${course.coursename }">${course.coursename
											}</td>
										<td width="10%" title="${course.teacher.name }">${course.teacher.name
											}</td>
										<td width="12%" title="${course.coursetime }">${course.coursetime
											}19:00-21:30</td>
										<td width="6%" title="${course.coursebord }">${course.coursebord
											}</td>
										<td width="7%" title="${course.coursesy }"><c:if
												test="${course.coursesy==0 }">
												<a style="color: red">已满</a>
											</c:if> <c:if test="${course.coursesy!=0 }">${course.coursesy }</c:if>
										</td>
										<td width="6%" title="${course.coursepeople }">${course.coursepeople
											}</td>
										<td width="5%" title="${course.coursecount }">${course.coursecount
											}</td>
										<td width="15%" title="${course.cotein }" id="yaoqiu${course.id }">${course.cotein
											}</td>
									</tr>
								</c:if>
								<c:if test="${(state.index+1)%2==0 }">
									<tr align="center" height="31" class="cent1">
										<td width="5%"><input type="checkbox" name="check"
											id="check" onclick="setSelectAll(this.value)"
											value="${course.id }">&nbsp;<a id="x${course.id }">选择

										
										</td>
										<td width="9%" title="${course.teacher.nameclass }">${course.teacher.nameclass
											}</td>
										<td width="11%" title="${coursetype }">${coursetype }</td>
										<td width="14%" title="${course.coursename }">${course.coursename
											}</td>
										<td width="10%" title="${course.teacher.name }">${course.teacher.name
											}</td>
										<td width="12%" title="${course.coursetime }">${course.coursetime
											}19:00-21:30</td>
										<td width="6%" title="${course.coursebord }">${course.coursebord
											}</td>
										<td width="7%" title="${course.coursesy }"><c:if
												test="${course.coursesy==0 }">
												<a style="color: red">已满</a>
											</c:if> <c:if test="${course.coursesy!=0 }">${course.coursesy }</c:if>
										</td>
										<td width="6%" title="${course.coursepeople }">${course.coursepeople
											}</td>
										<td width="5%" title="${course.coursecount }">${course.coursecount
											}</td>
										<td width="15%" title="${course.cotein }" id="yaoqiu${course.id }" >${course.cotein
											}</td>
									</tr>
								</c:if>
							</c:forEach>
						</table>
					</c:otherwise>
				</c:choose>
			</td>

		</tr>
		<tr>
			<td colspan="11" height="32" class="page">
				<table width="100%" border="0" cellspacing="0" cellpadding="0"
					height="100%">
					<c:choose>
						<c:when test="${page.list.size()==0||page.list==null }">
							<tr>
								<td align="left"
									style=" padding-left: 10px; padding-top:10px; font-size:14px; padding-right:10px;font-weight:bolder;color:#999;">
									首页&nbsp; 上一页&nbsp; 当前第<input type="text" value="1" disabled
									style="height:20px; padding:1px;width:20px;">页&nbsp;
									下一页&nbsp; 尾页</td>

								<td align="right"
									style="padding-right:10px;  font-size:16px; color:#999;">
									<strong> 当前无数据</strong></td>
							</tr>
						</c:when>
						<c:otherwise>
							<tr>
							<c:if test="${page.pageNo==page.pageNoOver&&page.pageNo==page.pageNoOne}">
							<td align="left"
									style=" padding-left: 10px; padding-top:10px; font-size:14px; padding-right:10px;font-weight:bolder;color:#999;">
									首页&nbsp; 上一页&nbsp; 当前第<input type="text" value="1" disabled
									style="height:20px; padding:1px;width:20px;">页&nbsp;
									下一页&nbsp; 尾页</td>
							</c:if>
							<c:if test="${page.pageNo==1&&page.pageNo<page.pageNoOver}">
								<td align="left"
									style=" padding-left: 10px; padding-top:10px; font-size:14px; padding-right:10px;font-weight:bolder; color:#999">
									首页&nbsp;上一页&nbsp;
									当前第<input type="text" value="${page.pageNo }" disabled
									style="height:20px; padding:1px;width:20px;">页&nbsp; <a
									href="course.do?all&coursetype=${pagetype}&pageNo=${page.pageNoLast}">下一页</a>&nbsp; <a href="course.do?all&coursetype=${pagetype}&pageNo=${page.pageNoOver}"><strong>尾页</strong> </a>
								</td> 
							</c:if>
							<c:if test="${page.pageNo==page.pageNoOver&&page.pageNo>page.pageNoOne }">
							 <td align="left"
									style=" padding-left: 10px; padding-top:10px; font-size:14px; padding-right:10px;font-weight:bolder;color:#999">
									<a href="course.do?all&coursetype=${pagetype}&pageNo=${page.pageNoOne}"><strong>首页</strong> </a>&nbsp; <a href="course.do?all&coursetype=${pagetype}&pageNo=${page.pageNoFrist}">上一页</a>&nbsp;
									当前第<input type="text" value="${page.pageNo }" disabled
									style="height:20px; padding:1px;width:20px;">页&nbsp;下一页&nbsp;尾页
								</td> 
							</c:if>
								<c:if test="${page.pageNo<page.pageNoOver&&page.pageNo>page.pageNoOne }">
							 <td align="left"
									style=" padding-left: 10px; padding-top:10px; font-size:14px; padding-right:10px;font-weight:bolder;color:#999">
									<a href="course.do?all&coursetype=${pagetype}&pageNo=${page.pageNoOne}"><strong>首页</strong> </a>&nbsp; <a href="course.do?all&coursetype=${pagetype}&pageNo=${page.pageNoFrist}">上一页</a>&nbsp;
									当前第<input type="text" value="${page.pageNo }" disabled
									style="height:20px; padding:1px;width:20px;">页&nbsp; <a
									href="course.do?all&coursetype=${pagetype}&pageNo=${page.pageNoLast}">下一页</a>&nbsp; <a href="course.do?all&coursetype=${pagetype}&pageNo=${page.pageNoOver}"><strong>尾页</strong> </a>
								</td> 
								</c:if>
								<td align="right" style="padding-right:10px;  font-size:16px;">
									<strong> 当前${page.psize}条记录/总${page.totalRecords }条记录</strong>
								</td>
								
							</tr>
						</c:otherwise>
					</c:choose>

				</table>
			</td>

		</tr>
	</table>
</body>


