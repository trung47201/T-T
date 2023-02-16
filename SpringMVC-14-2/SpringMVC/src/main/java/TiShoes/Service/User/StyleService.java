package TiShoes.Service.User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Statement;

import TiShoes.Model.Style;
import TiShoes.Repository.User.StyleRepository;

public class StyleService implements StyleRepository {
	private ConnectService connectService;
	private Style style;
	
	@Override
	public List<Style> getAllStyle() {
		List<Style> li = null;
		try {
			connectService = new ConnectService();
			li = new ArrayList<>();
			Connection con = connectService.getConnect();
			Statement stmt;
			stmt = (Statement) con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from style");
			while (rs.next()) {
				style = new Style();
				style.setId(rs.getInt("id"));
				style.setStyle_name(rs.getString("style_name"));
				
				li.add(style);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return li;
	}
	
	
	public static void main(String[] args) {
		StyleService s = new  StyleService();
		List<Style> li = s.getAllStyle();
		for (Style style : li) {
			System.out.println(style.getId() + "===" + style.getStyle_name());
		}
	}
	
	
}
