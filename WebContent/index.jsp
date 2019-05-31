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
	<%
		Date date = new Date();
		SimpleDateFormat df = new SimpleDateFormat("YYYY-MM-dd hh:mm");
		String today = df.format(date);
	%>


	<div data-role="page">
		<div data-role="header">
			<h1>车辆信息登记</h1>
		</div>
		<form action="release.jsp" method="post">
			<div data-role="main" class="ui-content">
				<table border="0">
					<tr>
						<td>当前时间:</td>
						<td><%=today%></td>
					</tr>
					<tr>
						<td>车牌号码:</td>
						<td><input type="text" name="carnumber" size="30"></td>
						<td><font color="red">*必填</font></td>
					</tr>
					<tr>
						<td>司机姓名:</td>
						<td><input type="text" name="carname" size="30"></td>
						<td><font color="green">*选填</font></td>
					</tr>
					<tr>
						<td>司机电话:</td>
						<td><input type="text" name="carphone" size="30"></td>
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
			<h1>底部文本</h1>
		</div>
	</div>

</body>
</html>
