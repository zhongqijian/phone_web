package com.ts;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String car_name = String.valueOf(request.getParameter("car_name"));
		try {
			Class.forName("com.mysql.jdbc.Driver"); //// 驱动程序名
			String url = "jdbc:mysql://120.27.223.199:3306/show_car?useUnicode=true&characterEncoding=utf-8&useSSL=false"; // 数据库名
			String username = "root"; // 数据库用户名
			String password = "LEO@zhong1988"; // 数据库用户密码
			Connection conn = DriverManager.getConnection(url, username, password); // 连接状态
			// 添加图书信息的SQL语句
			String sql = "delete from reg_car where car_name=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, car_name);
			ps.executeUpdate();
			ps.close();
			conn.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}