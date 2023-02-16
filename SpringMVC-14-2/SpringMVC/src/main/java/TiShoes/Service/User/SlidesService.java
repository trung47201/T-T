package TiShoes.Service.User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Statement;
import TiShoes.Model.Slides;
import TiShoes.Repository.User.SlidesRepository;


public class SlidesService implements SlidesRepository{

	private Slides slides;
	private ConnectService connectService;
	
	@Override
	public List<Slides> getAllSlides() {
		List<Slides> li= null;
		try {
			connectService = new ConnectService();
			li = new ArrayList<>();
			Connection con = connectService.getConnect();
			Statement stmt;
			stmt = (Statement) con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from slides");
			while (rs.next()) {
				slides = new Slides();
				slides.setId(rs.getInt(1));
				slides.setImg(rs.getString(2));
				slides.setContent(rs.getString(3));
				li.add(slides);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return li;
	}
}
