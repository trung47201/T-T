package TT.Controller.Admin.Product;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import TT.Model.Color;
import TT.Model.Product;
import TT.Model.Product_color_size;
import TT.Model.Sizes;
import TT.Service.Admin.aProd_Color_SizeService;
import TT.Service.Admin.aProductService;
import TT.Service.User.Product.ShoesService;

@Controller
public class aShoesController {

	private aProd_Color_SizeService aProd_Color_SizeService;
	private aProductService aProductService;

	@RequestMapping(value = { "/admin/product/shoes" })
	public ModelAndView loadProduct(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("admin/product");
		aProductService = new aProductService();

		List<Product> product = aProductService.getAllProductsShoes();
		Collections.sort(product, new Comparator<Product>() {
			@Override
			public int compare(Product o1, Product o2) {
				return o2.getId() - o1.getId();
			}
		});
		mv.addObject("listProduct", product);

		mv.addObject("newProduct", "false");
		mv.addObject("product", "true");
		mv.addObject("colorSize", "false");
		mv.addObject("gallery", "false");
		mv.addObject("bsg", "false");
		mv.addObject("shoes", "true");
		mv.addObject("clothing", "false");
		return mv;
	}

	@RequestMapping(value = { "/admin/color-size" })
	public ModelAndView loadColorSize(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("admin/product");

		aProd_Color_SizeService = new aProd_Color_SizeService();

		List<Product_color_size> listPCS = aProd_Color_SizeService.getAllPCS();
		List<Color> listColor = aProd_Color_SizeService.getAllColor();
		List<Sizes> listSize = aProd_Color_SizeService.getAllSize();

		Collections.sort(listPCS, new Comparator<Product_color_size>() {
			@Override
			public int compare(Product_color_size o1, Product_color_size o2) {
				return o2.getId() - o1.getId();
			}
		});
		Collections.sort(listColor, new Comparator<Color>() {
			@Override
			public int compare(Color o1, Color o2) {
				return o2.getId() - o1.getId();
			}
		});
		Collections.sort(listSize, new Comparator<Sizes>() {
			@Override
			public int compare(Sizes o1, Sizes o2) {
				return o2.getId() - o1.getId();
			}
		});
		mv.addObject("listPCS", listPCS);
		mv.addObject("listColor", listColor);
		mv.addObject("listSize", listSize);

		mv.addObject("newProduct", "false");
		mv.addObject("product", "false");
		mv.addObject("colorSize", "true");
		mv.addObject("gallery", "false");
		mv.addObject("bsg", "false");
		return mv;
	}
}
