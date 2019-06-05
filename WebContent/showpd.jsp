<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- 导入java.sql包 --%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<!--css样式是锁定表头不动的-->
<style type="text/css">
.table {
	width: 100%;
	left: 30%;
	border-collapse: collapse;
	border-spacing: 0;
}

.fixedThead {
	display: block;
	width: 100%;
}

.scrollTbody {
	display: block;
	height: 316px;
	overflow: hidden;
	width: 100%;
}

.table td {
	width: 300px;
	border-bottom: #333 1px dashed;
	padding: 5px;
	background-color: #ddd;
}

.table th {
	width: 500px;
	border-bottom: #333 1px dashed;
	border-top: #333 1px dashed;
	padding: 5px;
	line-height: 24px;
	background-color: #cfc;
}

.table tr {
	border-bottom: #333 1px dashed;
	line-height: 24px;
	padding: 10px;
}

thead.fixedThead tr th:last-child {
	color: #FF0000;
}
</style>
<SCRIPT>
	//先在table的最后增加一行，然后再把第一行中的数据填充到新增加的行中，最后再删除table的第一行
	function change(table) {
		var row = table.insertRow(table.rows.length);//在table的最后增加一行,table.rows.length是表格的总行数
		for (j = 0; j < table.rows[0].cells.length; j++) {//循环第一行的所有单元格的数据，让其加到最后新加的一行数据中（注意下标是从0开始的）
			var cell = row.insertCell(j);//给新插入的行中添加单元格
			cell.height = "24px";//一个单元格的高度，跟css样式中的line-height高度一样
			cell.innerHTML = table.rows[0].cells[j].innerHTML;//设置新单元格的内容，这个根据需要，自己设置
		}
		table.deleteRow(0);//删除table的第一行
	};
	function tableInterval() {
		var table = document.getElementById("one");//获得表格
		change(table);//执行表格change函数，删除第一行，最后增加一行，类似行滚动
		var table = document.getElementById("two");//获得表格
		change(table);//执行表格change函数，删除第一行，最后增加一行，类似行滚动
		var table = document.getElementById("three");//获得表格
		change(table);//执行表格change函数，删除第一行，最后增加一行，类似行滚动
	};
	setInterval("tableInterval()", 3200);//每隔2秒执行一次change函数，相当于table在向上滚动一样
</SCRIPT>
</head>
<body>
	<!-- 连接数据库 -->
	<%
		Class.forName("com.mysql.jdbc.Driver"); ////驱动程序名
		String url = "jdbc:mysql://120.27.223.199:3306/show_car?useUnicode=true&characterEncoding=utf-8&useSSL=false"; //数据库名
		//String DB_URL = "jdbc:mysql://172.17.192.95:3306/sys_check";
		String username = "root"; //数据库用户名
		String password = "LEO@zhong1988"; //数据库用户密码
		Connection conn = DriverManager.getConnection(url, username, password); //连接状态
	%>
	<table width="100%" border="1">
		<tr width="100%">
			<td align="center" style="font-family:DFKai-sb"><font size="15" color="red">合庆仓库排队备货情况</font></td>
		</tr>
	</table>
	<table width="100%" border="1">
		<tr>
			<!-- 第一个模块展示 排队车辆顺序表-->
			<td width="260px" align="center" style="word-wrap: break-word;">
				<table width="100%" class="table" align="center">
					<thead class="fixedThead" align="center">
						<tr><font size="5" color="red">排队车辆顺序表</font>
						</tr>
						<tr>
							<th car_name="title">车牌号</th>
							<th reg_time="title">登记时间</th>
							<th load_time="title">预计装货</th>
							<th remarks="title">备注</th>
						</tr>
					</thead>
					<tbody id="one" class="scrollTbody" align="center">
						<%
							//登记信息部分的连接信息，带1的为登陆表的连接信息
							Statement stmt = null;
							ResultSet rs = null;
							String sql = "SELECT * FROM reg_car;"; //查询语句
							stmt = conn.createStatement();
							rs = stmt.executeQuery(sql);
							while (rs.next()) {
						%>
						<tr>
							<td><%=rs.getString("car_name")%></td>
							<td><%=rs.getString("reg_time")%></td>
							<td><%=rs.getString("load_time")%></td>
							<td><%=rs.getString("remarks")%></td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
			</td>
			<!-- 第二个模块展示 备货已完成任务单号-->
			<td width="260px" align="center" style="word-wrap: break-word;">
				<table width="100%" class="table" align="center">
					<thead class="fixedThead" align="center">
						<tr><font size="5" color="red">备货已完成任务单号</font>
						</tr>

						<tr>
							<th number="title1">单号</th>
							<th weight="title1">吨位</th>
							<th city="title1">城市</th>
							<th complete_time="title1">完成时间</th>
						</tr>
					</thead>
					<tbody id="two" class="scrollTbody" align="center">
						<%
							Statement stmt1 = null;
							ResultSet rs1 = null;
							String sql1 = "SELECT * FROM arrange_car where state=1"; //查询语句
							stmt1 = conn.createStatement();
							rs1 = stmt1.executeQuery(sql1);

							while (rs1.next()) {
						%>
						<tr>
							<td><%=rs1.getString("number")%></td>
							<td><%=rs1.getString("weight")%>吨</td>
							<td><%=rs1.getString("city")%></td>
							<td><%=rs1.getString("complete_time")%></td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
			</td>
		
			</td>
		</tr>
	</table>
</body>
</html>