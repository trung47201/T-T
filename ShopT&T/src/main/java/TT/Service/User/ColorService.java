package TT.Service.User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import TT.Model.Color;
import TT.Repository.User.ColorRepository;

public class ColorService implements ColorRepository {
	private ConnectService connectService;
	private Color color;

	@Override
	public List<Color> getAllColor() {
		List<Color> li = null;
		try {
			connectService = new ConnectService();
			li = new ArrayList<>();
			Connection con = connectService.getConnect();
			Statement stmt;
			stmt = (Statement) con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from color");
			while (rs.next()) {
				color = new Color();
				color.setId(rs.getInt("id"));
				color.setColor_name(rs.getString("color_name"));
				color.setRgb(rs.getString("rgb"));
				li.add(color);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return li;
	}

	@Override
	public Color getColorById(int color_id) {
		ColorService ss = new ColorService();
		List<Color> li = ss.getAllColor();
		Color s = new Color();
		;
		for (Color color : li) {
			if (color.getId() == color_id) {
				s = color;
			}
		}
		return s;
	}

	private MD5Service md5Service;

	public boolean insert(String name, String rgb) {
		try {
			md5Service = new MD5Service();
			if (!name.equals("")) {
				name = md5Service.decodeText(name);
			}
			connectService = new ConnectService();
			Connection conn = connectService.getConnect();
			String sql = "INSERT INTO `color`(`color_name`, `rgb`) " + "VALUES (?, ?)";
			PreparedStatement preparedStmt = (PreparedStatement) conn.prepareStatement(sql);
			preparedStmt.setString(1, name);
			preparedStmt.setString(2, rgb);
			preparedStmt.execute();
			conn.close();
			return true;
		} catch (Exception e) {
			System.out.println("got an exception (76) colorservice");
			e.printStackTrace();
		}
		return false;
	}

}
