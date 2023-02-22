package TiShoes.Service.User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Statement;
import TiShoes.Model.Gender;
import TiShoes.Repository.User.GenderRepository;

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
}
