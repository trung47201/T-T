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
import TT.Model.Statistics;
import TT.Model.Status;
import TT.Model.Voucher;
import TT.Service.Admin.aStatisticsService;
import TT.Service.User.ConnectService;
import TT.Service.User.ReceiptService;
import TT.Service.User.StatisticsService;

public class sOrderService {

	private ConnectService connectService;
	private Receipt receipt;
	private Voucher voucher;
	private Status status;

	public boolean take_order(int order_id, int shipper_id, String qrcode) {
		try {
			connectService = new ConnectService();
			Connection conn = connectService.getConnect();
			if (check_exits_qr_code(order_id)) {
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
			if (r.getQrcode() != null) {
				if (!r.getQrcode().equals("")) {
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
							+ "Inner join status on receipt.status_id = status.id "
							+ "Where status.id = 3 and request = 0 " + "group by receipt.id");
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

	public List<Receipt> get_all_by_shipper_id(int id) {
		ReceiptService r = new ReceiptService();
		List<Receipt> li = r.getAllOrder();
		List<Receipt> rs = new LinkedList<>();
		for (Receipt re : li) {
			if (re.getShipper().getId() == id && re.getStatus().getId() == 5) {
				rs.add(re);
			}
		}
		return rs;
	}

	public Receipt get_order_by_id(int id) {
		ReceiptService r = new ReceiptService();
		List<Receipt> li = r.getAllOrder();
		Receipt rs = null;
		for (Receipt re : li) {
			if (re.getId() == id) {
				rs = re;
			}
		}
		return rs;
	}

	public int get_order_today(int id) {
		aStatisticsService s = new aStatisticsService();
		int rs = 0;
		java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
		System.out.println(date);
		List<Receipt> li = get_all_by_shipper_id(id);
		for (Receipt r : li) {
			if (s.get_day(date) - s.get_day(r.getDelivery_date()) == 0
					&& s.get_month(date) - s.get_month(r.getDelivery_date()) == 0
					&& s.get_year(date) - s.get_year(r.getDelivery_date()) == 0) {
				rs++;
			}
		}
		return rs;
	}

	public int get_order_yesterday(int id) {
		aStatisticsService s = new aStatisticsService();
		int rs = 0;
		java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
		List<Receipt> li = get_all_by_shipper_id(id);
		for (Receipt r : li) {
			if ((s.get_day(date) - 1) - s.get_day(r.getDelivery_date()) == 0
					&& s.get_month(date) - s.get_month(r.getDelivery_date()) == 0
					&& s.get_year(date) - s.get_year(r.getDelivery_date()) == 0) {
				rs++;
			}
		}
		return rs;
	}

	public int get_order_of_month(int id) {
		aStatisticsService s = new aStatisticsService();
		int rs = 0;
		java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
		List<Receipt> li = get_all_by_shipper_id(id);
		for (Receipt r : li) {
			if (s.get_month(date) - s.get_month(r.getDelivery_date()) == 0
					&& s.get_year(date) - s.get_year(r.getDelivery_date()) == 0) {
				rs++;
			}
		}
		return rs;
	}

	public int get_order_last_month(int id) {
		aStatisticsService s = new aStatisticsService();
		int rs = 0;
		java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
		List<Receipt> li = get_all_by_shipper_id(id);
		for (Receipt r : li) {
			if ((s.get_month(date) - 1) - s.get_month(r.getDelivery_date()) == 0
					&& s.get_year(date) - s.get_year(r.getDelivery_date()) == 0) {
				rs++;
			}
		}
		return rs;
	}

	// revenue - list month name from 1 to now
	public List<String> list_month_name_from_now() {
		aStatisticsService s = new aStatisticsService();
		List<String> li = new LinkedList<>();
		java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
		int this_month = s.get_month(date) + 1;
		for (int i = 1; i <= this_month; i++) {
			li.add(s.get_month_name_by_num(i));
		}
		return li;
	}

	// revenue - list month name from 1 to now
	public List<String> list_day_name_from_now() {
		aStatisticsService s = new aStatisticsService();
		List<String> li = new LinkedList<>();
		java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
		int this_day = s.get_day_of_week(date);
		System.out.println(this_day);
		for (int i = 1; i <= this_day; i++) {
			li.add(s.get_day_name_by_num(i));
		}
		return li;
	}

	// revenue - list revenue all month from 1 to now
	public List<Double> list_revenue_all_month_from_1_to_now(int id) {
		aStatisticsService s = new aStatisticsService();
		java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
		List<Double> li_order = new LinkedList<>();
		List<Receipt> li = get_all_by_shipper_id(id);
		int this_month = s.get_month(date) + 1;
		int total = 0;
		for (int i = this_month - 1; i >= 0; i--) {
			total = 0;
			for (Receipt st : li) {
				if ((s.get_month(date) - i) - s.get_month(st.getDelivery_date()) == 0
						&& s.get_year(date) - s.get_year(st.getDelivery_date()) == 0) {
					total++;
				}
			}
			li_order.add(total * 0.4 + total / 30 * 0.5);
		}
		return li_order;
	}

	// order - list order every day of week
	public List<Integer> list_order_of_week_number(int id) {
		aStatisticsService s = new aStatisticsService();
		java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
		List<Integer> li_order = new LinkedList<>();
		List<Receipt> li = get_all_by_shipper_id(id);
		int day_of_week = s.get_day_of_week(date);
		int count = 0;
		for (int i = day_of_week - 1; i >= 0; i--) {
			count = 0;
			for (Receipt r : li) {
				if ((s.get_day(date) - i) - s.get_day(r.getDelivery_date()) == 0
						&& s.get_month(date) - s.get_month(r.getDelivery_date()) == 0
						&& s.get_year(date) - s.get_year(r.getDelivery_date()) == 0) {
					count++;
				}
			}
			System.out.println(count + "--" + i);
			li_order.add(count);
		}
		return li_order;
	}

	public static void main(String[] args) {
		sOrderService s = new sOrderService();
		System.out.println(s.list_day_name_from_now());
	}
}
