package TT.Repository.Admin;

import java.util.List;

import TT.Model.Color;
import TT.Model.Product_color_size;
import TT.Model.Sizes;

public interface aProd_ColorC_SizeRepository {
	public List<Product_color_size> getAllPCS();
	public List<Color> getAllColor();
	public List<Sizes> getAllSize();
}
