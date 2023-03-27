package TT.Controller.User.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import TT.Service.User.ColorService;
import TT.Service.User.PostsService;
import TT.Service.User.SizeService;
import TT.Service.User.StyleService;
import TT.Service.User.UserService;
import TT.Service.User.Product.ClothingService;
import TT.Service.User.Product.GiftsService;
import TT.Service.User.Product.ProductService;

@Controller
public class GiftsController {
	private UserService userService;
	private ProductService productService;
	private StyleService styleService;
	private SizeService sizeService;
	private ColorService colorService;
	private GiftsService giftsService;
	private PostsService postsService;

	@RequestMapping(value = { "products/gifts" })
	public ModelAndView clothing(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("user/re-products");

		productService = new ProductService();
		styleService = new StyleService();
		sizeService = new SizeService();
		colorService = new ColorService();
		giftsService = new GiftsService();
		postsService = new PostsService();
		
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
			mv.addObject("checkedSize", productService.getSizeCheckedByString(size));
			hm.put("size", size);
		}
		if (!color.equals("null")) {
			mv.addObject("checkedColor", productService.getColorCheckedByString(color));
			hm.put("color", color);
		}

		if (search != null) {
			if (productService.get_all_product_by_search_keywords(search).size() > 0) {
				mv.addObject("listProducts", productService.get_all_product_by_search_keywords(search));
			} else {
				mv.addObject("listProductsEmpty", "");
				mv.addObject("keyword", search);
			}

		} else {
			if (color.equals("null") && size.equals("null") && gender.equals("null") && sortby.equals("null")
					&& price.equals("null") && stylename.equals("null") && rate.equals("null")) {
				if (productService.getAllProducts().size() == 0) {
					mv.addObject("listProducts", "");
				} else {
					if (giftsService.getAllProductsGifts().size() > 0) {
						mv.addObject("listProducts", giftsService.getAllProductsGifts());
					}
				}
			} else {
				if (!productService.getAllProductsColorSize(hm).isEmpty()) {
					if (productService.getAllProductsColorSize(hm).size() == 0) {
						mv.addObject("listProducts", "");
					} else {
						mv.addObject("listProducts", productService.getAllProductsColorSize(hm));
					}
				}
			}

		}
		mv.addObject("color", colorService.getAllColor());
		mv.addObject("listSize", sizeService.getAllSize());
		mv.addObject("style", styleService.getAllStyle());
		mv.addObject("title", "CLOTHING");

		mv.addObject("hmPosts", postsService.listPost());
		return mv;
	}
}
