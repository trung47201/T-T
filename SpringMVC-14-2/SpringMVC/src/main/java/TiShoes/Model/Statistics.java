package TiShoes.Model;

import java.sql.Date;

public class Statistics {
	private int id;
	private int order_num;
	private int product_num;
	private double revenue_num;
	private int user_num;
	private int view_num;
	private Date date;
	
	public Statistics() {
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getOrder_num() {
		return order_num;
	}

	public void setOrder_num(int order_num) {
		this.order_num = order_num;
	}

	public int getProduct_num() {
		return product_num;
	}

	public void setProduct_num(int product_num) {
		this.product_num = product_num;
	}

	public double getRevenue_num() {
		return revenue_num;
	}

	public void setRevenue_num(double revenue_num) {
		this.revenue_num = revenue_num;
	}

	public int getUser_num() {
		return user_num;
	}

	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}

	public int getView_num() {
		return view_num;
	}

	public void setView_num(int view_num) {
		this.view_num = view_num;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
	
	
	
}
