package TT.Service.User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedList;
import java.util.List;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import TT.Model.Receipt;
import TT.Model.Status;
import TT.Model.User;
import TT.Model.Voucher;
import TT.Repository.User.OrderRepository;

public class ReceiptService implements OrderRepository {
	private ConnectService connectService;
	private UserService userService;
	private Receipt receipt;
	private Voucher voucher;
	private Status status;
	private User shipper;
	private MD5Service md5Service;

	@Override
	public List<Receipt> getAllOrder() {
		List<Receipt> li = null;
		try {
			connectService = new ConnectService();
			li = new ArrayList<>();
			Connection con = connectService.getConnect();
			Statement stmt;
			stmt = (Statement) con.createStatement();
			ResultSet rs = stmt
					.executeQuery("select * from receipt " + "Inner join voucher on receipt.voucher_id = voucher.id "
							+ "Inner join status on receipt.status_id = status.id ");
			while (rs.next()) {
				receipt = new Receipt();
				voucher = new Voucher();
				status = new Status();
				shipper = new User();

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

				shipper.setId(rs.getInt("shipper_id"));

				receipt.setId(rs.getInt("id"));
				receipt.setFullname(rs.getString("fullname"));
				receipt.setEmail(rs.getString("email"));
				receipt.setPhone_number(rs.getString("phone_number"));
				receipt.setAddress(rs.getString("address"));
				receipt.setOrder_date(rs.getDate("order_date"));
				receipt.setUpdated_at(rs.getDate("updated_at"));
				receipt.setVoucher(voucher);
				receipt.setDiscount_at(rs.getDouble("discount_at"));
				receipt.setNote(rs.getString("note"));
				receipt.setStatus(status);
				receipt.setMethod(rs.getString("method"));
				receipt.setBill(rs.getString("bill"));
				receipt.setRequest(rs.getInt("request"));
				receipt.setShipper(shipper);
				receipt.setQrcode(rs.getString("qrcode"));
				receipt.setDelivery_date(rs.getDate("delivery_date"));
				li.add(receipt);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return li;
	}

	public List<Receipt> getAllOrder_of_shipper() {
		List<Receipt> li = null;
		try {
			connectService = new ConnectService();
			li = new ArrayList<>();
			Connection con = connectService.getConnect();
			Statement stmt;
			stmt = (Statement) con.createStatement();
			ResultSet rs = stmt
					.executeQuery("select * from receipt " + "Inner join voucher on receipt.voucher_id = voucher.id "
							+ "Inner join status on receipt.status_id = status.id "
							+ "Inner join user on receipt.shipper_id = user.id group by receipt.id");
			while (rs.next()) {
				receipt = new Receipt();
				voucher = new Voucher();
				status = new Status();
				shipper = new User();

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

				shipper.setId(rs.getInt("shipper_id"));

				receipt.setId(rs.getInt("id"));
				receipt.setFullname(rs.getString("fullname"));
				receipt.setEmail(rs.getString("email"));
				receipt.setPhone_number(rs.getString("phone_number"));
				receipt.setAddress(rs.getString("address"));
				receipt.setOrder_date(rs.getDate("order_date"));
				receipt.setUpdated_at(rs.getDate("updated_at"));
				receipt.setVoucher(voucher);
				receipt.setDiscount_at(rs.getDouble("discount_at"));
				receipt.setNote(rs.getString("note"));
				receipt.setStatus(status);
				receipt.setMethod(rs.getString("method"));
				receipt.setBill(rs.getString("bill"));
				receipt.setRequest(rs.getInt("request"));
				receipt.setShipper(shipper);
				receipt.setQrcode(rs.getString("qrcode"));
				receipt.setDelivery_date(rs.getDate("delivery_date"));
				li.add(receipt);
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
			String sql = "INSERT INTO `receipt`(`fullname`, `email`, `phone_number`, `address`, `order_date`, `updated_at`, `voucher_id`, `note`, `status_id`, `method`, `bill`, `discount_at`, `request`) "
					+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
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
			preparedStmt.setInt(13, 0);
			preparedStmt.execute();
			conn.close();
			return true;
		} catch (Exception e) {
			System.err.println("Got an exception receipt service! (121)");
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
			String sql = "INSERT INTO `receipt`(`fullname`, `email`, `phone_number`, `address`, `order_date`, `updated_at`, `voucher_id`, `note`, `status_id`, `method`, `bill`) "
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
			System.err.println("Got an exception receipt service! (169)");
			// printStackTrace method
			// prints line numbers + call stack
			e.printStackTrace();
			// Prints what exception has been thrown
			System.out.println(e);
		}
		return false;
	}

	public int getLastOrderId() {
		List<Receipt> li = getAllOrder();
		int order_id = 0;
		for (Receipt o : li) {
			order_id = o.getId();
			System.out.println(o.getId());
		}
		return order_id;
	}

	public boolean checkOrder() {
		return false;
	}

	public List<Receipt> get_all_order_by_user_id(int user_id) {
		List<Receipt> li = new LinkedList<>();
		userService = new UserService();
		if (userService.get_user_by_id(user_id) != null) {
			User u = userService.get_user_by_id(user_id);
			for (Receipt o : getAllOrder()) {
				if (o.getPhone_number().equals(u.getPhone_number()) || o.getEmail().equals(u.getEmail())) {
					li.add(o);
				}
			}
		}
		Collections.sort(li, new Comparator<Receipt>() {
			@Override
			public int compare(Receipt o1, Receipt o2) {
				return o2.getId() - o1.getId();
			}
		});
		return li;
	}

	public Receipt get_all_order_by_order_id(int order_id) {
		Receipt od = null;
		for (Receipt o : getAllOrder()) {
			if (o.getId() == order_id) {
				od = o;
			}
		}
		return od;
	}

	public int get_voucher_discount_by_order_id(int order_id) {
		Receipt od = get_all_order_by_order_id(order_id);
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
		for (Receipt o : getAllOrder()) {
			li.add(o.getBill());
		}
		return li;
	}

	public int get_order_id_by(String phone, String email) {
		List<Receipt> li = getAllOrder();
		int od = 0;
		for (Receipt o : li) {
			if (o.getStatus().getId() == 1) {
				od = o.getId();
			}
		}
		return od;
	}

	public boolean check_voucher_used_by_user_id(int id, String code) {
		userService = new UserService();
		User u = userService.get_user_by_id(id);
		List<Receipt> li = getAllOrder();
		for (Receipt o : li) {
			if ((o.getPhone_number().trim().equals(u.getPhone_number().trim())
					|| o.getEmail().trim().equals(u.getEmail().trim()))
					&& o.getVoucher().getCode().trim().toLowerCase().equals(code.trim().toLowerCase())) {
				return false;
			}
		}
		return true;
	}

	public int get_status_id_by_order_id(int order_id) {
		List<Receipt> o = getAllOrder();
		int status_id = 0;
		for (Receipt ord : o) {
			if (ord.getId() == order_id) {
				status_id = ord.getStatus().getId();
			}
		}
		return status_id;
	}

	public int get_last_order_id_by(String phone_number, String email) {
		List<Receipt> o = getAllOrder();
		Collections.sort(o, new Comparator<Receipt>() {
			@Override
			public int compare(Receipt o1, Receipt o2) {
				return o2.getId() - o1.getId();
			}
		});
		int id = 0;
		for (Receipt ord : o) {
			if (ord.getEmail().trim().equals(email.trim())
					&& ord.getPhone_number().trim().equals(phone_number.trim())) {
				id = ord.getId();
				break;
			}
		}
		return id;
	}

	public boolean confirm_request(int order_id) {
		try {
			connectService = new ConnectService();
			Connection conn = connectService.getConnect();
			String query = "update receipt set request = 1 where id = ?";
			PreparedStatement preparedStmt = (PreparedStatement) conn.prepareStatement(query);
			preparedStmt.setInt(1, order_id);
			preparedStmt.executeUpdate();
			conn.close();
			return true;
		} catch (Exception e) {
			System.err.println("Got an exception! ");
			System.err.println(e.getMessage());
		}
		return false;
	}

	public static void main(String[] args) {
		ReceiptService c = new ReceiptService();
		System.out.println(c.get_last_order_id_by("0903907001", "thanhcongbattery@hcm.fpt.vn"));

	}

}
