package TT.Controller.Admin;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import TT.Model.Brand;
import TT.Model.Gender;
import TT.Model.Sub_category;
import TT.Service.Admin.aBSGService;
import TT.Service.User.BrandService;
import TT.Service.User.GenderService;
import TT.Service.User.SubCategoryService;

@Controller
public class aBSGController {
	private aBSGService aBSGService;
	private BrandService brandService;
	private SubCategoryService styleService;
	private GenderService genderService;

	@RequestMapping(value = { "/admin/brand-style-gender" })
	public ModelAndView loadBSG(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("admin/product");

		aBSGService = new aBSGService();

		List<Brand> brand = aBSGService.getAllBrand();
		Collections.sort(brand, new Comparator<Brand>() {
			@Override
			public int compare(Brand o1, Brand o2) {
				return o2.getId() - o1.getId();
			}
		});

		List<Sub_category> subcategory = aBSGService.getAllSubCategory();
		Collections.sort(subcategory, new Comparator<Sub_category>() {
			@Override
			public int compare(Sub_category o1, Sub_category o2) {
				return o2.getId() - o1.getId();
			}
		});
		List<Gender> gender = aBSGService.getAllGender();
		Collections.sort(gender, new Comparator<Gender>() {
			@Override
			public int compare(Gender o1, Gender o2) {
				return o2.getId() - o1.getId();
			}
		});

		mv.addObject("listBrand", brand);
		mv.addObject("listStyle", subcategory);
		mv.addObject("listGender", gender);

		mv.addObject("newProduct", "false");
		mv.addObject("product", "false");
		mv.addObject("colorSize", "false");
		mv.addObject("gallery", "false");
		mv.addObject("bsg", "true");
		return mv;
	}

	@RequestMapping(value = { "/admin/brand-style-gender/add-brand" })
	public ModelAndView add_brand(HttpServletRequest request, HttpServletResponse response) {
		brandService = new BrandService();

		String name = request.getParameter("brand");
		if (name != null) {
			if (brandService.insert(name)) {
				System.out.println("add brand success!");
				return new ModelAndView("redirect: /ShopTandT/admin/brand-style-gender");
			}
			return new ModelAndView("redirect: /ShopTandT/admin/brand-style-gender");
		}
		return null;
	}

	@RequestMapping(value = { "/admin/brand-style-gender/add-style" })
	public ModelAndView add_style(HttpServletRequest request, HttpServletResponse response) {
		styleService = new SubCategoryService();
		String id = request.getParameter("categoryid");
		String name = request.getParameter("style");
		if (name != null) {
			if (styleService.insert(name, Integer.parseInt(id))) {
				System.out.println("add style success!");
				return new ModelAndView("redirect: /ShopTandT/admin/brand-style-gender");
			}
			return new ModelAndView("redirect: /ShopTandT/admin/brand-style-gender");
		}
		return null;
	}

	@RequestMapping(value = { "/admin/brand-style-gender/add-gender" })
	public ModelAndView add_gender(HttpServletRequest request, HttpServletResponse response) {
		genderService = new GenderService();

		String name = request.getParameter("gender");
		if (name != null) {
			if (genderService.insert(name)) {
				System.out.println("add gender success!");
				return new ModelAndView("redirect: /ShopTandT/admin/brand-style-gender");
			}
			return new ModelAndView("redirect: /ShopTandT/admin/brand-style-gender");
		}
		return null;
	}
}
