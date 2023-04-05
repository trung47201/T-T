package TT.Service.Shipper;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Statement;

import TT.Model.Role;
import TT.Model.User;
import TT.Service.User.ConnectService;
import TT.Service.User.MD5Service;

public class sLoginService {

	private ConnectService connectService;
	private User user;
	private Role role;
	private MD5Service md5Service;

	public List<User> getAllUserShipper() {
		List<User> li = null;
		try {
			connectService = new ConnectService();
			li = new ArrayList<>();
			Connection con = connectService.getConnect();
			Statement stmt;
			stmt = (Statement) con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from user " + "Inner join role on role.id = user.role_id "
					+ "where role.id = 4 order by user.id");
			while (rs.next()) {
				user = new User();
				role = new Role();

				role.setId(rs.getInt("role_id"));
				role.setRole_name(rs.getString("role_name"));
				role.setDescription(rs.getString("description"));
				role.setCreated_at(rs.getDate("created_at"));
				role.setUpdated_at(rs.getDate("updated_at"));

				user.setId(rs.getInt("id"));
				user.setFirstname(rs.getString("firstname"));
				user.setLastname(rs.getString("lastname"));
				user.setEmail(rs.getString("email"));
				user.setPhone_number(rs.getString("phone_number"));
				user.setAddress(rs.getString("address"));
				user.setDistrict(rs.getString("district"));
				user.setCity(rs.getString("city"));
				user.setPassword(rs.getString("password"));
				user.setAvatar(rs.getString("avatar"));
				user.setStatus(rs.getInt("status"));
				user.setRole(role);
				user.setCreated_at(rs.getDate("created_at"));
				user.setUpdated_at(rs.getDate("updated_at"));
				li.add(user);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return li;
	}

	public int check_login(String user, String pass) {
		int id = 0;
		md5Service = new MD5Service();
		for (User u : getAllUserShipper()) {
			if ((u.getEmail().equals(user) && u.getPassword().equals(md5Service.StringToMD5(pass)))
					|| (u.getPhone_number().equals(user) && u.getPassword().equals(md5Service.StringToMD5(pass)))) {
				return u.getId();
			}
		}
		return id;
	}
}
