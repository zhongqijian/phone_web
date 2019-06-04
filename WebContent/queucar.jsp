<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- 导入java.sql包 --%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta http-equiv="refresh" content="60">  
<title>备货信息</title>
<link rel="stylesheet" href="./css/bootstrap.min.css">
<style>
.page-head {
	text-align: center;
}

.content {
	display: flex;
}

.table-box {
	position: relative;
	flex: 1;
	height: 100%;
}

.table-content {
	overflow: auto;
	height: 100%;
}

.table-content .table {
	margin-bottom: 0;
}

.table-content::-webkit-scrollbar {
	display: none;
}

.table-head {
	overflow: hidden;
	position: absolute;
	top: 0;
	left: 0;
	background: #fff;
	width: 100%;
}

.table-title {
	text-align: center;
}

.table-box .table th, .table-box .table td {
	vertical-align: middle;
	white-space: nowrap;
}

.complete-table {
	margin: 0 5px;
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






	<h1 class="page-head">仓库排队备货情况</h1>
	<div class="content">
		<!-- 排队车辆顺序表 start -->
		<div class="table-box">
			<div class="table-content">
				<table class="table table-hover table-bordered table-striped">
					<thead>
						<tr>
							<th class="table-title" colspan="4">排队车辆顺序表</th>
						</tr>
						<tr>
							<th car_name="title">车牌号</th>
							<th reg_time="title">登记时间</th>
							<th load_time="title">预计装货</th>
							<th remarks="title">备注</th>
						</tr>
					</thead>
					<tbody>
						<!-- 获取列表信息 -->
						<%
							//登记信息部分的连接信息，带1的为登陆表的连接信息
							Statement stmt = null;
							ResultSet rs = null;
							String sql = "SELECT * FROM reg_car GROUP BY reg_time;"; //查询语句
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
			</div>
		</div>
		<!-- 排队车辆顺序表 end -->
	</div>
	<script>
		var docEl = document.documentElement;
		var tableBoxes = docEl.querySelectorAll('.table-box');
		var clientHeight = docEl.clientHeight;
		var content = docEl.querySelector('.content');
		var offsetTop = content.offsetTop;
		tableBoxes.forEach(function(tableBox) {
			var tableContent = tableBox.querySelector('.table-content');
			var table = tableContent.querySelector('table');
			var clone = table.cloneNode(true);
			var headHeight = table.querySelector('thead').clientHeight;
			var tableHead = document.createElement('div');
			var tBody = table.querySelector('tbody');
			var bodyClone = tBody.cloneNode(true);
			tableBox.style.height = clientHeight - offsetTop + 'px';
			var clonetrs = bodyClone.querySelectorAll('tr');
			var trs = tBody.querySelectorAll('tr');
			var lasttr = trs[trs.length - 1];
			clonetrs.forEach(function(tr) {
				tBody.appendChild(tr);
			});
			tableHead.className = 'table-head';
			tableHead.style.height = headHeight + 'px';
			tableHead.appendChild(clone);
			tableBox.insertBefore(tableHead, tableBox.firstElementChild);
			var hBottom = tableHead.getBoundingClientRect().bottom;
			scroll(tableContent, lasttr, hBottom);
		});

		function scroll(content, tr, hBottom, flag) {
			// debugger;
			if (!flag) {
				var react = tr.getBoundingClientRect();
				if (react.bottom <= hBottom) {
					content.scrollTop = 0;
				}
				content.scrollTop += 1;
			}
			flag = !flag;
			requestAnimationFrame(function() {
				scroll(content, tr, hBottom, flag);
			});
		}
	</script>
</body>

</html>