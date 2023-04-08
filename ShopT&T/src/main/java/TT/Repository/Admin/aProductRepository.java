package TT.Repository.Admin;

public interface aProductRepository {
	public boolean insert(String title, double price, int discount, String description, int style, String thumbnail,
			int brand, int user, int gender);

	public boolean update(int id, String title, double price, int discount, String description, int style,
			String thumbnail, int brand, int gender);

	public boolean delete(int id_prod);
}
