package TiShoes.Service.Admin;

import java.util.List;

import TiShoes.Model.Brand;
import TiShoes.Model.Gender;
import TiShoes.Model.Style;
import TiShoes.Repository.Admin.aBSGRepository;
import TiShoes.Service.User.BrandService;
import TiShoes.Service.User.GenderService;
import TiShoes.Service.User.StyleService;

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
