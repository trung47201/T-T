package TT.Service.User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import TT.Model.Brand;
import TT.Model.Color;
import TT.Model.Gallery;
import TT.Model.Gender;
import TT.Model.Product;
import TT.Model.Role;
import TT.Model.Sub_category;
import TT.Model.User;
import TT.Repository.User.GalleryRepository;

public class GalleryService implements GalleryRepository {
	private ConnectService connectService;
	private Gallery gallery;
	private Brand brand;
	private User user;
	private Role role;
	private Product product;
	private Sub_category sub_category;
	private Gender gender;
	private Color color;
	
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
					+ "Inner join color on gallery.color_id = color.id "
					+ "Inner join brand on product.brand_id = brand.id "
					+ "Inner join sub_category on product.sub_category_id = sub_category.id "
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
				sub_category = new Sub_category();
				gender = new Gender();
				color = new Color();
				
				color.setId(rs.getInt("color_id"));
				color.setColor_name(rs.getString("color_name"));
				color.setRgb(rs.getString("rgb"));
				
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
				user.setFirstname(rs.getString("firstname"));user.setLastname(rs.getString("lastname"));
				user.setEmail(rs.getString("email"));
				user.setPhone_number(rs.getString("phone_number"));
				user.setAddress(rs.getString("address"));
				user.setDistrict(rs.getString("district"));
				user.setCity(rs.getString("city"));
				user.setPassword(rs.getString("password"));
				user.setAvatar(rs.getString("avatar"));
				user.setRole(role);
				
				sub_category.setId(rs.getInt("sub_category_id"));
				sub_category.setSub_category_name(rs.getString("sub_category_name"));
				
				product.setId(rs.getInt("product_id"));
				product.setTitle(rs.getString("title"));
				product.setPrice(rs.getDouble("price"));
				product.setDiscount(rs.getInt("discount"));
				product.setSub_category(sub_category);
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
				gallery.setColor(color);
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
