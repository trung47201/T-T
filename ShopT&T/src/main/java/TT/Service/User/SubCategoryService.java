package TT.Service.User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.mysql.jdbc.Statement;

import TT.Model.Category;
import TT.Model.Sub_category;
import TT.Repository.User.StyleRepository;

public class SubCategoryService implements StyleRepository {
	private ConnectService connectService;
	private Sub_category sub_category;
	private Category category;
	
	@Override
	public List<Sub_category> getAllSubCategory() {
		List<Sub_category> li = null;
		try {
			connectService = new ConnectService();
			li = new ArrayList<>();
			Connection con = connectService.getConnect();
			Statement stmt;
			stmt = (Statement) con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from sub_category "
					+ "inner join category on sub_category.category_id = category.id order by sub_category.id asc");
			while (rs.next()) {
				sub_category = new Sub_category();
				category = new Category();
				
				category.setId(rs.getInt("category_id"));
				category.setCategory_name(rs.getString("category_name"));
				category.setDescription(rs.getString("description"));
				
				sub_category.setId(rs.getInt("id"));
				sub_category.setSub_category_name(rs.getString("sub_category_name"));
				sub_category.setCategory(category);
				
				li.add(sub_category);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return li;
	}
	
	public List<Sub_category> getAllSubCategory_sort_by_category_name() {
		List<Sub_category> li = null;
		try {
			connectService = new ConnectService();
			li = new ArrayList<>();
			Connection con = connectService.getConnect();
			Statement stmt;
			stmt = (Statement) con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from sub_category "
					+ "inner join category on sub_category.category_id = category.id order by category.category_name asc");
			while (rs.next()) {
				sub_category = new Sub_category();
				category = new Category();
				
				category.setId(rs.getInt("category_id"));
				category.setCategory_name(rs.getString("category_name"));
				category.setDescription(rs.getString("description"));
				
				sub_category.setId(rs.getInt("id"));
				sub_category.setSub_category_name(rs.getString("sub_category_name"));
				sub_category.setCategory(category);
				
				li.add(sub_category);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return li;
	}
	
	
	public int get_category_id_by_sub_category_id(int id) {
		int cate_id = 0;
		List<Sub_category> li = getAllSubCategory();
		for (Sub_category s : li) {
			if(s.getId() == id) {
				cate_id = s.getCategory().getId();
			}
		}
		return cate_id;
	}
	
	public static void main(String[] args) {
		SubCategoryService s = new  SubCategoryService();
		List<Sub_category> li = s.getAllSubCategory();
		for (Sub_category sub_category : li) {
			System.out.println(sub_category.getId() + "===" + sub_category.getSub_category_name());
		}
	}
	
	
}
