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
	private MD5Service md5Service;

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
							+ "Inner join status on order_.status_id = status.id order by order_.id");
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
			String note, String method, double discount_at) {
		try {
			java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
			connectService = new ConnectService();
			md5Service = new MD5Service();
			Connection conn = connectService.getConnect();

			if (!md5Service.decodeText(fullname).equals("")) {
				fullname = md5Service.decodeText(fullname);
			}
			if (!md5Service.decodeText(address).equals("")) {
				address = md5Service.decodeText(address);
			}
			if (!md5Service.decodeText(note).equals("")) {
				note = md5Service.decodeText(note);
			}
			if (!md5Service.decodeText(method).equals("")) {
				method = md5Service.decodeText(method);
			}
			String sql = "INSERT INTO `order_`(`fullname`, `email`, `phone_number`, `address`, `order_date`, `updated_at`, `voucher_id`, `note`, `status_id`, `method`, `bill`, `discount_at`) "
					+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
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
			preparedStmt.setString(11, get_invoice_code());
			preparedStmt.setDouble(12, discount_at);
			preparedStmt.execute();
			conn.close();
			return true;
		} catch (Exception e) {
			System.err.println("Got an exception order service!");
			// printStackTrace method
			// prints line numbers + call stack
			e.printStackTrace();
			// Prints what exception has been thrown
			System.out.println(e);
		}
		return false;
	}

	public boolean insertIntoOrder_not_login(String fullname, String email, String phone_number, String address,
			int voucher_id, String note, String method) {
		try {
			java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
			connectService = new ConnectService();
			md5Service = new MD5Service();
			Connection conn = connectService.getConnect();

			if (!md5Service.decodeText(fullname).equals("")) {
				fullname = md5Service.decodeText(fullname);
			}
			if (!md5Service.decodeText(address).equals("")) {
				address = md5Service.decodeText(address);
			}
			if (!md5Service.decodeText(note).equals("")) {
				note = md5Service.decodeText(note);
			}
			if (!md5Service.decodeText(method).equals("")) {
				method = md5Service.decodeText(method);
			}
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
			preparedStmt.setString(11, get_invoice_code());
			preparedStmt.execute();
			conn.close();
			return true;
		} catch (Exception e) {
			System.err.println("Got an exception order service!");
			// printStackTrace method
			// prints line numbers + call stack
			e.printStackTrace();
			// Prints what exception has been thrown
			System.out.println(e);
		}
		return false;
	}

	public int getLastOrderId() {
		List<Order_> li = getAllOrder();
		int order_id = 0;
		for (Order_ o : li) {
			order_id = o.getId();
			System.out.println(o.getId());
		}
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
		return od.getVoucher().getVcdiscount();
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

	public int get_order_id_by(String phone, String email) {
		List<Order_> li = getAllOrder();
		int od = 0;
		for (Order_ o : li) {
			if (o.getStatus().getId() == 1) {
				od = o.getId();
			}
		}
		return od;
	}

	public boolean check_voucher_used_by_user_id(int id, String code) {
		userService = new UserService();
		User u = userService.get_user_by_id(id);
		List<Order_> li = getAllOrder();
		for (Order_ o : li) {
			if (o.getPhone_number().equals(u.getPhone_number().trim()) && o.getEmail().equals(u.getEmail().trim())
					&& o.getVoucher().getCode().trim().equals(code.trim())) {
				return false;
			}
		}
		return true;
	}

	public int get_status_id_by_order_id(int order_id) {
		List<Order_> o = getAllOrder();
		int status_id = 0;
		for (Order_ ord : o) {
			if (ord.getId() == order_id) {
				status_id = ord.getStatus().getId();
			}
		}
		return status_id;
	}
	
	public int get_last_order_id_by(String phone_number, String email) {
		List<Order_> o = getAllOrder();
		int id = 0;
		for (Order_ ord : o) {
			if (ord.getEmail().trim().equals(email.trim()) && ord.getPhone_number().trim().equals(phone_number.trim())) {
				id = ord.getId();
			}
		}
		return id;
	}

	public static void main(String[] args) {
		OrderService c = new OrderService();
		System.out.println(c.check_voucher_used_by_user_id(4, "TISHOESTET2023"));

	}

}
