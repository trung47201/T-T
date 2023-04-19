package TT.Service.User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import TT.Model.Brand;
import TT.Repository.User.BrandRepository;

public class BrandService implements BrandRepository{
	
	private ConnectService connectService;
	private Brand brand;
	@Override
	public List<Brand> getAllBrand() {
		List<Brand> li= null;
		try {
			connectService = new ConnectService();
			li = new ArrayList<>();
			Connection con = connectService.getConnect();
			Statement stmt;
			stmt = (Statement) con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from brand");
			while (rs.next()) {
				brand = new Brand();
				brand.setId(rs.getInt("id"));
				brand.setBrand_name(rs.getString("brand_name"));
				
				li.add(brand);
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
			String sql = "INSERT INTO `brand`(`brand_name`) " + "VALUES (?)";
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
	
	public static void main(String[] args) {
		System.out.println("5".split("_").length);
	}
}
