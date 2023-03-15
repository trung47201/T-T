package TiShoes.Repository.Admin;

public interface aProductRepository {
	public boolean insert(String title, double price, int discount, String description, int style, String thumbnail,
			int brand, int user, int gender, int color, String size_quantity);

	public boolean update(int id, String title, double price, int discount, String description, int style,
			String thumbnail, int brand, int gender);

	public boolean delete(int id_prod);

	public int getProd_Id_finally();

	public boolean checkProduct(String title, double price, int discount, int style, int brand, int gender,
			String thumbnail, int color);
}
