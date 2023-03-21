package TT.Repository.Admin;


import java.util.List;

import TT.Model.Brand;
import TT.Model.Gender;
import TT.Model.Style;

public interface aBSGRepository {
	public List<Brand> getAllBrand();
	public List<Style> getAllStyle();
	public List<Gender> getAllGender();
}
