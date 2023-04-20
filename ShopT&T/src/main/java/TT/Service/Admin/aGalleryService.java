package TT.Service.Admin;

import java.sql.Connection;
import java.util.List;

import com.mysql.jdbc.PreparedStatement;

import TT.Model.Gallery;
import TT.Repository.Admin.aGalleryRepository;
import TT.Service.User.ConnectService;
import TT.Service.User.GalleryService;

public class aGalleryService implements aGalleryRepository {

	private GalleryService galleryService;
	private ConnectService connectService;

	@Override
	public List<Gallery> getAllGallery() {
		galleryService = new GalleryService();
		return galleryService.getAllGallery();
	}

	public boolean insert(int prodid, String thumbnail) {
		try {
			connectService = new ConnectService();
			Connection conn = connectService.getConnect();
			String sql = "INSERT INTO `gallery`(`thumbnail`, `product_id`) "
					+ "VALUES (?, ?)";
			PreparedStatement preparedStmt = (PreparedStatement) conn.prepareStatement(sql);
			preparedStmt.setString(1, thumbnail);
			preparedStmt.setInt(2, prodid);
			preparedStmt.execute();
			conn.close();
			return true;
		} catch (Exception e) {
			System.err.println("Got an exception!");
			e.printStackTrace();
			System.out.println(e);
		}
		return false;
	}

}
