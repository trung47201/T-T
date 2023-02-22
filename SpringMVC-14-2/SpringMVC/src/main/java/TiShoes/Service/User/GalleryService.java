package TiShoes.Service.User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import TiShoes.Model.Brand;
import TiShoes.Model.Gallery;
import TiShoes.Model.Gender;
import TiShoes.Model.Product;
import TiShoes.Model.Role;
import TiShoes.Model.Style;
import TiShoes.Model.User;
import TiShoes.Repository.User.GalleryRepository;

public class GalleryService implements GalleryRepository {
	private ConnectService connectService;
	private Gallery gallery;
	private Brand brand;
	private User user;
	private Role role;
	private Product product;
	private Style style;
	private Gender gender;
	@Override
	public List<Gallery> getAllGallery() {
		List<Gallery> li= null;
		try {
			connectService = new ConnectService();
			li = new ArrayList<>();
			Connection con = connectService.getConnect();
			Statement stmt;
			stmt = (Statement) con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from gallery "
					+ "Inner join product on gallery.product_id = product.id "
					+ "Inner join brand on product.brand_id = brand.id "
					+ "Inner join style on product.style_id = style.id "
					+ "Inner join user on product.user_id = user.id "
					+ "Inner join gender on product.gender_id = gender.id "
					+ "Inner join role on role.id = user.role_id "
					+ "Order by gallery.id");
			while (rs.next()) {
				gallery = new Gallery();
				product = new Product();
				brand = new Brand();
				user = new User();
				role = new Role();
				style = new Style();
				gender = new Gender();
				
				gender.setId(rs.getInt("gender_id"));
				gender.setGender_name(rs.getString("gender_name"));
				gender.setDescription(rs.getString("description"));
				
				role.setId(rs.getInt("role_id"));
				role.setRole_name(rs.getString("role_name"));
				role.setDescription(rs.getString("description"));
				role.setCreated_at(rs.getDate("created_at"));
				role.setUpdated_at(rs.getDate("updated_at"));
				
				brand.setId(rs.getInt("brand_id"));
				brand.setBrand_name(rs.getString("brand_name"));
				
				user.setId(rs.getInt("user_id"));
				user.setFullname(rs.getString("fullname"));
				user.setEmail(rs.getString("email"));
				user.setPhone_number(rs.getString("phone_number"));
				user.setAddress(rs.getString("address"));
				user.setPassword(rs.getString("password"));
				user.setAvatar(rs.getString("avatar"));
				user.setRole(role);
				
				style.setId(rs.getInt("style_id"));
				style.setStyle_name(rs.getString("style_name"));
				
				product.setId(rs.getInt("product_id"));
				product.setTitle(rs.getString("title"));
				product.setPrice(rs.getDouble("price"));
				product.setDiscount(rs.getInt("discount"));
				product.setStyle(style);
				product.setThumbnail(rs.getString("thumbnail"));
				product.setDescription(rs.getString("description"));
				product.setBrand(brand);
				product.setUser(user);
				product.setCreated_at(rs.getDate("created_at"));
				product.setUpdated_at(rs.getDate("updated_at"));
				product.setPublished_at(rs.getDate("published_at"));
				product.setSold(rs.getInt("sold"));
				product.setMost_loved(rs.getInt("most_loved"));
				product.setGender(gender);
				
				gallery.setId(rs.getInt("id"));
				gallery.setThumbnail(rs.getString("thumbnail"));
				gallery.setProduct(product);
				li.add(gallery);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return li;
	}
	
	public List<Gallery> getAllGalleryByProductId(int prod_id) {
		List<Gallery> li = new ArrayList<>();
		for (Gallery g : getAllGallery()) {
			if(g.getProduct().getId() == prod_id) {
				li.add(g);
			}
		}
		return li;
	}
	
	public boolean checkGallary(String thumbnail, int product_id, int color_id) {
		
		for (Gallery i : getAllGallery()) {
			if (i.getThumbnail().equals(thumbnail) && i.getProduct().getId() == product_id) {
				return true;
			}
		}
		return false;
	}
	

	public boolean insertIntoGallery(String thumbnail, int product_id, int color_id) {
		try {
			connectService = new ConnectService();
			Connection conn = connectService.getConnect();

			if (checkGallary(thumbnail, product_id, color_id)) {

			} else {
				String sql = "INSERT INTO `gallery`(`thumbnail`, `product_id`, `color_id`) " + "VALUES (?, ?, ?)";
				PreparedStatement preparedStmt = (PreparedStatement) conn.prepareStatement(sql);
				preparedStmt.setString(1, thumbnail);
				preparedStmt.setInt(2, product_id);
				preparedStmt.setInt(3, color_id);

				preparedStmt.execute();
			}
			conn.close();
			return true;
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

}
