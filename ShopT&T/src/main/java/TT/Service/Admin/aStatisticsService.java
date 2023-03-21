package TT.Service.Admin;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;
import java.util.TimeZone;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import TT.Model.Statistics;
import TT.Service.User.ConnectService;

public class aStatisticsService {
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
				statistics.setUpdated_order(rs.getTimestamp("updated_order"));
				statistics.setUpdated_product(rs.getTimestamp("updated_product"));
				statistics.setUpdated_revenue(rs.getTimestamp("updated_revenue"));
				statistics.setUpdated_user(rs.getTimestamp("updated_user"));
				li.add(statistics);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return li;
	}

	public boolean insert_new_statistics() {
		try {
			connectService = new ConnectService();
			Connection conn = connectService.getConnect();
			java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
			String sql = "INSERT INTO `statistics`(`order_num`, `product_num`, `revenue_num`, `user_num`, `view_num`, `date`, `updated_order`, `updated_product`, `updated_revenue`, `updated_user`) "
					+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement preparedStmt = (PreparedStatement) conn.prepareStatement(sql);
			preparedStmt.setInt(1, 0);
			preparedStmt.setInt(2, 0);
			preparedStmt.setDouble(3, 0.0);
			preparedStmt.setInt(4, 0);
			preparedStmt.setInt(5, 0);
			preparedStmt.setTimestamp(6, date);
			preparedStmt.setTimestamp(7, date);
			preparedStmt.setTimestamp(8, date);
			preparedStmt.setTimestamp(9, date);
			preparedStmt.setTimestamp(10, date);
			preparedStmt.execute();
			conn.close();
			return true;

		} catch (Exception e) {
			System.err.println("Got an exception!");
			e.printStackTrace();
			System.out.println(e);
		}
		return false;
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

	// order - percent - order of day
	public int get_percent_order_of_day() {
		int ytd = get_order_of_yesterday_number();
		int now = get_order_of_day_number();
		if (ytd > 0) {
			double rs = now * 1.0 / ytd * 100;
			return (int) Math.round(rs) - 100;
		} else if (now==0) {
			return 0;
		} else {
			return 100;
		}
	}

	// order - this month
	public int get_order_of_this_month_number() {
		int rs = 0;
		java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
		List<Statistics> li = getAllStatistics();
		for (Statistics s : li) {
			if (get_month(date) - get_month(s.getDate()) == 0 && get_year(date) - get_year(s.getDate()) == 0) {
				rs += s.getOrder_num();
			}
		}
		return rs;
	}

	// order - last month
	public int get_order_of_last_month_number() {
		int rs = 0;
		java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
		List<Statistics> li = getAllStatistics();
		for (Statistics s : li) {
			if ((get_month(date) - 1) - get_month(s.getDate()) == 0 && get_year(date) - get_year(s.getDate()) == 0) {
				rs += s.getOrder_num();
			}
		}
		return rs;
	}

	// order - percent - order of month
	public int get_percent_order_of_month() {
		int last_month = get_order_of_last_month_number();
		int month = get_order_of_this_month_number();
		if(last_month > 0) {
			double rs = month * 1.0 / last_month * 100;
			return (int) Math.round(rs) - 100;
		} else if(month == 0) {
			return 0;
		} else {
			return 100;
		}
	}

	// order - list order every day of week
	public List<Integer> list_order_of_week_number() {
		java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
		List<Integer> li_order = new LinkedList<>();
		List<Statistics> li = getAllStatistics();
		int day_of_week = get_day_of_week(date);
		System.out.println(day_of_week);
		for (int i = day_of_week - 1; i >= 0; i--) {
			for (Statistics s : li) {
				if ((get_day(date) - i) - get_day(s.getDate()) == 0 && get_month(date) - get_month(s.getDate()) == 0
						&& get_year(date) - get_year(s.getDate()) == 0) {
					li_order.add(s.getOrder_num());
					System.out.println("(179) num: "+s.getOrder_num());
				}
			}
		}
		return li_order;
	}

	// order - get update history order
	public int get_update_history_order() {
		java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
		List<Statistics> li = getAllStatistics();
		int rs = 0;
		for (Statistics s : li) {
			if ((get_day(date)) - get_day(s.getDate()) == 0 && get_month(date) - get_month(s.getDate()) == 0
					&& get_year(date) - get_year(s.getDate()) == 0) {
				rs = get_second_of_day(date) - get_second_of_day(s.getUpdated_order());
			}
		}
		return rs;
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

	// product - percent - product of day
	public int get_percent_product_of_day() {
		int ytd = get_product_of_yesterday_number();
		int now = get_product_of_day_number();
		if(ytd > 0) {
			double rs = now * 1.0 / ytd * 100;
			return (int) Math.round(rs) - 100;
		} else if(now == 0) {
			return 0;
		} else {
			return 100;
		}
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

	// revenue - percent - revenue of day
	public int get_percent_revenue_of_day() {
		double ytd = get_revenue_of_yesterday_number();
		double now = get_revenue_of_day_number();
		if (ytd > 0) {
			double rs = now * 1.0 / ytd * 100;
			return (int) Math.round(rs) - 100;
		} else if (now==0) {
			return 0;
		} else {
			return 100;
		}
		
	}

	// revenue - this month
	public double get_revenue_of_this_month_number() {
		double rs = 0;
		java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
		List<Statistics> li = getAllStatistics();
		for (Statistics s : li) {
			if (get_month(date) - get_month(s.getDate()) == 0 && get_year(date) - get_year(s.getDate()) == 0) {
				rs += s.getRevenue_num();
			}
		}
		return (double) Math.round(rs * 100) / 100;
	}

	// revenue - last month
	public double get_revenue_of_last_month_number() {
		double rs = 0;
		java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
		List<Statistics> li = getAllStatistics();
		for (Statistics s : li) {
			if ((get_month(date) - 1) - get_month(s.getDate()) == 0 && get_year(date) - get_year(s.getDate()) == 0) {
				rs += s.getRevenue_num();
			}
		}
		return rs;
	}

	// revenue - percent - revenue of month
	public int get_percent_revenue_of_month() {
		double ytd = get_revenue_of_last_month_number();
		double now = get_revenue_of_this_month_number();
		if(ytd > 0) {
			double rs = now * 1.0 / ytd * 100;
			return (int) Math.round(rs) - 100;
		} else if (now==0) {
			return 0;
		} else {
			return 100;
		}
	}

	// revenue - list month name from 1 to now
	public List<String> list_month_name_from_now() {
		List<String> li = new LinkedList<>();
		java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
		int this_month = get_month(date) + 1;
		for (int i = 1; i <= this_month; i++) {
			li.add(get_month_name_by_num(i));
		}
		return li;
	}

	// revenue - list revenue all month from 1 to now
	public List<Integer> list_revenue_all_month_from_1_to_now() {
		java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
		List<Integer> li_order = new LinkedList<>();
		List<Statistics> li = getAllStatistics();
		int this_month = get_month(date) + 1;
		double total = 0;
		for (int i = this_month - 1; i >= 0; i--) {
			total = 0;
			for (Statistics s : li) {
				if ((get_month(date) - i) - get_month(s.getDate()) == 0
						&& get_year(date) - get_year(s.getDate()) == 0) {
					total += s.getRevenue_num();
				}
			}
			li_order.add((int) Math.round(total));
		}
		return li_order;
	}

	// revenue - get update history revenue
	public int get_update_history_revenue() {
		java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
		List<Statistics> li = getAllStatistics();
		int rs = 0;
		for (Statistics s : li) {
			if ((get_day(date)) - get_day(s.getDate()) == 0 && get_month(date) - get_month(s.getDate()) == 0
					&& get_year(date) - get_year(s.getDate()) == 0) {
				rs = get_second_of_day(date) - get_second_of_day(s.getUpdated_revenue());
			}
		}
		return rs;
	}

	// USER
	// =================================================================================================
	// user - today
	public boolean check_date_of_today_exist() {
		java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
		List<Statistics> li = getAllStatistics();
		for (Statistics s : li) {
			if (get_day(date) - get_day(s.getDate()) == 0 && get_month(date) - get_month(s.getDate()) == 0
					&& get_year(date) - get_year(s.getDate()) == 0) {
				return true;
			}
		}
		return false;
	}

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
		double ytd = get_user_of_yesterday_number();
		double now = get_user_of_day_number();
		if(ytd > 0) {
			double rs = now * 1.0 / ytd * 100;
			return (int) Math.round(rs) - 100;
		} else if(now == 0){
			return 0;
		} else {
			return 100;
		}
	}

	public boolean update_user_num_in_statistics_DB() {
		try {
			connectService = new ConnectService();
			Connection conn = connectService.getConnect();
			long millis = System.currentTimeMillis();
			java.sql.Date date = new java.sql.Date(millis);
			java.sql.Timestamp datetime = new java.sql.Timestamp(new java.util.Date().getTime());
			String sql = "UPDATE `statistics` SET `user_num`= user_num + 1, `updated_user` = ? WHERE date = ?";
			PreparedStatement preparedStmt = (PreparedStatement) conn.prepareStatement(sql);
			preparedStmt.setTimestamp(1, datetime);
			preparedStmt.setDate(2, date);
			preparedStmt.execute();
			conn.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
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

	// HOURS - MINUTE - SECONDS
	// =================================================================================================
	// hours
	public int get_hours_of_day(Date date) {
		Calendar cal = Calendar.getInstance(TimeZone.getTimeZone("Asia/Ho_Chi_Minh"));
		cal.setTime(date);
		int hours = cal.get(Calendar.HOUR_OF_DAY);
		return hours;
	}

	// minute
	public int get_minute_of_day(Date date) {
		Calendar cal = Calendar.getInstance(TimeZone.getTimeZone("Asia/Ho_Chi_Minh"));
		cal.setTime(date);
		int minute = cal.get(Calendar.MINUTE);
		return minute;
	}

	// seconds
	public int get_second_of_hours(Date date) {
		Calendar cal = Calendar.getInstance(TimeZone.getTimeZone("Asia/Ho_Chi_Minh"));
		cal.setTime(date);
		int second = cal.get(Calendar.SECOND);
		return second;
	}

	public int get_second_of_day(Date date) {
		Calendar cal = Calendar.getInstance(TimeZone.getTimeZone("Asia/Ho_Chi_Minh"));
		cal.setTime(date);
		int second = cal.get(Calendar.HOUR_OF_DAY) * 60 * 60 + cal.get(Calendar.MINUTE) * 60 + cal.get(Calendar.SECOND);
		return second;
	}

	// DAY - MONTH - YEAR
	// =================================================================================================
	// day of week by date ("yyyy-mm-dd")
	public int get_day_of_week(Date date) {
		Calendar cal = Calendar.getInstance(TimeZone.getTimeZone("Asia/Ho_Chi_Minh"));
		cal.setTime(date);
		int day = cal.get(Calendar.DAY_OF_WEEK);
		return day;
	}

	// day of month by date ("yyyy-mm-dd")
	public int get_day(Date date) {
		Calendar cal = Calendar.getInstance(TimeZone.getTimeZone("Asia/Ho_Chi_Minh"));
		cal.setTime(date);
		int day = cal.get(Calendar.DAY_OF_MONTH);
		return day;
	}

	// month of year by date ("yyyy-mm-dd")
	public int get_month(Date date) {
		Calendar cal = Calendar.getInstance(TimeZone.getTimeZone("Asia/Ho_Chi_Minh"));
		cal.setTime(date);
		int month = cal.get(Calendar.MONTH);
		return month;
	}

	// month name of year by date ("yyyy-mm-dd")
	public String get_month_name(Date date) {
		Calendar cal = Calendar.getInstance(TimeZone.getTimeZone("Asia/Ho_Chi_Minh"));
		cal.setTime(date);
		String month = cal.getDisplayName(Calendar.MONTH, Calendar.SHORT, Locale.getDefault());
		return month;
	}

	// month name of year by num ("yyyy-mm-dd")
	public String get_month_name_by_num(int m) {
		switch (m) {
		case 1:
			return "\"Jan\"";
		case 2:
			return "\"Feb\"";
		case 3:
			return "\"Mar\"";
		case 4:
			return "\"Apr\"";
		case 5:
			return "\"May\"";
		case 6:
			return "\"Jun\"";
		case 7:
			return "\"Jul\"";
		case 8:
			return "\"Aug\"";
		case 9:
			return "\"Sep\"";
		case 10:
			return "\"Oct\"";
		case 11:
			return "\"Nov\"";
		case 12:
			return "\"Dec\"";
		}
		return null;
	}

	// year by date ("yyyy-mm-dd")
	public int get_year(Date date) {
		Calendar cal = Calendar.getInstance(TimeZone.getTimeZone("Asia/Ho_Chi_Minh"));
		cal.setTime(date);
		int year = cal.get(Calendar.YEAR);
		return year;
	}

	public static void main(String[] args) {
		aStatisticsService a = new aStatisticsService();
		System.out.println(a.list_order_of_week_number());
	}
}
