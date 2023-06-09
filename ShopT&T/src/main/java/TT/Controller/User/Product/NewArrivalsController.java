package TT.Controller.User.Product;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import TT.Model.Product;
import TT.Service.User.ColorService;
import TT.Service.User.PostsService;
import TT.Service.User.SizeService;
import TT.Service.User.SubCategoryService;
import TT.Service.User.Product.NewArrivalsService;
import TT.Service.User.Product.ProductService;
import TT.Service.User.Product.ShoesService;

@Controller
public class NewArrivalsController {
	private ShoesService shoesService;
	private SubCategoryService subCategoryService;
	private SizeService sizeService;
	private ColorService colorService;
	private NewArrivalsService arrivalsService;
	private PostsService postsService;
	private ProductService productService;

	@RequestMapping(value = { "products/new-arrivals" })
	public ModelAndView clothing(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("user/re-products");

		shoesService = new ShoesService();
		subCategoryService = new SubCategoryService();
		sizeService = new SizeService();
		colorService = new ColorService();
		arrivalsService = new NewArrivalsService();
		postsService = new PostsService();
		productService = new ProductService();

		HashMap<String, String> hm = new HashMap<>();
		List<String> li = null;
		String txt = "";

		String addtocart = request.getParameter("add-to-cart");
		String price = String.valueOf(request.getParameter("price"));
		String stylename = String.valueOf(request.getParameter("stylename"));
		String sortby = String.valueOf(request.getParameter("sortby"));
		String size = String.valueOf(request.getParameter("size"));
		String rate = String.valueOf(request.getParameter("rate"));
		String color = String.valueOf(request.getParameter("color"));
		String gender = String.valueOf(request.getParameter("gender"));
		String search = request.getParameter("search");

		Cookie arr[] = request.getCookies();
		if (arr != null) {
			li = new ArrayList<>();
			for (Cookie o : arr) {
				li.add(o.getName());
			}
		}
		if (arr != null) {
			for (Cookie o : arr) {
				if (o.getName().equals("addtocart")) {
					if (addtocart != null) {
						txt = o.getValue() + "/" + addtocart;
						o.setValue(txt);
						o.setMaxAge(60 * 60 * 24);
						response.addCookie(o);
						return new ModelAndView("redirect:/cart");
					}
				} else if (!li.contains("addtocart")) {
					if (addtocart != null) {
						Cookie cart = new Cookie("addtocart", addtocart);
						cart.setMaxAge(60 * 60 * 24);
						response.addCookie(cart);
						return new ModelAndView("redirect:/cart");
					}
				}
			}
		}
		// keep value when selectif(!size.equals("null")) {
		if (!sortby.equals("null")) {
			mv.addObject("selectedSortBy", sortby);
			hm.put("sortby", sortby);
			System.out.println(sortby);
		}
		if (!price.equals("null")) {
			mv.addObject("checkedPrice", price);
			hm.put("price", price);
		}
		if (!stylename.equals("null")) {
			mv.addObject("checkedStyleName", stylename);
			hm.put("stylename", stylename);
		}
		if (!rate.equals("null")) {
			mv.addObject("checkedRate", rate);
			hm.put("rate", rate);
		}
		if (!gender.equals("null")) {
			mv.addObject("checkedGender", gender);
			hm.put("gender", gender);
		}
		if (!size.equals("null")) {
			mv.addObject("checkedSize", shoesService.getSizeCheckedByString(size));
			hm.put("size", size);
		}
		if (!color.equals("null")) {
			mv.addObject("checkedColor", shoesService.getColorCheckedByString(color));
			hm.put("color", color);
		}
		if (search != null) {
			if (shoesService.get_all_product_by_search_keywords(search).size() > 0) {
				HashMap<Integer, List<Product>> hmP = productService
						.get_product_page(shoesService.get_all_product_by_search_keywords(search));
				mv.addObject("listhmp", hmP);
			} else {
				mv.addObject("keyword", search);
			}
		} else {
			if (color.equals("null") && size.equals("null") && gender.equals("null") && sortby.equals("null")
					&& price.equals("null") && stylename.equals("null") && rate.equals("null")) {
				if (arrivalsService.getNewArrivals().size() == 0) {
				} else {
					if (arrivalsService.getNewArrivals().size() > 0) {
						HashMap<Integer, List<Product>> hmP = productService
								.get_product_page(arrivalsService.getNewArrivals());
						mv.addObject("listhmp", hmP);
					}
				}
			} else {
				if (!shoesService.getAllProductsColorSize(hm).isEmpty()) {
					if (shoesService.getAllProductsColorSize(hm).size() == 0) {
					} else {
						List<Product> liproducts = shoesService.getAllProductsColorSize(hm);
						HashMap<Integer, List<Product>> hmP = productService
								.get_product_page(liproducts);
						mv.addObject("listhmp", hmP);
					}
				}
			}
		}
		HttpSession session = request.getSession();
		ProductService productService = new ProductService();
		if (session.getAttribute("favorite") != null) {
			String txt1 = String.valueOf(session.getAttribute("favorite"));
			System.out.println("a" + txt1);
			mv.addObject("listProduct", productService.get_product_by_str(txt1));
		}
		mv.addObject("color", colorService.getAllColor());
		mv.addObject("listSize", sizeService.getAllSize());
		mv.addObject("style", subCategoryService.getAllSubCategory());
		mv.addObject("title", "CLOTHING");

		mv.addObject("hmPosts", postsService.listPost());
		return mv;
	}
}
