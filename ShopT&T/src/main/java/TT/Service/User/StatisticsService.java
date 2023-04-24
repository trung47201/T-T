package TT.Service.User;

import java.sql.Connection;

import com.mysql.jdbc.PreparedStatement;

public class StatisticsService {
	private ConnectService connectService;

	public boolean update_order_num_in_statistics_DB() {
		try {
			connectService = new ConnectService();
			Connection conn = connectService.getConnect();
			long millis = System.currentTimeMillis();
			java.sql.Date date = new java.sql.Date(millis);
			java.sql.Timestamp datetime = new java.sql.Timestamp(new java.util.Date().getTime());
			String query = "UPDATE `statistics` SET `order_num`= `order_num` + 1, `updated_order`= ? WHERE `date` = ?";
			PreparedStatement preparedStmt = (PreparedStatement) conn.prepareStatement(query);
			preparedStmt.setTimestamp(1, datetime);
			preparedStmt.setDate(2, date);
			preparedStmt.executeUpdate();
			conn.close();
			return true;
		} catch (Exception e) {
			System.err.println("Got an exception! ");
			System.err.println(e.getMessage());
		}
		return false;
	}
	
	public boolean update_revenue_product_num_in_statistics_DB(int prod_num, double revenue_num) {
		try {
			revenue_num = (double) Math.round(revenue_num * 100) / 100;
			connectService = new ConnectService();
			Connection conn = connectService.getConnect();
			long millis = System.currentTimeMillis();
			java.sql.Date date = new java.sql.Date(millis);
			java.sql.Timestamp datetime = new java.sql.Timestamp(new java.util.Date().getTime());
			String query = "UPDATE `statistics` SET `product_num`= `product_num` + ?, `revenue_num`= `revenue_num` + ?, `updated_product`= ?, `updated_revenue`= ? WHERE `date` = ?";
			PreparedStatement preparedStmt = (PreparedStatement) conn.prepareStatement(query);
			preparedStmt.setInt(1, prod_num);
			preparedStmt.setDouble(2, revenue_num);
			preparedStmt.setTimestamp(3, datetime);
			preparedStmt.setTimestamp(4, datetime);
			preparedStmt.setDate(5, date);
			preparedStmt.executeUpdate();
			conn.close();
			return true;
		} catch (Exception e) {
			System.err.println("Got an exception! ");
			System.err.println(e.getMessage());
		}
		return false;
	}
}
