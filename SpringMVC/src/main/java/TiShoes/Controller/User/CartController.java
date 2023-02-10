package TiShoes.Controller.User;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import TiShoes.Model.Product;
import TiShoes.Service.User.CartService;
import TiShoes.Service.User.ColorService;
import TiShoes.Service.User.Color_sizeService;
import TiShoes.Service.User.ProductService;

@Controller
public class CartController {
	private ProductService productService;
	private CartService cartService;
	private Color_sizeService color_sizeService;
	private ColorService colorService;

	@RequestMapping(value = { "cart" })
	public ModelAndView loadCart(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("user/cart");

		color_sizeService = new Color_sizeService();
		productService = new ProductService();
		colorService = new ColorService();
		cartService = new CartService();

		String plus = String.valueOf(request.getParameter("plus"));
		String size = String.valueOf(request.getParameter("size"));
		String color = String.valueOf(request.getParameter("color"));
		String minus = String.valueOf(request.getParameter("minus"));
		String remove = String.valueOf(request.getParameter("remove"));
		String del_prod = String.valueOf(request.getParameter("deleleProduct"));
		String checkedAll = String.valueOf(request.getParameter("checkedAll"));
		String totalmoney = String.valueOf(request.getParameter("totalmoney"));
		System.out.println(del_prod);
		double totalPayment = 0;
		
		HashMap<Product, Integer> hm = new HashMap<>();
		HashMap<Integer, Integer> map_color = null;
		HashMap<String, Integer> map_size = null;
		
		List<String> li_color = null;
		List<String> li_color_split = null;
		
		Cookie color_prod[] = request.getCookies();
		Cookie size_prod[] = request.getCookies();
		Cookie cart[] = request.getCookies();
		Cookie o_color[] = request.getCookies();
		
		for (Cookie cookie : cart) {
			if (cookie.getName().equals("addtocart")) {
				HashMap<String, Integer> map = cartService.getListProdCard(cookie.getValue());
				for (String key : map.keySet()) {
					hm.put(productService.getProduct(Integer.parseInt(key)), map.get(key));
					if (checkedAll.equals("true")) {
						totalPayment += cartService.TotalProdCard(productService.getProduct(Integer.parseInt(key)),
								String.valueOf(map.get(key)));
						mv.addObject("checkedAll", "true");
					}
				}

			}
		}
		
		if (!totalmoney.equals("null")) {
			totalPayment = cartService.totalProd(totalmoney);
			mv.addObject("listProd_id", cartService.listProd_id(totalmoney));
		}

		for (Cookie cookie : cart) {
			if (cookie.getName().equals("addtocart")) {
				if (!plus.equals("null")) {
					String strs1 = cookie.getValue();
					String strs = plus;
					String list = cartService.PlusProdCard(strs, strs1);
					Cookie cart2 = new Cookie("addtocart", list);
					cart2.setMaxAge(60 * 60 * 24);
					response.addCookie(cart2);
				} else if (!minus.equals("null")) {
					String strs1 = cookie.getValue();
					String strs = minus;
					String list = cartService.MinusProdCard(strs, strs1);
					Cookie cart2 = new Cookie("addtocart", list);
					cart2.setMaxAge(60 * 60 * 24);
					response.addCookie(cart2);
				} else if (!remove.equals("null")) {
					String strs1 = cookie.getValue();
					String strs = remove;
					String list = cartService.DelProdCard(strs, strs1);
					Cookie cart2 = new Cookie("addtocart", list);
					cart2.setMaxAge(60 * 60 * 24);
					response.addCookie(cart2);
				} else if (!del_prod.equals("null")) {
					String strs1 = cookie.getValue();
					String strs = del_prod;
					String list = cartService.DelProdCard(strs, strs1);
					if (list.equals("")) {
						Cookie cart2 = new Cookie("addtocart", "1");
						cart2.setMaxAge(0);
						response.addCookie(cart2);
					} else {
						Cookie cart2 = new Cookie("addtocart", list);
						cart2.setMaxAge(60*60*24);
						response.addCookie(cart2);
					}
					
				}
			}
		}
		
		
		
		if (color_prod != null) {
			li_color = new ArrayList<>();
			for (Cookie o : color_prod) {
				li_color.add(o.getName());
			}
		}
		if (color_prod != null) {
			li_color_split = new ArrayList<>();
			for (Cookie o : color_prod) {
				if (o.getName().equals("prod_color")) {
					String a[] = o.getValue().split("/");
					for (int i=0; i<a.length; i++) {
						li_color_split.add(a[i]);
					}
				}
				
			}
		}
			
		if (color_prod != null) {
			for (Cookie o : color_prod) {
				if (o.getName().equals("prod_color")) {
					if(!color.equals("null")) {
						Cookie color_cart = new Cookie("prod_color", cartService.getTxt(color, o.getValue()));
						color_cart.setMaxAge(60*60*24);
						response.addCookie(color_cart);
					}
				} else if (!li_color.contains("prod_color")){
					if(!color.equals("null")) {
						Cookie color_cart = new Cookie("prod_color", color);
						color_cart.setMaxAge(60*60*24);
						response.addCookie(color_cart);
					}
				}
			}
		}
		if (size != null) {
			for (Cookie o : size_prod) {
				if (o.getName().equals("prod_size")) {
					if(!size.equals("null")) {
						Cookie size_cart = new Cookie("prod_size", cartService.getTxt_size(size, o.getValue()));
						size_cart.setMaxAge(60*60*24);
						response.addCookie(size_cart);
					}
				} else if (!li_color.contains("prod_size")){
					if(!size.equals("null")) {
						Cookie size_cart = new Cookie("prod_size", size);
						size_cart.setMaxAge(60*60*24);
						response.addCookie(size_cart);
					}
				}
			}
		}
	
		
		
		for (Cookie o : o_color) {
			if(o.getName().equals("prod_color")) {
				map_color = cartService.getProd_Color_Size(o.getValue());
			}
		}
		
		for (Cookie o : o_color) {
			if(o.getName().equals("prod_size")) {
				map_size = cartService.getProd_Color_Sizes(o.getValue());
			}
		}
		
		//System.out.println(size );
	
		/*
		 * for (Cookie o : o_color) { if(o.getName().equals("prod_color")) {
		 * System.out.println(o.getValue()); } }
		 */
		
		//for (Cookie o : o_color) { if(o.getName().equals("prod_size")) {
			// System.out.println(o.getValue()); } }
		
		mv.addObject("listSize", map_size);
		mv.addObject("listColor", map_color);
		mv.addObject("listAllColor", colorService.getAllColor());
		mv.addObject("hmProd_Color_Size", color_sizeService.getCS());
		mv.addObject("totalPayment", totalPayment);
		mv.addObject("listProd", hm);

		return mv;
	}

}
