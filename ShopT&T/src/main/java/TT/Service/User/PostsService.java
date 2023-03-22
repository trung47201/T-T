package TT.Service.User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Statement;

import TT.Model.Posts;

public class PostsService {
	private ConnectService connectService;
	private Posts posts;

	public List<Posts> getAllPosts() {
		List<Posts> li = null;
		try {
			connectService = new ConnectService();
			li = new ArrayList<>();
			Connection con = connectService.getConnect();
			Statement stmt;
			stmt = (Statement) con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from posts");
			while (rs.next()) {
				posts = new Posts();
				posts.setId(rs.getInt("id"));
				posts.setContent(rs.getString("content"));
				posts.setImg(rs.getString("img"));
				posts.setVideo(rs.getString("video"));
				posts.setUrl(rs.getString("url"));
				posts.setType(rs.getInt("type"));
				posts.setProd_id(0);
				li.add(posts);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return li;
	}

}
