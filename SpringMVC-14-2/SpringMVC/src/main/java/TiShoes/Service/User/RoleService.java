package TiShoes.Service.User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Statement;

import TiShoes.Model.Role;
import TiShoes.Model.User;
import TiShoes.Repository.User.RoleRepository;

public class RoleService implements RoleRepository {
	private ConnectService connectService;
	private Role role;

	@Override public List<Role> getAllRole() {
		List<Role> li = null;
		try {
			connectService = new ConnectService();
			li = new ArrayList<>();
			Connection con = connectService.getConnect();
			Statement stmt;
			stmt = (Statement) con.createStatement()	;
			ResultSet rs = stmt.executeQuery(
					"select * from role");
			while (rs.next()) {
				role = new Role();

				role.setId(rs.getInt("id"));
				role.setRole_name(rs.getString("role_name"));
				role.setDescription(rs.getString("description"));
				role.setCreated_at(rs.getDate("created_at"));
				role.setUpdated_at(rs.getDate("updated_at"));

				li.add(role);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return li;
	}

}
