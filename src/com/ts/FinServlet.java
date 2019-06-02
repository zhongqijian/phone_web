package com.ts;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
public class FinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	public FinServlet() {
		super();
	}
	*/
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());

		try {
			Class.forName("com.mysql.jdbc.Driver"); //// 驱动程序名
			String url = "jdbc:mysql://120.27.223.199:3306/show_car?useUnicode=true&characterEncoding=utf-8&useSSL=false"; // 数据库名
			String username = "root"; // 数据库用户名
			String password = "LEO@zhong1988"; // 数据库用户密码
			Connection conn = DriverManager.getConnection(url, username, password); // 连接状态
			// 获取Statement
			Statement stmt = conn.createStatement();
			// 添加图书信息的SQL语句
			String sql = "SELECT * FROM reg_car";
			// 执行查询
			ResultSet rs = stmt.executeQuery(sql);
			// 实例化List对象
			List<Car_info_ts> list = new ArrayList<Car_info_ts>();
			
			// 判断光标向后移动，并判断是否有效
			while(rs.next()) {
				// 实例化Book对象
				Car_info_ts car = new Car_info_ts();
				// 对车牌号的属性赋值
				car.setCar_name(rs.getString("car_name"));
				//对司机姓名的属性赋值
				car.setCar_Driver(rs.getString("car_Driver"));
				//对司机的联系方式属性进行赋值
				car.setCar_phone(rs.getString("car_phone"));
				//对登记时间进行赋值
				car.setReg_time(rs.getString("reg_time"));
				//对预计装货时间进行复制
				car.setLoad_time(rs.getString("load_time"));
				//显示备注信息
				car.setRemarks(rs.getString("remarks"));
				// 将car对象添加到集合中
				list.add(car);
			}
			//将车辆的集合放到request之中
			request.setAttribute("list", list);
			rs.close(); //关闭ResultSet
			stmt.close(); //关闭Statement
			conn.close(); //关闭Connection
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		//将请求转发到car_list.jsp
		request.getRequestDispatcher("car_list.jsp").forward(request, response);	
	}
}