package TT.Service.User.Product;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Statement;

import TT.Model.Brand;
import TT.Model.Color;
import TT.Model.Gender;
import TT.Model.Product;
import TT.Model.Product_color_size;
import TT.Model.Role;
import TT.Model.Sizes;
import TT.Model.Style;
import TT.Model.User;
import TT.Service.User.Product_color_sizeService;
import TT.Service.User.ConnectService;
import TT.Service.User.RatingService;
import TT.Service.User.VoucherService;

public class ClothingService {
	private ConnectService connectService;
	private RatingService ratingService;
	private Product_color_sizeService product_color_sizeService;
	private VoucherService voucherService;
	private Product product;
	private Brand brand;
	private User user;
	private Role role;
	private Style style;
	private Product_color_size product_color_size;
	private Color color;
	private Sizes size;
	private Gender gender;

	public List<Product> getAllProductsClothing() {
		List<Product> list = null;
		try {
			list = new ArrayList<>();
			connectService = new ConnectService();
			Connection con = connectService.getConnect();
			Statement stmt;
			stmt = (Statement) con.createStatement();
			ResultSet rs = stmt
					.executeQuery("select * from product " + "Inner join brand on product.brand_id = brand.id "
							+ "Inner join style on product.style_id = style.id "
							+ "Inner join category on product.category_id = category.id "
							+ "Inner join user on product.user_id = user.id "
							+ "Inner join gender on product.gender_id = gender.id "
							+ "Inner join role on role.id = user.role_id Where category.id = 1");
			while (rs.next()) {
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
				
				user.setId(rs.getInt("user_id"));
				user.setFirstname(rs.getString("firstname"));
				user.setLastname(rs.getString("lastname"));
				user.setEmail(rs.getString("email"));
				user.setPhone_number(rs.getString("phone_number"));
				user.setAddress(rs.getString("address"));
				user.setPassword(rs.getString("password"));
				user.setAvatar(rs.getString("avatar"));
				user.setRole(role);

				brand.setId(rs.getInt("brand_id"));
				brand.setBrand_name(rs.getString("brand_name"));

				style.setId(rs.getInt("style_id"));
				style.setStyle_name(rs.getString("style_name"));

				product.setId(rs.getInt("id"));
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

				list.add(product);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

}
