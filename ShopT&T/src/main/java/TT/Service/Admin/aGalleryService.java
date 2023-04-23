package TT.Service.Admin;

import java.sql.Connection;
import java.util.LinkedList;
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
			String sql = "INSERT INTO `gallery`(`thumbnail`, `product_id`) " + "VALUES (?, ?)";
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

	public boolean update(int prodid, String thumbnail, int id) {
		try {
			connectService = new ConnectService();
			Connection conn = connectService.getConnect();
			String sql = "UPDATE `gallery` SET `thumbnail`= ?, `product_id`= ? WHERE `id` = ?";
			PreparedStatement preparedStmt = (PreparedStatement) conn.prepareStatement(sql);
			preparedStmt.setString(1, thumbnail);
			preparedStmt.setInt(2, prodid);
			preparedStmt.setInt(3, id);
			preparedStmt.execute();
			conn.close();
			return true;
		} catch (Exception e) {
			System.err.println("Got an exception!(gallery service 56)");
			e.printStackTrace();
			System.out.println(e);
		}
		return false;
	}

	public Gallery get_gallery_by_id(int id) {
		galleryService = new GalleryService();
		Gallery g = new Gallery();
		List<Gallery> li = galleryService.getAllGallery();
		for (Gallery gallery : li) {
			if (gallery.getId() == id) {
				g = gallery;
			}
		}
		return g;
	}
	
	public List<Gallery> get_all_gallery_by_prod_id(int id) {
		List<Gallery> rs = new LinkedList<>();
		List<Gallery> li = getAllGallery();
		for (Gallery g : li) {
			if (g.getProduct().getId() == id) {
				rs.add(g);
			}
		}
		return rs;
	}

}
