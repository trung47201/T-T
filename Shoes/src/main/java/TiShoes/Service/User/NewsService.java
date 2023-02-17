package TiShoes.Service.User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import com.mysql.jdbc.Statement;

import TiShoes.Model.News;
import TiShoes.Repository.User.NewsRepository;

public class NewsService implements NewsRepository {
	private News news;
	private ConnectService connectService;

	@Override
	public List<News> getAllNews() {
		List<News> li = null;
		try {
			connectService = new ConnectService();
			li = new ArrayList<>();
			Connection con = connectService.getConnect();
			Statement stmt;
			stmt = (Statement) con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from news");
			while (rs.next()) {
				news = new News();
				news.setId(rs.getInt("id"));
				news.setTitle(rs.getString("title"));
				news.setPost_date(rs.getDate("post_date"));
				news.setBy_name(rs.getString("by_name"));
				news.setContent(rs.getString("content"));
				news.setImage(rs.getString("image"));
				li.add(news);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return li;
	}

	public List<News> listNewsHomeLeft = new ArrayList<>();

	@Override
	public List<News> getNewsHome() {
		NewsService n = new NewsService();
		List<News> li = n.getAllNews();
		List<News> listNewsHome = new ArrayList<>();
		Collections.sort(li, new Comparator<News>() {
			@Override
			public int compare(News o1, News o2) {
				return o2.getPost_date().compareTo(o1.getPost_date());
			}
		});
		int count = 0;
		for (News news : li) {
			count++;
			if (count < 2) {
				listNewsHomeLeft.add(news);
				continue;
			} else if (count > 4) {
				break;
			} else {
				listNewsHome.add(news);
			}

		}
		return listNewsHome;
	}

	public static void main(String[] args) {
		NewsService n = new NewsService();
		List<News> li = n.getAllNews();
		for (News news : li) {
			System.out.println(news.getContent().substring(0, 150) + "...");
		}

	}

}
