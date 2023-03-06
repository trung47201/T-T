package TiShoes.Service.User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Statement;

import TiShoes.Model.Voucher;
import TiShoes.Repository.User.VoucherRepository;

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
				voucher.setDiscount(rs.getInt("discount"));
				voucher.setLimit(rs.getInt("limit"));
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
				discount = voucher.getDiscount();
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
			if(vc.getCode().trim().equalsIgnoreCase(code.trim())) {
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
			if(vc.getCode().trim().equalsIgnoreCase(code.trim())) {
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
			if(vc.getCode().trim().equalsIgnoreCase(code.trim())) {
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
	
	public int get_discount_by_voucher_code(String code) {
		return getDiscountById_Voucher(getVoucherIdByCode(code));
	}
	
	public static void main(String[] args) {
	}
}
