<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.ts.Car_info_ts"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>排队车辆列表</title>
</head>
<body>
	<script>
		function check(form) {
			with (form) {
				if (load_time.value == "") {
					alert("请输入更新数量！");
					return false;
				}
				return true;
				;
			}
		}
	</script>
	<%
		Date date = new Date();
		SimpleDateFormat dfload = new SimpleDateFormat("YYYY-MM-dd hh:mm");
		String todayload = dfload.format(date);
	%>
	<table align="center" width="100%" border="1" height="180"
		bordercolor="white" bgcolor="black" cellpadding="1" cellspacing="1">
		<tr bgcolor="white">
			<td align="center" colspan="8">
				<h2>所有车辆信息</h2>
			</td>
		</tr>
		<tr align="center" bgcolor="#e1ffc1">
			<td><b>车牌号码</b></td>
			<td><b>司机名称</b></td>
			<td><b>司机电话</b></td>
			<td><b>登记时间</b></td>
			<td><b>预计装货</b></td>
			<td><b>备注</b></td>
			<td><b>修改装货时间</b></td>
			<td><b>装运完成</b></td>
		</tr>
		<%
			// 获取车辆信息集合
			List<Car_info_ts> list = (List<Car_info_ts>) request.getAttribute("list");
			// 判断集合是否有效
			if (list == null || list.size() < 1) {
				out.print("无排队车辆！");
			} else {
				// 遍历车辆集合中的数据
				for (Car_info_ts car : list) {
		%>
		<tr align="center" bgcolor="white">
			<td><%=car.getCar_name()%></td>
			<td><%=car.getCar_Driver()%></td>
			<td><%=car.getCar_phone()%></td>
			<td><%=car.getReg_time()%></td>
			<td><%=car.getLoad_time()%></td>
			<td><%=car.getRemarks()%></td>
			<td>
				<form action="UpdateServlet" method="post"
					onsubmit="return check(this);">
					<input type="hidden" name="car_name" value="<%=car.getCar_name()%>">
					<input type="text" name="load_time" value="<%=todayload%>"
						size="18"> <input type="submit" value="修  改">
				</form>
			</td>
			<td><a href="DeleteServlet?car_name=<%=car.getCar_name()%>">装运完成</td>
		</tr>
		<%
			}
			}
		%>
	</table>
</body>
</html>