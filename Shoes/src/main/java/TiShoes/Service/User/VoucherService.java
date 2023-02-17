package TiShoes.Service.User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
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
				voucher.setStart_date(rs.getDate("start_date"));
				voucher.setEnd_date(rs.getDate("end_date"));
				voucher.setCreated_at(rs.getDate("created_at"));
				voucher.setUpdated_at(rs.getDate("updated_at"));
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
			if (voucher.getCode().trim().equals(code.trim())) {
				id = voucher.getId();
			}
		}
		return id;
	}

	public static void main(String[] args) {
		VoucherService v = new VoucherService();
		System.out.println(v.getVoucherIdByCode(""));
	}
}
