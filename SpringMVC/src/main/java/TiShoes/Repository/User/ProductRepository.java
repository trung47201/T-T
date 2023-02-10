package TiShoes.Repository.User;

import java.util.HashMap;
import java.util.List;

import TiShoes.Model.Color_size;
import TiShoes.Model.Product;

public interface ProductRepository {
	public List<Color_size> getAllProductsColorSize();
	public List<Product> getAllProductsColorSize(HashMap<String, String> hms);
	public List<Product> getAllProducts();
	public List<Product> getNewArrivals();
	public List<Product> getMostLovedProducts();
	public Product getProduct(int id);
	public List<Integer> getSizeIdByString(String txt);
	public HashMap<Integer, String> getSizeCheckedByString(String txt);
	public HashMap<Integer, String> getColorCheckedByString(String txt);
	public List<Integer> getPrice (String txt);
	public List<Integer> getColor (String txt);
	public List<Integer> getSizes (String txt);
}
