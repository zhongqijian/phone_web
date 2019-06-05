package com.ts;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
    public UpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	*/


	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String car_name=String.valueOf(request.getParameter("car_name"));
		String load_time=String.valueOf(request.getParameter("load_time"));
		//String car_name1=String.valueOf(request.getParameter(car_name).getBytes("iso-8859-1"),"uft"
		//String str = new String(request.getParameter("参数名").getBytes("iso-8859-1"), "utf-8"); 
		
		try {
			Class.forName("com.mysql.jdbc.Driver"); //// 驱动程序名
			String url = "jdbc:mysql://120.27.223.199:3306/show_car?useUnicode=true&characterEncoding=utf-8&useSSL=false"; // 数据库名
			String username = "root"; // 数据库用户名
			String password = "LEO@zhong1988"; // 数据库用户密码
			Connection conn = DriverManager.getConnection(url, username, password); // 连接状态
			// 获取Statement
			//Statement stmt = conn.createStatement();
			// 添加图书信息的SQL语句
			String sql = "update reg_car set load_time=? where car_name=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, load_time);
			ps.setString(2, car_name);
			ps.executeUpdate();
			ps.close();
			conn.close();
		}catch(Exception e) {
			System.out.print("更新失败");
			e.printStackTrace();
		}
		response.sendRedirect("FinServlet");
	}
}
