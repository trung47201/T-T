package TT.Service.User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import TT.Model.Gender;
import TT.Repository.User.GenderRepository;

public class GenderService implements GenderRepository {
	private ConnectService connectService;
	private Gender gender;

	@Override
	public List<Gender> getAllGender() {
		List<Gender> li = null;
		try {
			connectService = new ConnectService();
			li = new ArrayList<>();
			Connection con = connectService.getConnect();
			Statement stmt;
			stmt = (Statement) con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from gender");
			while (rs.next()) {
				gender = new Gender();
				gender.setId(rs.getInt("id"));
				gender.setGender_name(rs.getString("gender_name"));
				gender.setDescription(rs.getString("description"));
				li.add(gender);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return li;
	}
	
	public boolean insert(String name) {
		try {
			connectService = new ConnectService();
			Connection conn = connectService.getConnect();
			String sql = "INSERT INTO `gender`(`gender_name`) " + "VALUES (?)";
			PreparedStatement preparedStmt = (PreparedStatement) conn.prepareStatement(sql);
			preparedStmt.setString(1, name);
			preparedStmt.execute();
			conn.close();
			return true;
		} catch (Exception e) {
			System.out.println("got an exception (54) genderService");
			e.printStackTrace();
		}
		return false;
	}
}
