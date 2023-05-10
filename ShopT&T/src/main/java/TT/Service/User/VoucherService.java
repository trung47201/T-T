package TT.Service.User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import TT.Model.Product;
import TT.Model.Voucher;
import TT.Repository.User.VoucherRepository;
import TT.Service.User.Product.ShoesService;

public class VoucherService implements VoucherRepository {
	private ConnectService connectService;
	private Voucher voucher;

	@Override
	public List<Voucher> getAllVoucher() {
		List<Voucher> li = null;
		try {
			connectService = new ConnectService();
			li = new ArrayList<>();
			Connection con = connectService.getConnect();
			Statement stmt;
			stmt = (Statement) con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from voucher");
			while (rs.next()) {
				voucher = new Voucher();

				voucher.setId(rs.getInt("id"));
				voucher.setCode(rs.getString("code"));
				voucher.setVcdiscount(rs.getInt("vcdiscount"));
				voucher.setLimit(rs.getInt("limit"));
				voucher.setApplyfor(rs.getInt("applyfor"));
				voucher.setStart_date(rs.getTimestamp("start_date"));
				voucher.setEnd_date(rs.getTimestamp("end_date"));
				voucher.setCreated_at(rs.getTimestamp("created_at"));
				voucher.setUpdated_at(rs.getTimestamp("updated_at"));
				voucher.setDescription(rs.getString("description"));

				li.add(voucher);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return li;
	}

	@Override
	public int getDiscountById_Voucher(int voucher_id) {
		int discount = 0;
		List<Voucher> li = getAllVoucher();
		for (Voucher voucher : li) {
			if (voucher.getId() == voucher_id) {
				discount = voucher.getVcdiscount();
			}
		}
		return discount;
	}

	@Override
	public int getVoucherIdByCode(String code) {
		int id = 0;
		List<Voucher> li = getAllVoucher();
		for (Voucher voucher : li) {
			if (voucher.getCode().trim().equalsIgnoreCase(code.trim())) {
				id = voucher.getId();
			}
		}
		return id;
	}

	public boolean voucher_exists_by_code(String code) {
		List<Voucher> li = getAllVoucher();
		for (Voucher vc : li) {
			if (vc.getCode().trim().equalsIgnoreCase(code.trim())) {
				return true;
			}
		}
		return false;
	}

	public boolean expired_voucher_by_code(String code) {
		Timestamp datenow = new Timestamp(new java.util.Date().getTime());
		Timestamp end_date_vch = null;
		List<Voucher> li = getAllVoucher();
		for (Voucher vc : li) {
			if (vc.getCode().trim().equalsIgnoreCase(code.trim())) {
				end_date_vch = vc.getEnd_date();
				if (datenow.compareTo(end_date_vch) > 0) {
					return true; // expired
				} else {
					return false;
				}
			}
		}
		return false;
	}

	public boolean voucher_start_date_by_code(String code) {
		Timestamp datenow = new Timestamp(new java.util.Date().getTime());
		Timestamp start_date_vch = null;
		List<Voucher> li = getAllVoucher();
		for (Voucher vc : li) {
			if (vc.getCode().trim().equalsIgnoreCase(code.trim())) {
				start_date_vch = vc.getStart_date();
				if (datenow.compareTo(start_date_vch) < 0) {
					return true; // not started yet
				} else {
					return false;
				}
			}
		}
		return false;
	}

	public double get_apply_for_by_code(String code) {
		List<Voucher> li = getAllVoucher();
		int apply_for = 0;
		for (Voucher vc : li) {
			if (vc.getCode().equalsIgnoreCase(code)) {
				apply_for = vc.getApplyfor();
			}
		}
		return (double) apply_for;
	}

	public int get_discount_by_voucher_code(String code) {
		return getDiscountById_Voucher(getVoucherIdByCode(code));
	}

	public boolean update_limit_voucher(int id) {
		try {
			connectService = new ConnectService();
			Connection conn = connectService.getConnect();
			// check id_prod
			String query = "UPDATE `voucher` SET `limit`= `limit` - 1 WHERE `id` = ?";
			PreparedStatement preparedStmt = (PreparedStatement) conn.prepareStatement(query);
			preparedStmt.setInt(1, id);
			preparedStmt.executeUpdate();
			conn.close();
			return true;
		} catch (Exception e) {
			System.err.println("Got an exception! Update voucher limit (qty)");
			System.err.println(e.getMessage());
		}
		return false;
	}
	
	public HashMap<Voucher, Integer> get_expiry_date() {
		HashMap<Voucher, Integer> rs = new LinkedHashMap<>();
		Timestamp datenow = new Timestamp(new java.util.Date().getTime());
		Timestamp start_date_vch = null;
		Timestamp end_date_vch = null;
		List<Voucher> li = getAllVoucher();
		for (Voucher vc : li) {
			if (vc.getId() != 1 && vc.getLimit() > 0) {
				start_date_vch = vc.getStart_date();
				end_date_vch = vc.getEnd_date();
				if (datenow.compareTo(start_date_vch) >= 0 && datenow.compareTo(end_date_vch) < 0) {
					rs.put(vc, 0);
					System.out.println(start_date_vch);
				} else if (datenow.compareTo(start_date_vch) < 0) {
					rs.put(vc, 1);
				}
				System.out.println(end_date_vch +"===" +end_date_vch.toLocalDateTime().getDayOfMonth());
			}
		}
		return rs;
	}
	
	public List<Product> get_all_product_discount() {
		ShoesService shoes = new ShoesService();
		List<Product> rs = new ArrayList<>();
		List<Product> li = shoes.getAllProducts();
		for (Product p : li) {
			if(p.getDiscount() > 0) {
				rs.add(p);
			}
		}
		return rs;
	}
	
	public String get_voucher_code_by_id(int id) {
		String code = "";
		List<Voucher> li = getAllVoucher();
		for (Voucher voucher : li) {
			if (voucher.getId() == id) {
				code = voucher.getCode();
			}
		}
		return code;
	}


	public static void main(String[] args) {
		VoucherService v = new VoucherService();
		v.get_all_product_discount();
	}
}
