package TiShoes.Service.User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Statement;

import TiShoes.Model.Color;
import TiShoes.Repository.User.ColorRepository;

public class ColorService implements ColorRepository{
	private ConnectService connectService;
	private Color color;
	
	@Override
	public List<Color> getAllColor() {
		List<Color> li= null;
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
		Color s = new Color();;
		for (Color color : li) {
			if (color.getId() == color_id) {
				s = color;
			}
		}
		return s;
	}
}
