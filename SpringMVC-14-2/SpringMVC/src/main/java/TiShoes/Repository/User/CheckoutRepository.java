package TiShoes.Repository.User;

import java.util.HashMap;
import java.util.List;

import TiShoes.Model.Color;
import TiShoes.Model.Color_size;
import TiShoes.Model.Product;
import TiShoes.Model.Sizes;

public interface CheckoutRepository {
	public List<Color> getRgbById_prod(int id_prod);
	public List<Color_size> getSizeId_prod(int prod_id, int color_id);
	public int firstColor(int prod_id);
	public List<Product> getListProductByString(String txt);
	public HashMap<Integer, Color> getListColorByString(String txt);
	public HashMap<Integer, Sizes> getListSizeByString(String txt);
	public HashMap<Integer, Integer> getListAmountByString(String txt);
	public Double getTotalPaymentByString(String txt);
	//public boolean checkout_buynow(int id_prod, int amount);
}
