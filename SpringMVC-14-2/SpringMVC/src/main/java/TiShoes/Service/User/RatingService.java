package TiShoes.Service.User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Statement;

import TiShoes.Model.Brand;
import TiShoes.Model.Gender;
import TiShoes.Model.Product;
import TiShoes.Model.Rating;
import TiShoes.Model.Role;
import TiShoes.Model.Style;
import TiShoes.Model.User;
import TiShoes.Repository.User.RatingRepository;

public class RatingService implements RatingRepository{
	private ConnectService connectService;
	private Rating rating;
	private Product product;
	private Brand brand;
	private User user;
	private Role role;
	private Style style;
	private Gender gender;

	@Override
	public List<Rating> getAllRating() {
		List<Rating> li= null;
		try {
			connectService = new ConnectService();
			li = new ArrayList<>();
			Connection con = connectService.getConnect();
			Statement stmt;
			stmt = (Statement) con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from rating "
					+ "Inner join product on product.id = rating.prod_id "
					+ "Inner join brand on product.brand_id = brand.id "
					+ "Inner join style on product.style_id = style.id "
					+ "Inner join user on product.user_id = user.id "
					+ "Inner join gender on product.gender_id = gender.id "
					+ "Inner join role on role.id = user.role_id "
					);
			while (rs.next()) {
				rating = new Rating();
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

				user.setId(rs.getInt("user_id"));
				user.setFullname(rs.getString("fullname"));
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
				
				rating.setId(rs.getInt("id"));
				rating.setRating_stars(rs.getInt("rating_stars"));
				rating.setRating_date(rs.getDate("rating_date"));
				rating.setRating_by(rs.getString("rating_by"));
				rating.setRating_content(rs.getString("rating_content"));
				rating.setRating_img(rs.getString("rating_img"));
				rating.setRating_video(rs.getString("rating_video"));
				rating.setProduct(product);
				
				li.add(rating);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return li;
	}
}
