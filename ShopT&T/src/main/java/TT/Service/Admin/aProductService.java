package TT.Service.Admin;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import TT.Model.Brand;
import TT.Model.Gender;
import TT.Model.Product;
import TT.Model.Role;
import TT.Model.Sub_category;
import TT.Model.User;
import TT.Repository.Admin.aProductRepository;
import TT.Service.User.SubCategoryService;
import TT.Service.User.ConnectService;

public class aProductService implements aProductRepository {
	private ConnectService connectService;
	private SubCategoryService subCategoryService;
	private Product product;
	private Brand brand;
	private User user;
	private Role role;
	private Sub_category sub_category;
	private Gender gender;

	@Override
	public boolean insert(String title, double price, int discount, String description, int style, String thumbnail,
			int brand, int user, int gender) {
		try {
			java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
			connectService = new ConnectService();
			Connection conn = connectService.getConnect();
			subCategoryService = new SubCategoryService();
			String sql = "INSERT INTO `product`(`title`, `price`, `discount`, `description`, `sub_category_id`, `thumbnail`, `brand_id`, `user_id`, `gender_id`, `created_at`,  `updated_at`, `published_at`, `sold`, `most_loved`) "
					+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement preparedStmt = (PreparedStatement) conn.prepareStatement(sql);
			preparedStmt.setString(1, title);
			preparedStmt.setDouble(2, price);
			preparedStmt.setInt(3, discount);
			preparedStmt.setString(4, description);
			preparedStmt.setInt(5, style);
			preparedStmt.setString(6, thumbnail);
			preparedStmt.setInt(7, brand);
			preparedStmt.setInt(8, user);
			preparedStmt.setInt(9, gender);
			preparedStmt.setTimestamp(10, date);
			preparedStmt.setTimestamp(11, date);
			preparedStmt.setTimestamp(12, date);
			preparedStmt.setInt(13, 0);
			preparedStmt.setInt(14, 0);
			preparedStmt.execute();
			conn.close();
			return true;
		} catch (Exception e) {
			System.err.println("Got an exception (62) aProductService!!");
			// printStackTrace method
			// prints line numbers + call stack
			e.printStackTrace();
			// Prints what exception has been thrown
			System.out.println(e);
		}
		return false;
	}

	@Override
	public boolean update(int id, String title, double price, int discount, String description, int style,
			String thumbnail, int brand, int gender) {
		try {
			java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
			connectService = new ConnectService();
			subCategoryService = new SubCategoryService();
			Connection conn = connectService.getConnect();
			if (thumbnail.equals("")) {
				String sql = "UPDATE `product` SET `title`= ?, `price`= ?, `discount`= ?, `sub_category_id`= ?, `description`= ?,`brand_id`= ?, `updated_at`= ?, `gender_id`= ? WHERE id = ?";
				PreparedStatement preparedStmt = (PreparedStatement) conn.prepareStatement(sql);
				preparedStmt.setString(1, title);
				preparedStmt.setDouble(2, price);
				preparedStmt.setInt(3, discount);
				preparedStmt.setInt(4, style);
				preparedStmt.setString(5, description);
				preparedStmt.setInt(6, brand);
				preparedStmt.setTimestamp(7, date);
				preparedStmt.setInt(8, gender);
				preparedStmt.setInt(9, id);
				preparedStmt.execute();
				conn.close();
				return true;
			} else {
				String sql = "UPDATE `product` SET `title`= ?, `price`= ?, `discount`= ?, `sub_category_id`= ?, `thumbnail`= ?, `description`= ?,`brand_id`= ?, `updated_at`= ?, `gender_id`= ? WHERE id = ?";
				PreparedStatement preparedStmt = (PreparedStatement) conn.prepareStatement(sql);
				preparedStmt.setString(1, title);
				preparedStmt.setDouble(2, price);
				preparedStmt.setInt(3, discount);
				preparedStmt.setInt(4, style);
				preparedStmt.setString(5, thumbnail);
				preparedStmt.setString(6, description);
				preparedStmt.setInt(7, brand);
				preparedStmt.setTimestamp(8, date);
				preparedStmt.setInt(9, gender);
				preparedStmt.setInt(10, id);
				preparedStmt.execute();
				conn.close();
				return true;
			}
		} catch (Exception e) {
			System.err.println("Got an exception (95) aProductService!");
			e.printStackTrace();
			System.out.println(e);
		}
		return false;
	}

	@Override
	public boolean delete(int id_prod) {
		// TODO Auto-generated method stub
		return false;
	}

	public List<Product> getAllProductsShoes() {
		List<Product> list = null;
		try {
			list = new ArrayList<>();
			connectService = new ConnectService();
			Connection con = connectService.getConnect();
			Statement stmt;
			stmt = (Statement) con.createStatement();
			ResultSet rs = stmt
					.executeQuery("select * from product " + "Inner join brand on product.brand_id = brand.id "
							+ "Inner join sub_category on product.sub_category_id = sub_category.id "
							+ "Inner join category on sub_category.category_id = category.id "
							+ "Inner join user on product.user_id = user.id "
							+ "Inner join gender on product.gender_id = gender.id "
							+ "Inner join role on role.id = user.role_id Where category.id = 4");
			while (rs.next()) {
				product = new Product();
				brand = new Brand();
				user = new User();
				role = new Role();
				sub_category = new Sub_category();
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

				sub_category.setId(rs.getInt("sub_category_id"));
				sub_category.setSub_category_name(rs.getString("sub_category_name"));

				product.setId(rs.getInt("id"));
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

				list.add(product);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
