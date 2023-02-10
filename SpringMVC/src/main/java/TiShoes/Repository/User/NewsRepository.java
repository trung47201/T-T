package TiShoes.Repository.User;

import java.util.List;

import TiShoes.Model.News;


public interface NewsRepository {
	public List<News> getAllNews();
	public List<News> getNewsHome();
}
