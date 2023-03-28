package TT.Service.User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Statement;

import TT.Model.Sub_category;
import TT.Repository.User.StyleRepository;

public class SubCategoryService implements StyleRepository {
	private ConnectService connectService;
	private Sub_category sub_category;
	
	@Override
	public List<Sub_category> getAllSubCategory() {
		List<Sub_category> li = null;
		try {
			connectService = new ConnectService();
			li = new ArrayList<>();
			Connection con = connectService.getConnect();
			Statement stmt;
			stmt = (Statement) con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from sub_category");
			while (rs.next()) {
				sub_category = new Sub_category();
				sub_category.setId(rs.getInt("id"));
				sub_category.setSub_category_name(rs.getString("sub_category_name"));
				
				li.add(sub_category);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return li;
	}
	
	
	public static void main(String[] args) {
		SubCategoryService s = new  SubCategoryService();
		List<Sub_category> li = s.getAllSubCategory();
		for (Sub_category sub_category : li) {
			System.out.println(sub_category.getId() + "===" + sub_category.getSub_category_name());
		}
	}
	
	
}
