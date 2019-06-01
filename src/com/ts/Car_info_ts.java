package com.ts;

public class Car_info_ts {
	private String car_name; //车牌号
	private String car_Driver; //司机名称
	private String car_phone; //司机电话
	//private String reg_time; //到达时间，系统自动生成
	private String load_time; //预计装货时间
	private String remarks; //备注信息
	private int state; //司机是否在现场
	
	//1、设置和获取即车牌号信息
	public String getCar_name() {
		return car_name;
	}
	public void setCar_name(String car_name) {
		this.car_name=car_name;
	}
	//2、设置和获取即车牌号信息
	public String getCar_Driver() {
		return car_Driver;
	}
	public void setCar_Driver(String car_Driver) {
		this.car_Driver=car_Driver;
	}
	//3、设置和获取即车牌号信息
	public String getCar_phone() {
		return car_phone;
	}
	public void setCar_phone(String car_phone) {
		this.car_phone=car_phone;
	}
	//4、设置和获取即车牌号信息
	/**
	public String getReg_time() {
		return reg_time;
	}
	public void setReg_time(String reg_time) {
		this.reg_time=reg_time;
	}	
	*/
	//5、设置和获取即车牌号信息
	public String getLoad_time() {
		return load_time;
	}
	public void setLoad_time(String load_time) {
		this.load_time=load_time;
	}	
	//6、设置和获取即车牌号信息
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks=remarks;
	}	
	//7、设置和获取即车牌号信息
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state=state;
	}	
}
