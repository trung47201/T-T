package TT.Repository.User;

import java.util.HashMap;
import java.util.List;

import TT.Model.Product_color_size;
import TT.Model.Sizes;

public interface Color_sizeRepository {
	public List<Product_color_size> getAllColor_sizeById_prod(int prod_id, int color_id);
	public List<Product_color_size> getAllColorById_prod(int prod_id);
	public List<Product_color_size> getAllColor_Size();
	public int firstSizeId(int prod, int color);
	public HashMap<Integer, List<Sizes>> getHMColor_Size(int prod);
	public List<Sizes> listSize(int prod, int color);
	public List<Integer> getAllProd_id ();
	public HashMap<Integer, HashMap<Integer, List<Sizes>>> getCS ();
}
