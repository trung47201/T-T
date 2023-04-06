package TT.Service.Shipper;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.Collator;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import TT.Model.Receipt;
import TT.Model.Status;
import TT.Model.Voucher;
import TT.Service.User.ConnectService;

public class sOrderService {

	private ConnectService connectService;
	private Receipt receipt;
	private Voucher voucher;
	private Status status;

	public boolean take_order(int order_id, int shipper_id, String qrcode) {
		try {
			connectService = new ConnectService();
			Connection conn = connectService.getConnect();
			if(check_exits_qr_code(order_id)) {
				String query = "update `receipt` set `request` = 2, `shipper_id`= ? where id = ?";
				PreparedStatement preparedStmt = (PreparedStatement) conn.prepareStatement(query);
				preparedStmt.setInt(1, shipper_id);
				preparedStmt.setInt(2, order_id);
				preparedStmt.executeUpdate();
				conn.close();
				return true;
			} else {
				String query = "update `receipt` set `request` = 2, `shipper_id`= ?, `qrcode`= ? where id = ?";
				PreparedStatement preparedStmt = (PreparedStatement) conn.prepareStatement(query);
				preparedStmt.setInt(1, shipper_id);
				preparedStmt.setString(2, qrcode);
				preparedStmt.setInt(3, order_id);
				preparedStmt.executeUpdate();
				conn.close();
				return true;
			}
			
		} catch (Exception e) {
			System.err.println("Got an exception! ");
			System.err.println(e.getMessage());
		}
		return false;
	}
	
	public boolean check_exits_qr_code(int order_id) {
		List<Receipt> li = getAllOrder();
		for (Receipt r : li) {
			if(r.getQrcode() != null) {
				if(!r.getQrcode().equals("")) {
					return true;
				}
			}
		}
		return false;
	}

	public List<Receipt> getAllOrder() { // all order not delivery
		List<Receipt> li = null;
		try {
			connectService = new ConnectService();
			li = new ArrayList<>();
			Connection con = connectService.getConnect();
			Statement stmt;
			stmt = (Statement) con.createStatement();
			ResultSet rs = stmt
					.executeQuery("select * from receipt " + "Inner join voucher on receipt.voucher_id = voucher.id "
							+ "Inner join status on receipt.status_id = status.id " +"Where status.id = 3 and request = 0 "+ "group by receipt.id");
			while (rs.next()) {
				receipt = new Receipt();
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
				receipt.setQrcode(rs.getString("qrcode"));
				li.add(receipt);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return li;
	}
	

}
