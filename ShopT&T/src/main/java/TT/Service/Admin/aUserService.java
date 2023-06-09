package TT.Service.Admin;

import java.sql.Connection;
import java.util.List;

import com.mysql.jdbc.PreparedStatement;

import TT.Model.User;
import TT.Repository.Admin.aUserRepository;
import TT.Service.User.ConnectService;
import TT.Service.User.MD5Service;
import TT.Service.User.UserService;

public class aUserService implements aUserRepository {

	private UserService userService;
	private ConnectService connectService;
	private MD5Service md5Service;

	@Override
	public List<User> getAllUser() {
		userService = new UserService();
		return userService.getAllUser();
	}

	@Override
	public boolean existUser(String email, String phone_number) {
		for (User u : getAllUser()) {
			if (u.getEmail().equals(email) || u.getPhone_number().equals(phone_number)) {
				return true;
			}
		}
		return false;
	}

	@Override
	public boolean insert(String firstname, String lastname, String email, String phone_number, String address,
			String district, String city, String password, String avatar, int role_id) {
		try {
			md5Service = new MD5Service();
			if (!md5Service.decodeText(firstname).equals("")) {
				firstname = md5Service.decodeText(firstname);
			}
			if (!md5Service.decodeText(lastname).equals("")) {
				lastname = md5Service.decodeText(lastname);
			}
			if (!md5Service.decodeText(address).equals("")) {
				address = md5Service.decodeText(address);
			}
			if (!md5Service.decodeText(district).equals("")) {
				district = md5Service.decodeText(district);
			}
			if (!md5Service.decodeText(city).equals("")) {
				city = md5Service.decodeText(city);
			}
			connectService = new ConnectService();
			Connection conn = connectService.getConnect();
			String passwordMd5 = md5Service.StringToMD5(password);
			java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
			if (existUser(email, phone_number)) {
				return false;
			} else {
				if (avatar.equals("null") || avatar.equals("")) {
					String sql = "INSERT INTO `user`(`firstname`, `lastname`, `email`, `phone_number`, `address`, `district`, `city`, `password`, `avatar`, `status`, `role_id`, `created_at`, `updated_at`) "
							+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
					PreparedStatement preparedStmt = (PreparedStatement) conn.prepareStatement(sql);
					preparedStmt.setString(1, firstname);
					preparedStmt.setString(2, lastname);
					preparedStmt.setString(3, email);
					preparedStmt.setString(4, phone_number);
					preparedStmt.setString(5, address);
					preparedStmt.setString(6, district);
					preparedStmt.setString(7, city);
					preparedStmt.setString(8, passwordMd5);
					preparedStmt.setString(9, "avt-default.jpg");
					preparedStmt.setInt(10, 0);
					preparedStmt.setInt(11, role_id);
					preparedStmt.setTimestamp(12, date);
					preparedStmt.setTimestamp(13, date);
					preparedStmt.execute();
					conn.close();
				} else {
					String sql = "INSERT INTO `user`(`firstname`, `lastname`, `email`, `phone_number`, `address`,`district`, `city`,  `password`, `avatar`, `status`, `role_id`, `created_at`, `updated_at`) "
							+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
					PreparedStatement preparedStmt = (PreparedStatement) conn.prepareStatement(sql);
					preparedStmt.setString(1, firstname);
					preparedStmt.setString(2, lastname);
					preparedStmt.setString(3, email);
					preparedStmt.setString(4, phone_number);
					preparedStmt.setString(5, address);
					preparedStmt.setString(6, district);
					preparedStmt.setString(7, city);
					preparedStmt.setString(8, passwordMd5);
					preparedStmt.setString(9, avatar);
					preparedStmt.setInt(10, 0);
					preparedStmt.setInt(11, role_id);
					preparedStmt.setTimestamp(12, date);
					preparedStmt.setTimestamp(13, date);
					preparedStmt.execute();
					conn.close();

				}
				return true;
			}

		} catch (Exception e) {
			System.err.println("Got an exception!");
			// printStackTrace method
			// prints line numbers + call stack
			e.printStackTrace();
			// Prints what exception has been thrown
			System.out.println(e);
		}
		return false;
	}

	@Override
	public boolean update(String firstname, String lastname, String email, String phone_number, String address,
			String district, String city, String password, String avatar, int role_id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean blockUser(int user_id) {
		try {
			connectService = new ConnectService();
			Connection con = connectService.getConnect();
			boolean check_exists_user = false;
			for (User u : getAllUser()) {
				if (u.getId() == user_id) {
					check_exists_user = true;
				}
			}
			if (check_exists_user) {
				String sql = "UPDATE `user` SET `status`= ? WHERE id = ? ";
				PreparedStatement preparedStmt = (PreparedStatement) con.prepareStatement(sql);
				preparedStmt.setInt(1, 1);
				preparedStmt.setInt(2, user_id);
				preparedStmt.execute();
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			System.err.println("Got an exception!");
			// printStackTrace method
			// prints line numbers + call stack
			e.printStackTrace();
			// Prints what exception has been thrown
			System.out.println(e);
		}
		return false;
	}

	@Override
	public boolean unblockUser(int user_id) {
		try {
			connectService = new ConnectService();
			Connection con = connectService.getConnect();
			boolean check_exists_user = false;
			for (User u : getAllUser()) {
				if (u.getId() == user_id) {
					check_exists_user = true;
				}
			}
			if (check_exists_user) {
				String sql = "UPDATE `user` SET `status`= ? WHERE id = ? ";
				PreparedStatement preparedStmt = (PreparedStatement) con.prepareStatement(sql);
				preparedStmt.setInt(1, 0);
				preparedStmt.setInt(2, user_id);
				preparedStmt.execute();
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			System.err.println("Got an exception!");
			// printStackTrace method
			// prints line numbers + call stack
			e.printStackTrace();
			// Prints what exception has been thrown
			System.out.println(e);
		}
		return false;
	}

	public int check_login(String user, String pass) {
		int id = 0;
		md5Service = new MD5Service();
		for (User u : getAllUser()) {
			if ((u.getEmail().equals(user) && u.getPassword().equals(md5Service.StringToMD5(pass))
					&& u.getRole().getId() == 1)
					|| (u.getPhone_number().equals(user) && u.getPassword().equals(md5Service.StringToMD5(pass))
							&& u.getRole().getId() == 1)) {
				return u.getId();
			}
		}
		return id;
	}

	public static void main(String[] args) {
//		aUserService a = new aUserService();
//		System.out.println(a.check_login("0369796369", "Trung47201!"));
	}
}
