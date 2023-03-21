package TT.Repository.User;

import java.util.List;

import TT.Model.News;


public interface NewsRepository {
	public List<News> getAllNews();
	public List<News> getNewsHome();
}
