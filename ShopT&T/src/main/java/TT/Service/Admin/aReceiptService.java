package TT.Service.Admin;

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
import TT.Repository.Admin.aOrderRepository;
import TT.Service.User.ConnectService;

public class aReceiptService implements aOrderRepository {
	private ConnectService connectService;
	private Receipt receipt;
	private Voucher voucher;
	private Status status;

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
							+ "Inner join status on receipt.status_id = status.id " + "group by receipt.id");
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
				receipt.setBarcode(rs.getString("barcode"));
				li.add(receipt);
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
			String sql = "INSERT INTO `receipt`(`fullname`, `email`, `phone_number`, `address`, `order_date`, `updated_at`, `voucher_id`, `note`, `status`, `method` , `discount_at`) "
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
		int order_id = getAllOrder().get(size - 1).getId();
		return order_id;
	}

	public Receipt getOrderByID(int id_order) {
		Receipt od = new Receipt();
		for (Receipt o : getAllOrder()) {
			if (o.getId() == id_order) {
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
			// check id_prod
			boolean check = false;
			List<Receipt> list = getAllOrder();
			for (Receipt o : list) {
				if (o.getId() == order_id) {
					check = true;
				}
			}
			if (check) {
				String query = "update receipt set status_id = ? where id = ?";
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

	public List<Receipt> search_order_by_string(String txt) {
		List<Receipt> li = new LinkedList<>();
		List<Receipt> get = getAllOrder();
		for (Receipt o : get) {
			if (o.getFullname().toLowerCase().trim().equals(txt.toLowerCase().trim())
					|| o.getPhone_number().toLowerCase().trim().equals(txt.toLowerCase().trim())
					|| o.getEmail().toLowerCase().trim().equals(txt.toLowerCase().trim())) {
				li.add(o);
				System.out.println(o.getId() + "--" + o.getPhone_number() + "==" + txt);
			}
		}
		return li;
	}

	// sort by id - asc
	public List<Receipt> sort_by_id_asc() {
		List<Receipt> get = getAllOrder();
		Collections.sort(get, new Comparator<Receipt>() {
			@Override
			public int compare(Receipt o1, Receipt o2) {
				return o1.getId() - o2.getId();
			}
		});
		return get;
	}

	// sort by id - desc
	public List<Receipt> sort_by_id_desc() {
		List<Receipt> get = getAllOrder();
		Collections.sort(get, new Comparator<Receipt>() {
			@Override
			public int compare(Receipt o1, Receipt o2) {
				return o2.getId() - o1.getId();
			}
		});
		return get;
	}

	// sort by fullname - asc
	public List<Receipt> sort_by_fullname_asc() {
		List<Receipt> get = getAllOrder();
	    Collections.sort(get, new Comparator<Receipt>() {
	        Collator collator = Collator.getInstance(new Locale("vi","VN"));
	        @Override
	        public int compare(Receipt o1, Receipt o2) {
	            return collator.compare(o1.getFullname(), o2.getFullname());
	        }
	    });
	    return get;
	}

	// sort by fullname - desc
	public List<Receipt> sort_by_fullname_desc() {
		List<Receipt> get = getAllOrder();
	    Collections.sort(get, new Comparator<Receipt>() {
	        Collator collator = Collator.getInstance(new Locale("vi","VN"));
	        @Override
	        public int compare(Receipt o1, Receipt o2) {
	            return collator.compare(o2.getFullname(), o1.getFullname());
	        }
	    });
	    return get;
	}

	// sort by email - asc
	public List<Receipt> sort_by_email_asc() {
		List<Receipt> get = getAllOrder();
		Collections.sort(get, new Comparator<Receipt>() {
			@Override
			public int compare(Receipt o1, Receipt o2) {
				return o1.getEmail().compareToIgnoreCase(o2.getEmail());
			}
		});
		return get;
	}

	// sort by email - desc
	public List<Receipt> sort_by_email_desc() {
		List<Receipt> get = getAllOrder();
		Collections.sort(get, new Comparator<Receipt>() {
			@Override
			public int compare(Receipt o1, Receipt o2) {
				return o2.getEmail().compareToIgnoreCase(o1.getEmail());
			}
		});
		return get;
	}

	// sort by address - asc
	public List<Receipt> sort_by_address_asc() {
		List<Receipt> get = getAllOrder();
	    Collections.sort(get, new Comparator<Receipt>() {
	        Collator collator = Collator.getInstance(new Locale("vi","VN"));
	        @Override
	        public int compare(Receipt o1, Receipt o2) {
	            return collator.compare(o1.getAddress(), o2.getAddress());
	        }
	    });
	    return get;
	}

	// sort by address - desc
	public List<Receipt> sort_by_address_desc() {
		List<Receipt> get = getAllOrder();
	    Collections.sort(get, new Comparator<Receipt>() {
	        Collator collator = Collator.getInstance(new Locale("vi","VN"));
	        @Override
	        public int compare(Receipt o1, Receipt o2) {
	            return collator.compare(o2.getAddress(), o1.getAddress());
	        }
	    });
	    return get;
	}


	// sort by order_date - asc
	public List<Receipt> sort_by_order_date_asc() {
		List<Receipt> get = getAllOrder();
		Collections.sort(get, new Comparator<Receipt>() {
			@Override
			public int compare(Receipt o1, Receipt o2) {
				return o1.getOrder_date().compareTo(o2.getOrder_date());
			}
		});
		return get;
	}

	// sort by order_date - desc
	public List<Receipt> sort_by_order_date_desc() {
		List<Receipt> get = getAllOrder();
		Collections.sort(get, new Comparator<Receipt>() {
			@Override
			public int compare(Receipt o1, Receipt o2) {
				return o2.getOrder_date().compareTo(o1.getOrder_date());
			}
		});
		return get;
	}

	// sort by status - asc
	public List<Receipt> sort_by_status_asc() {
		List<Receipt> get = getAllOrder();
		Collections.sort(get, new Comparator<Receipt>() {
			@Override
			public int compare(Receipt o1, Receipt o2) {
				return o1.getStatus().getStatus_name().compareToIgnoreCase(o2.getStatus().getStatus_name());
			}
		});
		return get;
	}

	// sort by status - desc
	public List<Receipt> sort_by_status_desc() {
		List<Receipt> get = getAllOrder();
		Collections.sort(get, new Comparator<Receipt>() {
			@Override
			public int compare(Receipt o1, Receipt o2) {
				return o2.getStatus().getStatus_name().compareToIgnoreCase(o1.getStatus().getStatus_name());
			}
		});
		return get;
	}
	
	public boolean packing_generator_qrcode(int order_id, String qrcode, String barcode) {
		try {
			connectService = new ConnectService();
			Connection conn = connectService.getConnect();
			String query = "update `receipt` set `qrcode`= ?, `barcode`= ? where id = ?";
			PreparedStatement preparedStmt = (PreparedStatement) conn.prepareStatement(query);
			preparedStmt.setString(1, qrcode);
			preparedStmt.setString(2, barcode);
			preparedStmt.setInt(3, order_id);
			preparedStmt.executeUpdate();
			conn.close();
			return true;

		} catch (Exception e) {
			System.err.println("Got an exception 377 aOrderService! ");
			System.err.println(e.getMessage());
		}
		return false;
	}

	public double get_discount_by_order_id (int order_id) {
		double rs = 0;
		List<Receipt> li = getAllOrder();
		for (Receipt receipt : li) {
			if(order_id == receipt.getId()) {
				rs = receipt.getDiscount_at();
			}
		}
		return rs;
	}
	
	public static void main(String[] args) {
	}
}
