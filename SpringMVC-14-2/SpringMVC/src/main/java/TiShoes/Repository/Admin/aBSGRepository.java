package TiShoes.Repository.Admin;


import java.util.List;

import TiShoes.Model.Brand;
import TiShoes.Model.Gender;
import TiShoes.Model.Style;

public interface aBSGRepository {
	public List<Brand> getAllBrand();
	public List<Style> getAllStyle();
	public List<Gender> getAllGender();
}
