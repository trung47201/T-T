package TiShoes.Service.Admin;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import TiShoes.Model.Order_;
import TiShoes.Model.Status;
import TiShoes.Model.Voucher;
import TiShoes.Repository.Admin.aOrderRepository;
import TiShoes.Service.User.ConnectService;

public class aOrderService implements aOrderRepository{
	private ConnectService connectService;
	private Order_ order_;
	private Voucher voucher;
	private Status status;
	
	@Override
	public List<Order_> getAllOrder() {
		List<Order_> li = null;
		try {
			connectService = new ConnectService();
			li = new ArrayList<>();
			Connection con = connectService.getConnect();
			Statement stmt;
			stmt = (Statement) con.createStatement();
			ResultSet rs = stmt
					.executeQuery("select * from order_ " + "Inner join voucher on order_.voucher_id = voucher.id "
							+ "Inner join status on order_.status_id = status.id "
							+ "group by order_.id");
			while (rs.next()) {
				order_ = new Order_();
				voucher = new Voucher();
				status = new Status();
				
				status.setId(rs.getInt("status_id"));
				status.setStatus_name(rs.getString("status_name"));


				voucher.setId(rs.getInt("voucher_id"));
				voucher.setCode(rs.getString("code"));
				voucher.setVcdiscount(rs.getInt("vcdiscount"));
				voucher.setLimit(rs.getInt("limit"));
				voucher.setApplyfor(rs.getInt("applyfor"));
				voucher.setStart_date(rs.getTimestamp("start_date"));
				voucher.setEnd_date(rs.getTimestamp("end_date"));
				voucher.setCreated_at(rs.getTimestamp("created_at"));
				voucher.setUpdated_at(rs.getTimestamp("updated_at"));
				voucher.setDescription(rs.getString("description"));

				order_.setId(rs.getInt("id"));
				order_.setFullname(rs.getString("fullname"));
				order_.setEmail(rs.getString("email"));
				order_.setPhone_number(rs.getString("phone_number"));
				order_.setAddress(rs.getString("address"));
				order_.setOrder_date(rs.getDate("order_date"));
				order_.setUpdated_at(rs.getDate("updated_at"));
				order_.setVoucher(voucher);
				order_.setDiscount_at(rs.getDouble("discount_at"));
				order_.setNote(rs.getString("note"));
				order_.setStatus(status);
				order_.setMethod(rs.getString("method"));

				li.add(order_);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return li;
	}
	
	public boolean insertIntoOrder(String fullname, String email, String phone_number, String address, int voucher_id,
			String note, String method) {
		try {
			java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
			connectService = new ConnectService();
			Connection conn = connectService.getConnect();
			String sql = "INSERT INTO `order_`(`fullname`, `email`, `phone_number`, `address`, `order_date`, `updated_at`, `voucher_id`, `note`, `status`, `method` , `discount_at`) "
					+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement preparedStmt = (PreparedStatement) conn.prepareStatement(sql);
			preparedStmt.setString(1, fullname);
			preparedStmt.setString(2, email);
			preparedStmt.setString(3, phone_number);
			preparedStmt.setString(4, address);
			preparedStmt.setTimestamp(5, date);
			preparedStmt.setTimestamp(6, date);
			preparedStmt.setInt(7, voucher_id);
			preparedStmt.setString(8, note);
			preparedStmt.setString(9, "Awaiting confirmation");
			preparedStmt.setString(10, method);
			preparedStmt.execute();
			conn.close();
			return true;
		} catch (Exception e) {
			System.err.println("Got an exception!");
			// printStackTrace method
			// prints line numbers + call stack
			e.printStackTrace();
			// Prints what exception has been thrown
			System.out.println(e);
		}
		return false;
	}

	public int getLastOrderId() {
		int size = getAllOrder().size();
		int order_id = getAllOrder().get(size-1).getId();
		return order_id;
	}
	
	public Order_ getOrderByID(int id_order) {
		Order_ od = new Order_();
		for (Order_ o : getAllOrder()) {
			if(o.getId() == id_order) {
				od = o;
			}
		}
		return od;
	}
	
	
	@Override
	public boolean addOrder() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean editOrder() {
//		try {
//			connectService = new ConnectService();
//			Connection conn = connectService.getConnect();
//			//check id_prod
//			boolean check = false;
//			List<Order_> list = getAllOrder();
//			for (Order_ o : list) {
//				if(o.getId()==id_prod) {
//					check=true;
//				}
//			}
//			if(check) {
//				String query = "update product set sold = sold + ? where id = ?";
//				PreparedStatement preparedStmt = (PreparedStatement) conn.prepareStatement(query);
//				preparedStmt.setInt(1, amount);
//				preparedStmt.setInt(2, id_prod);
//				preparedStmt.executeUpdate();
//				conn.close();
//				return true;
//			} else {
//				return false;
//			}
//			// create the java mysql update preparedstatement
//			
//		} catch (Exception e) {
//			System.err.println("Got an exception! ");
//			System.err.println(e.getMessage());
//		}
		return false;
	}
	public boolean editStatusOrderById(int order_id, int status_id) {
		try {
			connectService = new ConnectService();
			Connection conn = connectService.getConnect();
			//check id_prod
			boolean check = false;
			List<Order_> list = getAllOrder();
			for (Order_ o : list) {
				if(o.getId()==order_id) {
					check=true;
				}
			}
			if(check) {
				String query = "update order_ set status_id = ? where id = ?";
				PreparedStatement preparedStmt = (PreparedStatement) conn.prepareStatement(query);
				preparedStmt.setInt(1, status_id);
				preparedStmt.setInt(2, order_id);
				preparedStmt.executeUpdate();
				conn.close();
				return true;
			} else {
				return false;
			}
			// create the java mysql update preparedstatement
			
		} catch (Exception e) {
			System.err.println("Got an exception! ");
			System.err.println(e.getMessage());
		}
		return false;
	}
	

}
