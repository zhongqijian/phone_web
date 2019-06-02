<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://apps.bdimg.com/libs/jquerymobile/1.4.5/jquery.mobile-1.4.5.min.css">
<script src="https://apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
<script
	src="https://apps.bdimg.com/libs/jquerymobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<title>排队信息登记</title>
</head>
<body>
	<script language="JavaScript">
		function check() {
			if (caradd.car_name.value == "") {
				alert("请正确输出车牌号码");
				caradd.car_name.focus();
				return false;
			}
			var re = /^[\u4e00-\u9fa5]{1}[A-Z]{1}[A-Z_0-9]{5}$/;
			var re = /^[京津沪渝冀豫云辽黑湘皖鲁新苏浙赣鄂桂甘晋蒙陕吉闽贵粤青藏川宁琼使领A-Z]{1}[A-Z]{1}[A-Z0-9]{4}[A-Z0-9挂学警港澳]{1}$/;
			if(caradd.car_name.value.search(re) == -1) {
				alert("你输入的车牌号有问题！！");
				return false;
			} 
		}
	</script>
	<%
		Date date = new Date();
		SimpleDateFormat df = new SimpleDateFormat("YYYY-MM-dd hh:mm:ss");
		String today = df.format(date);
	%>
	<div data-role="page">
		<div data-role="header">
			<h1>车辆信息登记</h1>
		</div>
		<form action="release.jsp" method="post" name="caradd"
			onsubmit="return check()">
			<div data-role="main" class="ui-content">
				<table border="0">
					<tr>
						<td>当前时间:</td>
						<td><%=today%></td>
					</tr>
					<tr>
						<td>车牌号码:</td>
						<td><input type="text" name="car_name" size="30"></td>
						<td><font color="red">*必填</font></td>
					</tr>
					<tr>
						<td>司机姓名:</td>
						<td><input type="text" name="car_Driver" size="30"></td>
						<td><font color="green">*选填</font></td>
					</tr>
					<tr>
						<td>司机电话:</td>
						<td><input type="text" name="car_phone" size="30"></td>
						<td><font color="green">*选填</font></td>
					</tr>
					<tr>
						<td align="center" colspan="2"><input type="submit"
							value="开始排队"></td>
					</tr>
				</table>
			</div>
		</form>
		<div data-role="footer">
			<h1>合庆仓库车辆登记</h1>
		</div>
	</div>
</body>
</html>
