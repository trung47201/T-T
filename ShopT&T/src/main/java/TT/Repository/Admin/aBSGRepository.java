package TT.Repository.Admin;


import java.util.List;

import TT.Model.Brand;
import TT.Model.Gender;
import TT.Model.Sub_category;

public interface aBSGRepository {
	public List<Brand> getAllBrand();
	public List<Sub_category> getAllSubCategory();
	public List<Gender> getAllGender();
}
