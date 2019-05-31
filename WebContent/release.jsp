<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%-- 导入java.sql包 --%>
<%@ page import="java.sql.*"%>
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
</head>
<title>排队号码</title>
<body>
	<%
		Date date = new Date();
		SimpleDateFormat df = new SimpleDateFormat("YYYY-MM-dd hh:mm");
		String today = df.format(date);
	%>
	<!-- 连接数据库 -->
	<%
		Class.forName("com.mysql.jdbc.Driver"); ////驱动程序名
		String url = "jdbc:mysql://120.27.223.199:3306/show_car?useUnicode=true&characterEncoding=utf-8&useSSL=false"; //数据库名
		//String DB_URL = "jdbc:mysql://172.17.192.95:3306/sys_check";
		String username = "root"; //数据库用户名
		String password = "LEO@zhong1988"; //数据库用户密码
		Connection conn = DriverManager.getConnection(url, username, password); //连接状态
		String sql="insert into reg_car(car_name,car_Driver,cat_phone,reg_time)values(?,?,?,?)";
	%>
	<!-- 获取到提交的参数 -->
	<%
		String carnumber = request.getParameter("carnumber");
		String carname = request.getParameter("carname");
		String carphone = request.getParameter("carphone");
	%>


	<div data-role="page">
		<div data-role="header">
			<h1>车辆信息登记</h1>
		</div>
		<table>
			<tr><td>车牌号为：<%=carnumber%></td></tr>
			<tr><td>司机姓名为：<%=carname%></td></tr>
			<tr><td>司机电话为：<%=carphone%></td></tr>		
		</table>
		
		
		<div data-role="footer">
			<h1>底部文本</h1>
		</div>
	</div>

</body>
</html>
