package TT.Service.Shipper;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.Collator;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import TT.Model.Receipt;
import TT.Model.Status;
import TT.Model.Voucher;
import TT.Service.User.ConnectService;

public class sDeliveryService {

	private ConnectService connectService;
	private Receipt receipt;
	private Voucher voucher;
	private Status status;

	public List<Receipt> getAllOrder_by_shipper_id(int shipper_id) {
		List<Receipt> li = null;
		try {
			connectService = new ConnectService();
			li = new ArrayList<>();
			Connection con = connectService.getConnect();
			Statement stmt;
			stmt = (Statement) con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from receipt "
					+ "Inner join voucher on receipt.voucher_id = voucher.id "
					+ "Inner join status on receipt.status_id = status.id "
					+ "Where request = 2 and shipper_id = "+ shipper_id + " group by receipt.id");
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

				li.add(receipt);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return li;
	}
	public List<Receipt> search_order_by_string(String txt, int shipper_id) {
		List<Receipt> li = new LinkedList<>();
		List<Receipt> get = getAllOrder_by_shipper_id(shipper_id);
		for (Receipt o : get) {
			if (o.getFullname().toLowerCase().trim().contains(txt.toLowerCase().trim())
					|| o.getPhone_number().toLowerCase().trim().equals(txt.toLowerCase().trim())
					|| o.getEmail().toLowerCase().trim().contains(txt.toLowerCase().trim())
					|| o.getAddress().toLowerCase().trim().contains(txt.toLowerCase().trim())) {
				li.add(o);
			}
		}
		return li;
	}

	// sort by id - asc
	public List<Receipt> sort_by_id_asc(int shipper_id) {
		List<Receipt> get = getAllOrder_by_shipper_id(shipper_id);
		Collections.sort(get, new Comparator<Receipt>() {
			@Override
			public int compare(Receipt o1, Receipt o2) {
				return o1.getId() - o2.getId();
			}
		});
		return get;
	}

	// sort by id - desc
	public List<Receipt> sort_by_id_desc(int shipper_id) {
		List<Receipt> get = getAllOrder_by_shipper_id(shipper_id);
		Collections.sort(get, new Comparator<Receipt>() {
			@Override
			public int compare(Receipt o1, Receipt o2) {
				return o2.getId() - o1.getId();
			}
		});
		return get;
	}

	// sort by fullname - asc
	public List<Receipt> sort_by_fullname_asc(int shipper_id) {
		List<Receipt> get = getAllOrder_by_shipper_id(shipper_id);
		Collections.sort(get, new Comparator<Receipt>() {
			Collator collator = Collator.getInstance(new Locale("vi", "VN"));

			@Override
			public int compare(Receipt o1, Receipt o2) {
				return collator.compare(o1.getFullname(), o2.getFullname());
			}
		});
		return get;
	}

	// sort by fullname - desc
	public List<Receipt> sort_by_fullname_desc(int shipper_id) {
		List<Receipt> get = getAllOrder_by_shipper_id(shipper_id);
		Collections.sort(get, new Comparator<Receipt>() {
			Collator collator = Collator.getInstance(new Locale("vi", "VN"));

			@Override
			public int compare(Receipt o1, Receipt o2) {
				return collator.compare(o2.getFullname(), o1.getFullname());
			}
		});
		return get;
	}

	// sort by email - asc
	public List<Receipt> sort_by_email_asc(int shipper_id) {
		List<Receipt> get = getAllOrder_by_shipper_id(shipper_id);
		Collections.sort(get, new Comparator<Receipt>() {
			@Override
			public int compare(Receipt o1, Receipt o2) {
				return o1.getEmail().compareToIgnoreCase(o2.getEmail());
			}
		});
		return get;
	}

	// sort by email - desc
	public List<Receipt> sort_by_email_desc(int shipper_id) {
		List<Receipt> get = getAllOrder_by_shipper_id(shipper_id);
		Collections.sort(get, new Comparator<Receipt>() {
			@Override
			public int compare(Receipt o1, Receipt o2) {
				return o2.getEmail().compareToIgnoreCase(o1.getEmail());
			}
		});
		return get;
	}

	// sort by address - asc
	public List<Receipt> sort_by_address_asc(int shipper_id) {
		List<Receipt> get = getAllOrder_by_shipper_id(shipper_id);
		Collections.sort(get, new Comparator<Receipt>() {
			Collator collator = Collator.getInstance(new Locale("vi", "VN"));

			@Override
			public int compare(Receipt o1, Receipt o2) {
				return collator.compare(o1.getAddress(), o2.getAddress());
			}
		});
		return get;
	}

	// sort by address - desc
	public List<Receipt> sort_by_address_desc(int shipper_id) {
		List<Receipt> get = getAllOrder_by_shipper_id(shipper_id);
		Collections.sort(get, new Comparator<Receipt>() {
			Collator collator = Collator.getInstance(new Locale("vi", "VN"));

			@Override
			public int compare(Receipt o1, Receipt o2) {
				return collator.compare(o2.getAddress(), o1.getAddress());
			}
		});
		return get;
	}

	// sort by order_date - asc
	public List<Receipt> sort_by_order_date_asc(int shipper_id) {
		List<Receipt> get = getAllOrder_by_shipper_id(shipper_id);
		Collections.sort(get, new Comparator<Receipt>() {
			@Override
			public int compare(Receipt o1, Receipt o2) {
				return o1.getOrder_date().compareTo(o2.getOrder_date());
			}
		});
		return get;
	}

	// sort by order_date - desc
	public List<Receipt> sort_by_order_date_desc(int shipper_id) {
		List<Receipt> get = getAllOrder_by_shipper_id(shipper_id);
		Collections.sort(get, new Comparator<Receipt>() {
			@Override
			public int compare(Receipt o1, Receipt o2) {
				return o2.getOrder_date().compareTo(o1.getOrder_date());
			}
		});
		return get;
	}

	// sort by status - asc
	public List<Receipt> sort_by_status_asc(int shipper_id) {
		List<Receipt> get = getAllOrder_by_shipper_id(shipper_id);
		Collections.sort(get, new Comparator<Receipt>() {
			@Override
			public int compare(Receipt o1, Receipt o2) {
				return o1.getStatus().getStatus_name().compareToIgnoreCase(o2.getStatus().getStatus_name());
			}
		});
		return get;
	}

	// sort by status - desc
	public List<Receipt> sort_by_status_desc(int shipper_id) {
		List<Receipt> get = getAllOrder_by_shipper_id(shipper_id);
		Collections.sort(get, new Comparator<Receipt>() {
			@Override
			public int compare(Receipt o1, Receipt o2) {
				return o2.getStatus().getStatus_name().compareToIgnoreCase(o1.getStatus().getStatus_name());
			}
		});
		return get;
	}
	
	public boolean canceled_order(int order_id) {
		try {
			connectService = new ConnectService();
			Connection conn = connectService.getConnect();
			String query = "update `receipt` set `request` = 0 where id = ?";
			PreparedStatement preparedStmt = (PreparedStatement) conn.prepareStatement(query);
			preparedStmt.setInt(1, order_id);
			preparedStmt.executeUpdate();
			conn.close();
			return true;
		} catch (Exception e) {
			System.err.println("canceled order shipper error! ");
			System.err.println(e.getMessage());
		}
		return false;
	}
}
