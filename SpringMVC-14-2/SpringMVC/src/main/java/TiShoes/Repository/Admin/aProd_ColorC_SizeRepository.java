package TiShoes.Repository.Admin;

import java.util.List;

import TiShoes.Model.Color;
import TiShoes.Model.Color_size;
import TiShoes.Model.Sizes;

public interface aProd_ColorC_SizeRepository {
	public List<Color_size> getAllPCS();
	public List<Color> getAllColor();
	public List<Sizes> getAllSize();
}
