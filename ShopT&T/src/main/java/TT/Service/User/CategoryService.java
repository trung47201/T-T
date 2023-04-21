package TT.Service.User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import TT.Model.Category;

public class CategoryService {
	private ConnectService connectService;
	private Category category;

	public List<Category> getAllCategory() {
		List<Category> li = null;
		try {
			connectService = new ConnectService();
			li = new ArrayList<>();
			Connection con = connectService.getConnect();
			Statement stmt;
			stmt = (Statement) con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from category");
			while (rs.next()) {
				category = new Category();

				category.setId(rs.getInt("id"));
				category.setCategory_name(rs.getString("category_name"));
				category.setDescription(rs.getString("description"));

				li.add(category);
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
			String sql = "INSERT INTO `category`(`category_name`) " + "VALUES (?)";
			PreparedStatement preparedStmt = (PreparedStatement) conn.prepareStatement(sql);
			preparedStmt.setString(1, name);
			preparedStmt.execute();
			conn.close();
			return true;
		} catch (Exception e) {
			System.out.println("got an exception (54) categoryService");
			e.printStackTrace();
		}
		return false;
	}
}
