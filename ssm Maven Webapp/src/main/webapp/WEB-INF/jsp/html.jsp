<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<meta charset="utf-8">
<style>
*{margin:0;padding:0}
.righttop {
	background-image: url(image/righttop.jpg);
	height: 28px;
	width: 100%;
	font-size: 12px;
	font-weight: 900;
}
a {
	color: #000;
	text-decoration: none;
	font-size: 14px;
}
a:hover{
	color:red;
	text-decoration: none;
	font-size: 16px;
}
.rightc1{background-image:url(image/rigthc.jpg); height:31px;font-size: 12px; width:80%; font-family:Arial, Helvetica, sans-serif;}
.cent{
	font-size:14px;
	font-family:"微软雅黑", "宋体";
}
.cent1{
	font-size:14px;
	font-family:"微软雅黑", "宋体"; background-color:#3CF;
}
</style>

<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0" height="710">

  <tr class="righttop" align="center">
    <td width="5%" height="28" ><a href="">选课</a></td>
    <td width="9%"><a href="">退选</a></td>
    <td width="11%"><a href="">查看选课请求</a></td>
    <td width="14%"><a href="">帮助</a></td>
    <td colspan="7" style="font-size:16px;">开课单位:<input type="text"  placeholder="  请输入开课单位" style="height:25px; padding: 3px;">
    	&nbsp;输入关键字:<input type="text" style="height:25px; padding: 3px;"placeholder="  请输入关键字" ><input type="button" value="搜索" style="height:25px;"  ></td>
  </tr>
  <tr align="center" class="rightc1">
    <td height="31" ><input type="checkbox" id="checkAll" onclick="selectAll()" value="all">&nbsp;全选</td>
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
    <td colspan="11" height="618" valign="top" >
    <table width="100%" border="0" cellspacing="0" cellpadding="0"  > 
    </table>
    </td>
    
  </tr>
    <tr>
    <td colspan="11"  height="32">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" height="100%"> 
    <tr>
    <td>分页</td>
    </tr>
    </table>
    </td>
    
  </tr>
</table>
</body>