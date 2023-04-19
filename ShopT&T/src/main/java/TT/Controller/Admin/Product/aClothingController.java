package TT.Controller.Admin.Product;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import TT.Model.Product;
import TT.Service.User.Product.ClothingService;

@Controller
public class aClothingController {
	private ClothingService clothingService;

	@RequestMapping(value = { "/admin/product/clothing" })
	public ModelAndView loadProduct(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("admin/product");

		clothingService = new ClothingService();

		List<Product> product = clothingService.getAllProductsClothing();
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
		mv.addObject("clothing", "true");
		mv.addObject("shoes", "false");
		return mv;
	}
}
