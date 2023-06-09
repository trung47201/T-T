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
import TT.Model.Sub_category;
import TT.Model.User;
import TT.Repository.Admin.aProduct_color_sizeRepository;
import TT.Service.User.ColorService;
import TT.Service.User.ConnectService;
import TT.Service.User.SizeService;

public class aProd_Color_SizeService implements aProduct_color_sizeRepository {

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
	private Sub_category sub_category;
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
					.executeQuery("select * from product_color_size " + "Inner join product on product_color_size.prod_id = product.id "
							+ "Inner join brand on product.brand_id = brand.id "
							+ "Inner join sub_category on product.sub_category_id = sub_category.id "
							+ "Inner join user on product.user_id = user.id "
							+ "Inner join gender on product.gender_id = gender.id "
							+ "Inner join role on role.id = user.role_id "
							+ "Inner join sizes on sizes.id = product_color_size.size_id "
							+ "Inner join color on color.id = product_color_size.color_id "
							+ "order by product_color_size.id asc");
			while (rs.next()) {
				product = new Product();
				brand = new Brand();
				user = new User();
				role = new Role();
				product_color_size = new Product_color_size();
				color = new Color();
				size = new Sizes();
				sub_category = new Sub_category();
				gender = new Gender();

				gender.setId(rs.getInt("gender_id"));
				gender.setGender_name(rs.getString("gender_name"));
				gender.setDescription(rs.getString("description"));

				size.setId(rs.getInt("size_id"));
				size.setSize_number(rs.getString("size_number"));
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

				product.setId(rs.getInt("prod_id"));
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
