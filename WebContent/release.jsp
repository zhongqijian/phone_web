<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%-- 导入java.sql包 --%>
<%@ page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
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
	<%request.setCharacterEncoding("UTF-8"); %>
	<jsp:useBean id="car_info" class="com.ts.Car_info_ts"></jsp:useBean>
	<jsp:setProperty property="*" name="car_info"/>
	<%
		Date date = new Date();
		SimpleDateFormat df = new SimpleDateFormat("YYYY-MM-dd hh:mm");
		String today_now = df.format(date);
	%>
	<!-- 处理获取到的参数，准备写入数据库 -->
	<%
		String car_name = request.getParameter("car_name");
		String car_Driver = request.getParameter("car_Driver");
		String car_phone = request.getParameter("car_phone");
	%>
	
	
	<!-- 连接数据库 -->
	<%
		try{
			Class.forName("com.mysql.jdbc.Driver"); ////驱动程序名
			String url = "jdbc:mysql://120.27.223.199:3306/show_car?useUnicode=true&characterEncoding=utf-8&useSSL=false"; //数据库名
			//String DB_URL = "jdbc:mysql://172.17.192.95:3306/sys_check";
			String username = "root"; //数据库用户名
			String password = "LEO@zhong1988"; //数据库用户密码
			Connection conn = DriverManager.getConnection(url, username, password); //连接状态
			String sql="insert into reg_car(car_name,car_Driver,car_phone)values(?,?,?)";
			//获取PreparedStatement
			PreparedStatement ps = conn.prepareStatement(sql);
			//设置车牌号
			ps.setString(1, car_info.getCar_name());
			//设置司机姓名
			ps.setString(2, car_info.getCar_Driver());
			//设置司机电话
			ps.setString(3, car_info.getCar_phone());
			//执行更新操作，返货受影响的行数
			int row = ps.executeUpdate();
			//判断更新是否成功
			if(row >0){
				//更新信息输出
				out.print("车辆信息登记成功");
			}
			//关闭PreparedStatement,释放资源
			ps.close();
			//关闭Connection,释放资源
			conn.close();
		}catch(Exception e){
			out.print("信息添加失败，请核查信息重新添加");
			e.printStackTrace();
		}
	%>

	
	
	
	

	<div data-role="page">
		<div data-role="header">
			<h1>车辆信息登记</h1>
		</div>
		<table>
			<tr><td>车牌号为：<%=car_name%></td></tr>
			<tr><td>司机姓名为：<%=car_Driver%></td></tr>
			<tr><td>司机电话为：<%=car_phone%></td></tr>		
		</table>
		
		
		<div data-role="footer">
			<h1><a href="index.jsp">返回主页面</a></h1>
		</div>
	</div>

</body>
</html>
