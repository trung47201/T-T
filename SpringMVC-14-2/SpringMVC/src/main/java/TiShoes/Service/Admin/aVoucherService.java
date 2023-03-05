package TiShoes.Service.Admin;

import java.sql.Connection;
import java.sql.Timestamp;
import java.util.LinkedList;
import java.util.List;

import com.mysql.jdbc.PreparedStatement;

import TiShoes.Model.Voucher;
import TiShoes.Repository.Admin.aVoucherRepository;
import TiShoes.Service.User.ConnectService;
import TiShoes.Service.User.VoucherService;

public class aVoucherService implements aVoucherRepository {
	private VoucherService voucherService;
	private ConnectService connectService;

	@Override
	public List<Voucher> getAllVoucher() {
		voucherService = new VoucherService();
		List<Voucher> li = voucherService.getAllVoucher();
		return li;
	}

	@Override
	public boolean insert(String code, int discount, int limit, Timestamp start_date, Timestamp end_date,
			String description) {
		try {
			connectService = new ConnectService();
			Connection conn = connectService.getConnect();
			Timestamp date = new Timestamp(new java.util.Date().getTime());
			if (!exists_voucher_code(code)) {
				String sql = "INSERT INTO `voucher`(`code`, `discount`, `limit`, `start_date`, `end_date`, `created_at`, `updated_at`, `description`) "
						+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
				PreparedStatement preparedStmt = (PreparedStatement) conn.prepareStatement(sql);
				preparedStmt.setString(1, code);
				preparedStmt.setInt(2, discount);
				preparedStmt.setInt(3, limit);
				preparedStmt.setTimestamp(4, start_date);
				preparedStmt.setTimestamp(5, end_date);
				preparedStmt.setTimestamp(6, date);
				preparedStmt.setTimestamp(7, date);
				preparedStmt.setString(8, description);
				preparedStmt.execute();
				conn.close();
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean update(int id, int discount, int limit, Timestamp start_date, Timestamp end_date,
			String description) {
		try {
			connectService = new ConnectService();
			Connection conn = connectService.getConnect();
			String sql = "UPDATE `voucher` SET `discount`= ?,`limit`= ?,`start_date`= ?,`end_date`= ?,`description`= ? WHERE id = ?";
			PreparedStatement preparedStmt = (PreparedStatement) conn.prepareStatement(sql);
			preparedStmt.setInt(1, discount);
			preparedStmt.setInt(2, limit);
			preparedStmt.setTimestamp(3, start_date);
			preparedStmt.setTimestamp(4, end_date);
			preparedStmt.setString(5, description);
			preparedStmt.setInt(6, id);
			preparedStmt.execute();
			conn.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public boolean exists_voucher_code(String code) {
		List<Voucher> liVC = getAllVoucher();
		for (Voucher vc : liVC) {
			if (vc.getCode().trim().equals(code.trim())) {
				return true;
			}
		}
		return false;
	}

	public List<Voucher> find_voucher_by_string(String s) {
		List<Voucher> liVC = getAllVoucher();
		List<Voucher> li = new LinkedList<>();
		if (is_number(s)) {
			for (Voucher vc : liVC) {
				if (vc.getDiscount() == Integer.parseInt(s) || vc.getLimit() == Integer.parseInt(s)) {
					li.add(vc);
				}
			}
		} else {
			for (Voucher vc : liVC) {
				if (vc.getCode().equals(s) || vc.getDescription().equals(s)) {
					li.add(vc);
				}
			}
		}
		return li;
	}

	public boolean is_number(String s) {
		try {
			Double.parseDouble(s);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	public Voucher get_voucher_by_id_vc(int id) {
		Voucher new_vc = null;
		List<Voucher> liVC = getAllVoucher();
		for (Voucher vc : liVC) {
			if (vc.getId() == id) {
				new_vc = vc;
			}
		}
		return new_vc;
	}
}
