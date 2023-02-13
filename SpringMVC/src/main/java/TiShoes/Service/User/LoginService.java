package TiShoes.Service.User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Statement;

import TiShoes.Model.Role;
import TiShoes.Model.User;
import TiShoes.Repository.User.LoginRepository;

public class LoginService implements LoginRepository{
	private ConnectService connectService;
	private User user;
	private Role role;
	private MD5Service md5Service;
	
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
					+ "Inner join role on user.role_id = role.id");
			while (rs.next()) {
				user = new User();
				role = new Role();
				
				role.setId(rs.getInt("role_id"));
				role.setRole_name(rs.getString("role_name"));
				
				user.setId(rs.getInt("id"));
				user.setFullname(rs.getString("fullname"));
				user.setEmail(rs.getString("email"));
				user.setPhone_number(rs.getString("phone_number"));
				user.setAddress(rs.getString("address"));
				user.setPassword(rs.getString("password"));
				user.setRole(role);
				
				li.add(user);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return li;
	}
	
	@Override
	public boolean checkUserPass(String user, String pass) {
		List<User> li = getAllUser();
		md5Service = new MD5Service();
		for (User u : li) {
			if (u.getEmail().equals(user) && u.getPassword().equals(md5Service.StringToMD5(pass))) {
				return true;
			}
		}
		return false;
	}

	@Override
	public int getIdUser(String user, String pass) {
		List<User> li = getAllUser();
		md5Service = new MD5Service();
		int id_user=0;
		for (User u : li) {
			if (u.getEmail().equals(user) && u.getPassword().equals(md5Service.StringToMD5(pass))) {
				id_user = u.getId();
			}
		}
		return id_user;
	}
	
	public static void main(String[] args) {
		LoginService l = new LoginService();
		
		int a = l.getIdUser("dvtrung@gmail.com", "Trung47201!");
		System.out.println(a);
	}
}
