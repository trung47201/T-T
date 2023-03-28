package TT.Service.Admin;

import java.util.List;

import TT.Model.Brand;
import TT.Model.Gender;
import TT.Model.Sub_category;
import TT.Repository.Admin.aBSGRepository;
import TT.Service.User.BrandService;
import TT.Service.User.GenderService;
import TT.Service.User.SubCategoryService;

public class aBSGService implements aBSGRepository{

	private SubCategoryService subCategoryService;
	private BrandService brandService;
	private GenderService genderService;
	
	
	@Override
	public List<Brand> getAllBrand() {
		brandService = new BrandService();
		return brandService.getAllBrand();
	}

	@Override
	public List<Sub_category> getAllSubCategory() {
		subCategoryService = new SubCategoryService();
		return subCategoryService.getAllSubCategory();
	}

	@Override
	public List<Gender> getAllGender() {
		genderService = new GenderService();
		return genderService.getAllGender();
	}

}
