package TT.Service.Admin;

import java.sql.Connection;
import java.util.List;

import com.mysql.jdbc.PreparedStatement;

import TT.Model.Product;
import TT.Repository.Admin.aProductRepository;
import TT.Service.User.Product_color_sizeService;
import TT.Service.User.ConnectService;
import TT.Service.User.GalleryService;
import TT.Service.User.Product.ShoesService;

public class aProductService implements aProductRepository {
	private ConnectService connectService;
	private ShoesService shoesService;
	private Product_color_sizeService product_color_sizeService;
	private GalleryService galleryService;

	@Override
	public boolean insert(String title, double price, int discount, String description, int style, String thumbnail,
			int brand, int user, int gender, int color, String size_quantity) {
		try {
			java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
			connectService = new ConnectService();
			product_color_sizeService = new Product_color_sizeService();
			galleryService = new GalleryService();
			Connection conn = connectService.getConnect();
			if (checkProduct(title, price, discount, style, brand, gender, thumbnail, color)) {
				galleryService.insertIntoGallery(thumbnail, getProd_Id_finally(), color);
				product_color_sizeService.insertIntoColor_Size(size_quantity, color, getProd_Id_finally());
			} else {
				String sql = "INSERT INTO `product`(`title`, `price`, `discount`, `description`, `style_id`, `thumbnail`, `brand_id`, `user_id`, `gender_id`, `created_at`,  `updated_at`, `published_at`, `sold`, `most_loved`) "
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
				galleryService.insertIntoGallery(thumbnail, getProd_Id_finally(), color);
				product_color_sizeService.insertIntoColor_Size(size_quantity, color, getProd_Id_finally());
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
			System.err.println("Got an exception !");
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

	@Override
	public boolean checkProduct(String title, double price, int discount, int style, int brand, int gender,
			String thumbnail, int color) {
		shoesService = new ShoesService();
		product_color_sizeService = new Product_color_sizeService();
		galleryService = new GalleryService();
		List<Product> li = shoesService.getAllProducts();
		for (Product p : li) {
			if (p.getTitle().equals(title) && p.getSub_category().getId() == style && p.getPrice() == price
					&& p.getDiscount() == discount && p.getBrand().getId() == brand
					&& p.getGender().getId() == gender) {
				galleryService.insertIntoGallery(thumbnail, p.getId(), color);
				return true;
			}
		}
		return false;
	}

	@Override
	public int getProd_Id_finally() {
		shoesService = new ShoesService();
		List<Product> li = shoesService.getAllProducts();
		int indexfinally = (li.size() - 1);
		return li.get(indexfinally).getId();
	}

	public static void main(String[] args) {
		// aProductService a = new aProductService();
//		String title="Leather sandal"; 
//		double price= 850.00; 
//		int discount = 20; 
//		String description ="The Double G gold-toned hardware is set on the strap of these high-heel leather sandals."; 
//		int style = 13;
//		String thumbnail = "453378_A3N00_1000_002_071_0000_Light-Leather-sandal.avif";
//		int brand=2;
//		int user=1;
//		int gender=2;
//		int color=2;
//		String size_quantity="4_500/5_500/6_500/7_500/8_500/9_0/10_500/11_0/12_500/13_500/14_500/15_500";
//		a.insert(title, price, discount, description, style, thumbnail, brand, user, gender, color, size_quantity);
	}
}
