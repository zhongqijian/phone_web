<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.ts.Car_info_ts"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://apps.bdimg.com/libs/jquerymobile/1.4.5/jquery.mobile-1.4.5.min.css">
<script src="https://apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
<script
	src="https://apps.bdimg.com/libs/jquerymobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<title>排队车辆列表</title>
</head>
<body>


	<div data-role="page">
		<div data-role="header">
			<h1>排队车辆列表</h1>

		</div>
		<table align="center" width="450" border="1" height="180"
			bordercolor="white" bgcolor="black" cellpadding="1" cellspacing="1">
			<tr bgcolor="white">
				<td align="center" colspan="5">
					<h2>所有车辆信息</h2>
				</td>
			</tr>
			<tr align="center" bgcolor="#e1ffc1">
				<td><b>车牌号码</b></td>
				<td><b>司机名称</b></td>
				<td><b>司机电话</b></td>
				<td><b>登记时间</b></td>
				<td><b>预计装货</b></td>
			</tr>
			<%
				// 获取车辆信息集合
				List<Car_info_ts> list = (List<Car_info_ts>)request.getAttribute("list");	
				// 判断集合是否有效
				if (list == null || list.size() < 1) {
					out.print("无排队车辆！");
				} else {
					// 遍历图书集合中的数据
					for (Car_info_ts car : list) {
			%>
			<tr align="center" bgcolor="white">
				<td><%=car.getCar_name()%></td>
				<td><%=car.getCar_Driver()%></td>
				<td><%=car.getCar_phone()%></td>
		    	<td><%=car.getReg_time()%></td>
				<td><%=car.getLoad_time()%></td>
			</tr>
			<%
				}
				}
			%>
		</table>
		<div data-role="footer">
			<h1>合庆仓库车辆登记</h1>
		</div>
	</div>
</body>
</html>