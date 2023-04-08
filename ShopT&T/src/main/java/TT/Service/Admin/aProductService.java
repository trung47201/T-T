package TT.Service.Admin;

import java.sql.Connection;
import java.util.List;

import com.mysql.jdbc.PreparedStatement;

import TT.Model.Product;
import TT.Repository.Admin.aProductRepository;
import TT.Service.User.Product_color_sizeService;
import TT.Service.User.SubCategoryService;
import TT.Service.User.ConnectService;
import TT.Service.User.GalleryService;
import TT.Service.User.Product.ShoesService;

public class aProductService implements aProductRepository {
	private ConnectService connectService;
	private SubCategoryService subCategoryService;
	@Override
	public boolean insert(String title, double price, int discount, String description, int style, String thumbnail,
			int brand, int user, int gender) {
		try {
			java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
			connectService = new ConnectService();
			Connection conn = connectService.getConnect();
			subCategoryService = new SubCategoryService();
			String sql = "INSERT INTO `product`(`title`, `price`, `discount`, `description`, `sub_category_id`, `thumbnail`, `brand_id`, `user_id`, `gender_id`, `created_at`,  `updated_at`, `published_at`, `sold`, `most_loved`, `category_id`) "
					+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
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
			preparedStmt.setInt(15, subCategoryService.get_category_id_by_sub_category_id(style));
			preparedStmt.execute();
			conn.close();
			return true;
		} catch (Exception e) {
			System.err.println("Got an exception (45) aProductService!!");
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
			Connection conn = connectService.getConnect();
			if (thumbnail.equals("")) {
				String sql = "UPDATE `product` SET `title`= ?, `price`= ?, `discount`= ?, `style_id`= ?, `description`= ?,`brand_id`= ?, `updated_at`= ?, `gender_id`= ? WHERE id = ?";
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
				String sql = "UPDATE `product` SET `title`= ?, `price`= ?, `discount`= ?, `style_id`= ?, `thumbnail`= ?, `description`= ?,`brand_id`= ?, `updated_at`= ?, `gender_id`= ? WHERE id = ?";
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
}
