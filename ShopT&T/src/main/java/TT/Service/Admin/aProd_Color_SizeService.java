package TT.Service.Admin;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Statement;

import TT.Model.Brand;
import TT.Model.Color;
import TT.Model.Product_color_size;
import TT.Model.Gender;
import TT.Model.Product;
import TT.Model.Role;
import TT.Model.Sizes;
import TT.Model.Style;
import TT.Model.User;
import TT.Repository.Admin.aProd_ColorC_SizeRepository;
import TT.Service.User.ColorService;
import TT.Service.User.ConnectService;
import TT.Service.User.SizeService;

public class aProd_Color_SizeService implements aProd_ColorC_SizeRepository {

	private ColorService colorService;
	private SizeService sizeService;
	private ConnectService connectService;
	private Color color;
	private Product_color_size product_color_size;
	private Sizes size;
	private Brand brand;
	private User user;
	private Role role;
	private Product product;
	private Style style;
	private Gender gender;

	@Override
	public List<Product_color_size> getAllPCS() {
		List<Product_color_size> li = null;
		try {
			connectService = new ConnectService();
			li = new ArrayList<>();
			Connection con = connectService.getConnect();
			Statement stmt;
			stmt = (Statement) con.createStatement();
			ResultSet rs = stmt
					.executeQuery("select * from color_size " + "Inner join product on color_size.prod_id = product.id "
							+ "Inner join brand on product.brand_id = brand.id "
							+ "Inner join style on product.style_id = style.id "
							+ "Inner join user on product.user_id = user.id "
							+ "Inner join gender on product.gender_id = gender.id "
							+ "Inner join role on role.id = user.role_id "
							+ "Inner join sizes on sizes.id = color_size.size_id "
							+ "Inner join color on color.id = color_size.color_id "
							+ "order by color_size.id asc");
			while (rs.next()) {
				product = new Product();
				brand = new Brand();
				user = new User();
				role = new Role();
				product_color_size = new Product_color_size();
				color = new Color();
				size = new Sizes();
				style = new Style();
				gender = new Gender();

				gender.setId(rs.getInt("gender_id"));
				gender.setGender_name(rs.getString("gender_name"));
				gender.setDescription(rs.getString("description"));

				size.setId(rs.getInt("size_id"));
				size.setSize_number(rs.getInt("size_number"));
				size.setCreated_at(rs.getDate("created_at"));
				size.setUpdated_at(rs.getDate("updated_at"));

				color.setId(rs.getInt("color_id"));
				color.setColor_name(rs.getString("color_name"));
				color.setRgb(rs.getString("rgb"));

				role.setId(rs.getInt("role_id"));
				role.setRole_name(rs.getString("role_name"));

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

				product.setId(rs.getInt("prod_id"));
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

				product_color_size.setId(rs.getInt("id"));
				product_color_size.setSize(size);
				product_color_size.setColor(color);
				product_color_size.setProd(product);
				product_color_size.setQuantity(rs.getInt("quantity"));
				li.add(product_color_size);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return li;
	}

	@Override
	public List<Color> getAllColor() {
		colorService = new ColorService();
		return colorService.getAllColor();
	}

	@Override
	public List<Sizes> getAllSize() {
		sizeService = new SizeService();
		return sizeService.getAllSize();
	}
	

}
