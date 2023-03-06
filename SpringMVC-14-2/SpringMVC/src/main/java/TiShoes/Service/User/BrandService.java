package TiShoes.Service.User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Statement;

import TiShoes.Model.Brand;
import TiShoes.Repository.User.BrandRepository;

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
	
	
	
	public static void main(String[] args) {
		System.out.println("5".split("_").length);
	}
}
