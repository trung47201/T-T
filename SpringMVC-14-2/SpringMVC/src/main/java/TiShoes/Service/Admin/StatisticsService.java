package TiShoes.Service.Admin;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

import com.mysql.jdbc.Statement;

import TiShoes.Model.Statistics;
import TiShoes.Service.User.ConnectService;

public class StatisticsService {
	private ConnectService connectService;

	public List<Statistics> getAllStatistics() {
		List<Statistics> li = null;
		try {
			connectService = new ConnectService();
			li = new ArrayList<>();
			Connection con = connectService.getConnect();
			Statement stmt;
			stmt = (Statement) con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from statistics");
			while (rs.next()) {
				Statistics statistics = new Statistics();
				statistics.setId(rs.getInt("id"));
				statistics.setOrder_num(rs.getInt("order_num"));
				statistics.setProduct_num(rs.getInt("product_num"));
				statistics.setRevenue_num(rs.getDouble("revenue_num"));
				statistics.setUser_num(rs.getInt("user_num"));
				statistics.setView_num(rs.getInt("view_num"));
				statistics.setDate(rs.getDate("date"));
				li.add(statistics);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return li;
	}

	// ORDER
	// =================================================================================================
	// order - today
	public int get_order_of_day_number() {
		int rs = 0;
		java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
		List<Statistics> li = getAllStatistics();
		for (Statistics s : li) {
			if (get_day(date) - get_day(s.getDate()) == 0 && get_month(date) - get_month(s.getDate()) == 0
					&& get_year(date) - get_year(s.getDate()) == 0) {
				rs = s.getOrder_num();
			}
		}
		return rs;
	}

	// order - yesterday
	public int get_order_of_yesterday_number() {
		int rs = 0;
		java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
		List<Statistics> li = getAllStatistics();
		for (Statistics s : li) {
			if ((get_day(date) - 1) - get_day(s.getDate()) == 0 && get_month(date) - get_month(s.getDate()) == 0
					&& get_year(date) - get_year(s.getDate()) == 0) {
				rs = s.getOrder_num();
			}
		}
		return rs;
	}

	// percent - order of day
	public int get_percent_order_of_day() {
		double rs = get_order_of_day_number() * 1.0 / get_order_of_yesterday_number() * 100;
		return (int) Math.round(rs) - 100;
	}

	// PRODUCT
	// =================================================================================================
	// product - today
	public int get_product_of_day_number() {
		int rs = 0;
		java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
		List<Statistics> li = getAllStatistics();
		for (Statistics s : li) {
			if (get_day(date) - get_day(s.getDate()) == 0 && get_month(date) - get_month(s.getDate()) == 0
					&& get_year(date) - get_year(s.getDate()) == 0) {
				rs = s.getProduct_num();
			}
		}
		return rs;
	}

	// product - yesterday
	public int get_product_of_yesterday_number() {
		int rs = 0;
		java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
		List<Statistics> li = getAllStatistics();
		for (Statistics s : li) {
			if ((get_day(date) - 1) - get_day(s.getDate()) == 0 && get_month(date) - get_month(s.getDate()) == 0
					&& get_year(date) - get_year(s.getDate()) == 0) {
				rs = s.getProduct_num();
			}
		}
		return rs;
	}

	// percent - product of day
	public int get_percent_product_of_day() {
		double rs = get_product_of_day_number() * 1.0 / get_product_of_yesterday_number() * 100;
		return (int) Math.round(rs) - 100;
	}

	// REVENUE
	// =================================================================================================
	// revenue - today
	public double get_revenue_of_day_number() {
		double rs = 0;
		java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
		List<Statistics> li = getAllStatistics();
		for (Statistics s : li) {
			if (get_day(date) - get_day(s.getDate()) == 0 && get_month(date) - get_month(s.getDate()) == 0
					&& get_year(date) - get_year(s.getDate()) == 0) {
				rs = s.getRevenue_num();
			}
		}
		return rs;
	}

	// revenue - yesterday
	public double get_revenue_of_yesterday_number() {
		double rs = 0;
		java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
		List<Statistics> li = getAllStatistics();
		for (Statistics s : li) {
			if ((get_day(date) - 1) - get_day(s.getDate()) == 0 && get_month(date) - get_month(s.getDate()) == 0
					&& get_year(date) - get_year(s.getDate()) == 0) {
				rs = s.getRevenue_num();
			}
		}
		return rs;
	}

	// percent - revenue of day
	public int get_percent_revenue_of_day() {
		double rs = get_revenue_of_day_number() * 1.0 / get_revenue_of_yesterday_number() * 100;
		return (int) Math.round(rs) - 100;
	}

	// USER
	// =================================================================================================
	// user - today
	public int get_user_of_day_number() {
		int rs = 0;
		java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
		List<Statistics> li = getAllStatistics();
		for (Statistics s : li) {
			if (get_day(date) - get_day(s.getDate()) == 0 && get_month(date) - get_month(s.getDate()) == 0
					&& get_year(date) - get_year(s.getDate()) == 0) {
				rs = s.getUser_num();
			}
		}
		return rs;
	}

	// user - yesterday
	public double get_user_of_yesterday_number() {
		double rs = 0;
		java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
		List<Statistics> li = getAllStatistics();
		for (Statistics s : li) {
			if ((get_day(date) - 1) - get_day(s.getDate()) == 0 && get_month(date) - get_month(s.getDate()) == 0
					&& get_year(date) - get_year(s.getDate()) == 0) {
				rs = s.getUser_num();
			}
		}
		return rs;
	}

	// percent - user of day
	public int get_percent_user_of_day() {
		double rs = get_user_of_day_number() * 1.0 / get_user_of_yesterday_number() * 100;
		return (int) Math.round(rs) - 100;
	}

	// VIEW
	// =================================================================================================
	// view - today
	public int get_view_of_day_number() {
		int rs = 0;
		java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
		List<Statistics> li = getAllStatistics();
		for (Statistics s : li) {
			if (get_day(date) - get_day(s.getDate()) == 0 && get_month(date) - get_month(s.getDate()) == 0
					&& get_year(date) - get_year(s.getDate()) == 0) {
				rs = s.getView_num();
			}
		}
		return rs;
	}

	// view - yesterday
	public double get_view_of_yesterday_number() {
		double rs = 0;
		java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
		List<Statistics> li = getAllStatistics();
		for (Statistics s : li) {
			if ((get_day(date) - 1) - get_day(s.getDate()) == 0 && get_month(date) - get_month(s.getDate()) == 0
					&& get_year(date) - get_year(s.getDate()) == 0) {
				rs = s.getView_num();
			}
		}
		return rs;
	}

	// percent - view of day
	public int get_percent_view_of_day() {
		double rs = get_view_of_day_number() * 1.0 / get_view_of_yesterday_number() * 100;
		return (int) Math.round(rs) - 100;
	}

	// DAY - MONTH - YEAR
	// =================================================================================================
	// day by date ("yyyy-mm-dd")
	public int get_day(Date date) {
		Calendar cal = Calendar.getInstance(TimeZone.getTimeZone("Asia/Ho_Chi_Minh"));
		cal.setTime(date);
		int day = cal.get(Calendar.DAY_OF_MONTH);
		return day;
	}

	// month by date ("yyyy-mm-dd")
	public int get_month(Date date) {
		Calendar cal = Calendar.getInstance(TimeZone.getTimeZone("Asia/Ho_Chi_Minh"));
		cal.setTime(date);
		int month = cal.get(Calendar.MONTH);
		return month;
	}

	// year by date ("yyyy-mm-dd")
	public int get_year(Date date) {
		Calendar cal = Calendar.getInstance(TimeZone.getTimeZone("Asia/Ho_Chi_Minh"));
		cal.setTime(date);
		int year = cal.get(Calendar.YEAR);
		return year;
	}

	public static void main(String[] args) {
		StatisticsService s = new StatisticsService();
		System.out.println(s.get_percent_order_of_day());
	}

}
