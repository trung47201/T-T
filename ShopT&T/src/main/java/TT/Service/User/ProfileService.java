package TT.Service.User;

import java.sql.Connection;
import java.util.List;

import com.mysql.jdbc.PreparedStatement;

import TT.Model.User;

public class ProfileService {
	private UserService userService;
	private MD5Service MD5Service;
	private ConnectService connectService;

	public List<User> getAllUser() {
		userService = new UserService();
		return userService.getAllUser();
	}

	public boolean check_pw(String oldpw, User u) {
		MD5Service = new MD5Service();
		if (u.getPassword().trim().equals(MD5Service.StringToMD5(oldpw.trim()))) {
			return true;
		}
		return false;
	}

	public boolean update_pw(String newpw, User u) {
		try {
			MD5Service = new MD5Service();
			newpw = MD5Service.StringToMD5(newpw);
			connectService = new ConnectService();
			Connection conn = connectService.getConnect();
			// check id_prod
			String query = "UPDATE `user` SET `password`= ? WHERE `id` = ?";
			PreparedStatement preparedStmt = (PreparedStatement) conn.prepareStatement(query);
			preparedStmt.setString(1, newpw);
			preparedStmt.setInt(2, u.getId());
			preparedStmt.executeUpdate();
			conn.close();
			return true;
		} catch (Exception e) {
			System.err.println("Got an exception! Update password profileService (43)");
			System.err.println(e.getMessage());
		}
		return false;
	}

	public boolean update_contact(String firstname, String lastname, String phonenumber, String email, User u) {
		try {
			MD5Service = new MD5Service();
			firstname = MD5Service.decodeText(firstname);
			lastname = MD5Service.decodeText(lastname);
			connectService = new ConnectService();
			Connection conn = connectService.getConnect();
			// check id_prod
			String query = "UPDATE `user` SET `firstname`= ?, `lastname`= ?, `phone_number`= ?, `email`= ? WHERE `id` = ?";
			PreparedStatement preparedStmt = (PreparedStatement) conn.prepareStatement(query);
			preparedStmt.setString(1, firstname);
			preparedStmt.setString(2, lastname);
			preparedStmt.setString(3, phonenumber);
			preparedStmt.setString(4, email);
			preparedStmt.setInt(5, u.getId());
			preparedStmt.executeUpdate();
			conn.close();
			return true;
		} catch (Exception e) {
			System.err.println("Got an exception! Update password profileService (68)");
			System.err.println(e.getMessage());
		}
		return false;
	}

	public boolean update_address(String address, String district, String city, User u) {
		try {
			MD5Service = new MD5Service();
			address = MD5Service.decodeText(address);
			district = MD5Service.decodeText(district);
			city = MD5Service.decodeText(city);
			connectService = new ConnectService();
			Connection conn = connectService.getConnect();
			// check id_prod
			String query = "UPDATE `user` SET `address`= ?, `district`= ?, `city`= ? WHERE `id` = ?";
			PreparedStatement preparedStmt = (PreparedStatement) conn.prepareStatement(query);
			preparedStmt.setString(1, address);
			preparedStmt.setString(2, district);
			preparedStmt.setString(3, city);
			preparedStmt.setInt(4, u.getId());
			preparedStmt.executeUpdate();
			conn.close();
			return true;
		} catch (Exception e) {
			System.err.println("Got an exception! Update password profileService (93)");
			System.err.println(e.getMessage());
		}
		return false;
	}

}
