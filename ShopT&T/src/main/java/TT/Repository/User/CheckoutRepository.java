package TT.Repository.User;

import java.util.HashMap;
import java.util.List;

import TT.Model.Color;
import TT.Model.Product_color_size;
import TT.Model.Product;
import TT.Model.Sizes;

public interface CheckoutRepository {
	public List<Color> getRgbById_prod(int id_prod);
	public List<Product_color_size> getSizeId_prod(int prod_id, int color_id);
	public int firstColor(int prod_id);
	public List<Product> getListProductByString(String txt);
	public HashMap<Integer, Color> getListColorByString(String txt);
	public HashMap<Integer, Sizes> getListSizeByString(String txt);
	public HashMap<Integer, Integer> getListAmountByString(String txt);
	public Double getTotalPaymentByString(String txt);
	//public boolean checkout_buynow(int id_prod, int amount);
}
