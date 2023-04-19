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

import TT.Model.Role;
import TT.Model.User;
import TT.Model.Voucher;
import TT.Model.Voucher_save;

public class Voucher_SaveService {
	private ConnectService connectService;
	private Voucher_save voucher_save;
	private Voucher voucher;
	private User user;
	private Role role;

	public List<Voucher_save> getAllVoucher() {
		List<Voucher_save> li = null;
		try {
			connectService = new ConnectService();
			li = new ArrayList<>();
			Connection con = connectService.getConnect();
			Statement stmt;
			stmt = (Statement) con.createStatement();
			ResultSet rs = stmt.executeQuery(
					"select * from voucher_save " + "Inner join voucher on voucher.id = voucher_save.voucher_id "
							+ "Inner join user on user.id = voucher_save.user_id "
							+ "Inner join role on role.id = user.role_id " + "");
			while (rs.next()) {
				voucher = new Voucher();
				voucher_save = new Voucher_save();

				user = new User();
				role = new Role();

				role.setId(rs.getInt("role_id"));
				role.setRole_name(rs.getString("role_name"));
				role.setDescription(rs.getString("description"));
				role.setCreated_at(rs.getDate("created_at"));
				role.setUpdated_at(rs.getDate("updated_at"));

				user.setId(rs.getInt("user_id"));
				user.setFirstname(rs.getString("firstname"));
				user.setLastname(rs.getString("lastname"));
				user.setEmail(rs.getString("email"));
				user.setPhone_number(rs.getString("phone_number"));
				user.setAddress(rs.getString("address"));
				user.setPassword(rs.getString("password"));
				user.setAvatar(rs.getString("avatar"));
				user.setStatus(rs.getInt("status"));
				user.setRole(role);
				user.setCreated_at(rs.getDate("created_at"));
				user.setUpdated_at(rs.getDate("updated_at"));

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

				voucher_save.setId(rs.getInt("id"));
				voucher_save.setVoucher(voucher);
				voucher_save.setUser(user);
				voucher_save.setQuantity(rs.getInt("quantity"));
				voucher_save.setStatus(rs.getInt("status"));

				li.add(voucher_save);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return li;
	}

	public boolean insert(int user_id, int vch_id) {
		try {
			connectService = new ConnectService();
			Connection conn = connectService.getConnect();
			if (check_qty_vch_save(user_id, vch_id) <= 0) {
				String sql = "INSERT INTO `voucher_save`(`voucher_id`, `user_id`, `quantity`, `status`) "
						+ "VALUES (?, ?, ?, ?)";
				PreparedStatement preparedStmt = (PreparedStatement) conn.prepareStatement(sql);
				preparedStmt.setInt(1, vch_id);
				preparedStmt.setInt(2, user_id);
				preparedStmt.setInt(3, 1);
				preparedStmt.setInt(4, 0);
				preparedStmt.execute();
				conn.close();
				return true;
			}
		} catch (Exception e) {
			System.out.println("got an exception (76) colorservice");
			e.printStackTrace();
		}
		return false;
	}

	public int check_qty_vch_save(int user_id, int vch_id) {
		int qty = 0;
		List<Voucher_save> li = getAllVoucher();
		for (Voucher_save v : li) {
			if (v.getUser().getId() == user_id && v.getVoucher().getId() == vch_id) {
				qty = v.getQuantity();
			}
		}
		return qty;

	}

	public int get_id_voucher(int id) {
		int vcid = 0;
		List<Voucher_save> li = getAllVoucher();
		for (Voucher_save v : li) {
			System.out.println(v.getId() + "==" + v.getVoucher().getId());
			if (v.getId() == id) {
				vcid = v.getVoucher().getId();
			}
		}
		return vcid;

	}

	public boolean update(int userid, int vcid) {
		try {
			connectService = new ConnectService();
			Connection conn = connectService.getConnect();
			// check id_prod
			String query = "UPDATE `voucher_save` SET `status`= 1 WHERE `user_id` = ? and `voucher_id` = ? ";
			PreparedStatement preparedStmt = (PreparedStatement) conn.prepareStatement(query);
			preparedStmt.setInt(1, userid);
			preparedStmt.setInt(2, vcid);
			preparedStmt.executeUpdate();
			conn.close();
			return true;
		} catch (Exception e) {
			System.err.println("Got an exception! Update voucher limit (qty)");
			System.err.println(e.getMessage());
		}
		return false;
	}

	public HashMap<Voucher_save, Integer> get_all_voucher_save_by_user_id(int userid) {
		HashMap<Voucher_save, Integer> rs = new LinkedHashMap<>();
		Timestamp datenow = new Timestamp(new java.util.Date().getTime());
		Timestamp start_date_vch = null;
		Timestamp end_date_vch = null;
		List<Voucher_save> li = getAllVoucher();
		for (Voucher_save vc : li) {
			if (vc.getVoucher().getId() != 1 && vc.getUser().getId() == userid && vc.getStatus() == 0) {
				start_date_vch = vc.getVoucher().getStart_date();
				end_date_vch = vc.getVoucher().getEnd_date();
				if (datenow.compareTo(start_date_vch) >= 0 && datenow.compareTo(end_date_vch) < 0) {
					rs.put(vc, 0);
				} else if (datenow.compareTo(start_date_vch) < 0) {
					rs.put(vc, 1);
				}
			}
		}
		return rs;
	}

}
