package TT.Service.Admin;

import java.util.List;

import TT.Model.Brand;
import TT.Model.Gender;
import TT.Model.Style;
import TT.Repository.Admin.aBSGRepository;
import TT.Service.User.BrandService;
import TT.Service.User.GenderService;
import TT.Service.User.StyleService;

public class aBSGService implements aBSGRepository{

	private StyleService styleService;
	private BrandService brandService;
	private GenderService genderService;
	
	
	@Override
	public List<Brand> getAllBrand() {
		brandService = new BrandService();
		return brandService.getAllBrand();
	}

	@Override
	public List<Style> getAllStyle() {
		styleService = new StyleService();
		return styleService.getAllStyle();
	}

	@Override
	public List<Gender> getAllGender() {
		genderService = new GenderService();
		return genderService.getAllGender();
	}

}
