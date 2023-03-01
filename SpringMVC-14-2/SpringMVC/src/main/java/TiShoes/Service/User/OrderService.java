package TiShoes.Service.User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import TiShoes.Model.Voucher;
import TiShoes.Model.Order_;
import TiShoes.Model.Status;
import TiShoes.Model.User;
import TiShoes.Repository.User.OrderRepository;

public class OrderService implements OrderRepository {
	private ConnectService connectService;
	private UserService userService;
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
							+ "Inner join status on order_.status_id = status.id ");
			while (rs.next()) {
				order_ = new Order_();
				voucher = new Voucher();
				status = new Status();

				status.setId(rs.getInt("status_id"));
				status.setStatus_name(rs.getString("status_name"));

				voucher.setId(rs.getInt("voucher_id"));
				voucher.setCode(rs.getString("code"));
				voucher.setDiscount(rs.getInt("discount"));
				voucher.setLimit(rs.getInt("limit"));
				voucher.setStart_date(rs.getDate("start_date"));
				voucher.setEnd_date(rs.getDate("end_date"));
				voucher.setCreated_at(rs.getDate("created_at"));
				voucher.setUpdated_at(rs.getDate("updated_at"));
				voucher.setDescription(rs.getString("description"));

				order_.setId(rs.getInt("id"));
				order_.setFullname(rs.getString("fullname"));
				order_.setEmail(rs.getString("email"));
				order_.setPhone_number(rs.getString("phone_number"));
				order_.setAddress(rs.getString("address"));
				order_.setOrder_date(rs.getDate("order_date"));
				order_.setUpdated_at(rs.getDate("updated_at"));
				order_.setVoucher(voucher);
				order_.setNote(rs.getString("note"));
				order_.setStatus(status);
				order_.setMethod(rs.getString("method"));
				order_.setBill(rs.getString("bill"));

				li.add(order_);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return li;
	}

	@Override
	public boolean insertIntoOrder(String fullname, String email, String phone_number, String address, int voucher_id,
			String note, String method) {
		try {
			java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
			connectService = new ConnectService();
			Connection conn = connectService.getConnect();
			String sql = "INSERT INTO `order_`(`fullname`, `email`, `phone_number`, `address`, `order_date`, `updated_at`, `voucher_id`, `note`, `status_id`, `method`, `bill`) "
					+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement preparedStmt = (PreparedStatement) conn.prepareStatement(sql);
			preparedStmt.setString(1, fullname);
			preparedStmt.setString(2, email);
			preparedStmt.setString(3, phone_number);
			preparedStmt.setString(4, address);
			preparedStmt.setTimestamp(5, date);
			preparedStmt.setTimestamp(6, date);
			preparedStmt.setInt(7, voucher_id);
			preparedStmt.setString(8, note);
			preparedStmt.setInt(9, 1);
			preparedStmt.setString(10, method);
			preparedStmt.setString(10, get_invoice_code());
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
		int order_id = getAllOrder().get(size - 1).getId();
		return order_id;
	}

	public boolean checkOrder() {
		return false;
	}

	public List<Order_> get_all_order_by_user_id(int user_id) {
		List<Order_> li = new LinkedList<>();
		userService = new UserService();
		if (userService.get_user_by_id(user_id) != null) {
			User u = userService.get_user_by_id(user_id);
			for (Order_ o : getAllOrder()) {
				if (o.getPhone_number().equals(u.getPhone_number()) || o.getEmail().equals(u.getEmail())) {
					li.add(o);
				}
			}
		}

		return li;
	}

	public Order_ get_all_order_by_order_id(int order_id) {
		Order_ od = null;
		for (Order_ o : getAllOrder()) {
			if (o.getId() == order_id) {
				od = o;
			}
		}
		return od;
	}
	
	public int get_voucher_discount_by_order_id(int order_id) {
		Order_ od = get_all_order_by_order_id(order_id);
		return od.getVoucher().getDiscount();
	}

	public int get_number_random(int min, int max) {
		int random_int = (int) Math.floor(Math.random() * (max - min + 1) + min);
		return random_int;
	}

	public String get_invoice_words_by_number(int num) {
		String rs = "";
		for (int i = 0; i < num; i++) {
			rs += String.valueOf((char) get_number_random(65, 90));
		}
		return rs;
	}

	public String get_invoice_code() {
		int num = get_number_random(0, 99);
		String rs = "TT";
		if (num < 10) {
			rs += "0" + String.valueOf(num) + get_invoice_words_by_number(4);
		} else {
			rs += String.valueOf(num) + get_invoice_words_by_number(4);
		}
		List<String> li = get_all_bill();
		if (li.contains(rs)) {
			get_invoice_code();
		} else {
			return rs;
		}
		return null;
	}

	public List<String> get_all_bill() {
		List<String> li = new ArrayList<>();
		for (Order_ o : getAllOrder()) {
			li.add(o.getBill());
		}
		return li;
	}

	public static void main(String[] args) {
		OrderService os = new OrderService();
		for (Order_ o : os.get_all_order_by_user_id(1)) {
			System.out.println(o.getId());
		}
	}

}
