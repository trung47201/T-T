package TiShoes.Service.User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Statement;

import TiShoes.Model.Role;
import TiShoes.Model.User;
import TiShoes.Repository.User.UserRepository;

public class UserService implements UserRepository{
	private ConnectService connectService;
	private User user;
	private Role role;
	
	@Override
	public List<User> getAllUser() {
		List<User> li= null;
		try {
			connectService = new ConnectService();
			li = new ArrayList<>();
			Connection con = connectService.getConnect();
			Statement stmt;
			stmt = (Statement) con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from user "
					+ "Inner join role on role.id = user.role_id "
					+ "order by user.id");
			while (rs.next()) {
				user = new User();
				role = new Role();

				role.setId(rs.getInt("role_id"));
				role.setRole_name(rs.getString("role_name"));
				role.setDescription(rs.getString("description"));
				role.setCreated_at(rs.getDate("created_at"));
				role.setUpdated_at(rs.getDate("updated_at"));

				user.setId(rs.getInt("id"));
				user.setFullname(rs.getString("fullname"));
				user.setEmail(rs.getString("email"));
				user.setPhone_number(rs.getString("phone_number"));
				user.setAddress(rs.getString("address"));
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
	
	public User get_user_by_id(int user_id) {
		User user = null;
		for (User u : getAllUser()) {
			if(u.getId() == user_id) {
				user = u;
			}
		}
		return user;
	}
	
	public String getAvatarByUserID(int user_id) {
		String avt = "";
		for (User u : getAllUser()) {
			if(u.getId() == user_id) {
				avt = u.getAvatar();
			}
		}
		return avt;
	}
	
	public static void main(String[] args) {
		//UserService u = new UserService();
		
	}
}
