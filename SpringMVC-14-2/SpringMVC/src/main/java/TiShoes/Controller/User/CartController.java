package TiShoes.Controller.User;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import TiShoes.Model.Cart;
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
	
	@RequestMapping(value = { "/cart/{id}" })
	public ModelAndView loadCartByUserID(@PathVariable String id,HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("user/cart");
		
		cartService = new CartService();
		color_sizeService = new Color_sizeService();
		colorService = new ColorService();
		
//		String plus = String.valueOf(request.getParameter("plus"));
//		String size = String.valueOf(request.getParameter("size"));
//		String color = String.valueOf(request.getParameter("color"));
//		String minus = String.valueOf(request.getParameter("minus"));
//		String remove = String.valueOf(request.getParameter("remove"));
//		String del_prod = String.valueOf(request.getParameter("deleleProduct"));
//		String checkedAll = String.valueOf(request.getParameter("checkedAll"));
//		String totalmoney = String.valueOf(request.getParameter("totalmoney"));
//		String addtocart = String.valueOf(request.getParameter("product"));
//		String continueShop = String.valueOf(request.getParameter("continueShopping"));

		HashMap<Product, Integer> hm = new LinkedHashMap<>();
		HashMap<Integer, Integer> map_color = null;
		HashMap<String, Integer> map_size = null;
		String sColor = "", sSize ="";
		List<Cart> li = cartService.getAllCart();
		for (Cart cart : li) {
			if(cart.getUser().getId() == Integer.parseInt(id)) {
				hm.put(cart.getColor_size().getProd(), cart.getpQuantity());
				sColor += cart.getColor_size().getColor().getId() +"_" + cart.getColor_size().getProd().getId() + "/";
				sSize += cart.getColor_size().getSize().getId() + "_"+cart.getColor_size().getColor().getId() +"_" + cart.getColor_size().getProd().getId() + "/";
				
			}
		}
		
	
		map_color = cartService.getProd_Color_Size(sColor);
		map_size = cartService.getProd_Color_Sizes(sSize);
		
		mv.addObject("listSize", map_size);
		mv.addObject("listColor", map_color);
		
	
		if (!colorService.getAllColor().isEmpty()) {
			mv.addObject("listAllColor", colorService.getAllColor());
		}
		if (!hm.isEmpty()) {
			mv.addObject("listProd", hm);
		}
		if (!color_sizeService.getCS().isEmpty()) {
			mv.addObject("hmProd_Color_Size", color_sizeService.getCS());
		}
		
		mv.addObject("userID", id);
		
		return mv;
	}

	@RequestMapping(value = { "/cart" })
	public ModelAndView loadCart(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("user/cart");

		Cookie arrO[] = request.getCookies();
		List<String> li_color = null;
		if (arrO != null) {
			li_color = new ArrayList<>();
			for (Cookie o : arrO) {
				li_color.add(o.getName());
				
			}
		}
		
		
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
		String addtocart = String.valueOf(request.getParameter("product"));
		String continueShop = String.valueOf(request.getParameter("continueShopping"));

		double totalPayment = 0;

		HashMap<Product, Integer> hm = new HashMap<>();
		HashMap<Integer, Integer> map_color = null;
		HashMap<String, Integer> map_size = null;

		
		List<String> li_color_split = null;

		

		if (continueShop.equals("Continue Shopping")) {
			return new ModelAndView("redirect:/products");
		}
		for (Cookie cookie : arrO) {
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

		for (Cookie cookie : arrO) {
			if (cookie.getName().equals("addtocart")) {
				if (!plus.equals("null")) {
					String strs1 = cookie.getValue();
					String strs = plus;
					String list = cartService.PlusProdCard(strs, strs1);
					cookie.setValue(list);
					cookie.setMaxAge(60 * 60 * 24);
					response.addCookie(cookie);
				} else if (!minus.equals("null")) {
					String strs1 = cookie.getValue();
					String strs = minus;
					String list = cartService.MinusProdCard(strs, strs1);
					cookie.setValue(list);
					cookie.setMaxAge(60 * 60 * 24);
					response.addCookie(cookie);
				} else if (!remove.equals("null")) {
					String strs1 = cookie.getValue();
					String strs = remove;
					String list = cartService.DelProdCard(strs, strs1);
					cookie.setValue(list);
					cookie.setMaxAge(60 * 60 * 24);
					response.addCookie(cookie);
				} else if (!del_prod.equals("null")) {
					String strs1 = cookie.getValue();
					String strs = del_prod;
					String list = cartService.DelProdCard(strs, strs1);
					if (list.equals("")) {
						cookie.setValue("");
						cookie.setMaxAge(0);
						response.addCookie(cookie);
					} else {
						cookie.setValue(list);
						cookie.setMaxAge(60 * 60 * 24);
						response.addCookie(cookie);
					}

				}
			}
		}

		
		if (arrO != null) {
			li_color_split = new ArrayList<>();
			for (Cookie o : arrO) {
				if (o.getName().equals("prod_color")) {
					String a[] = o.getValue().split("/");
					for (int i = 0; i < a.length; i++) {
						li_color_split.add(a[i]);
					}
				}

			}
		}

		if (arrO != null) {
			for (Cookie o : arrO) {
				if (o.getName().equals("prod_color")) {
					if (!color.equals("null")) {
						o.setValue(cartService.getTxt(color, o.getValue()));
						o.setMaxAge(60 * 60 * 24);
						response.addCookie(o);
					}
				} else if (!li_color.contains("prod_color")) {
					if (!color.equals("null")) {
						Cookie color_cart = new Cookie("prod_color", color);
						color_cart.setMaxAge(60 * 60 * 24);
						response.addCookie(color_cart);
					}
				}
			}
		}
		if (size != null) {
			for (Cookie o : arrO) {
				if (o.getName().equals("prod_size")) {
					if (!size.equals("null")) {
						o.setValue(cartService.getTxt_size(size, o.getValue()));
						o.setMaxAge(60 * 60 * 24);
						response.addCookie(o);
					}
				} else if (!li_color.contains("prod_size")) {
					if (!size.equals("null")) {
						Cookie size_cart = new Cookie("prod_size", size);
						size_cart.setMaxAge(60 * 60 * 24);
						response.addCookie(size_cart);
					}
				}
			}
		}

		for (Cookie o : arrO) {
			if (o.getName().equals("prod_color")) {
				System.out.println("prod_color"+o.getValue());
				map_color = cartService.getProd_Color_Size(o.getValue());
			}
		}

		for (Cookie o : arrO) {
			if (o.getName().equals("prod_size")) {
				System.out.println("prod_size"+o.getValue());
				map_size = cartService.getProd_Color_Sizes(o.getValue());
			}
		}

		if (!addtocart.equals("null")) {
			StringBuilder strReverse = new StringBuilder(addtocart);
			String arr[] = strReverse.reverse().toString().split("_");
			// size_color_product
			for (Cookie o : arrO) {
				String add = arr[0] + "_" + arr[1] + "_" + arr[2];
				if (o.getName().equals("prod_size")) {
					if (o.getName().equals("prod_size")) {
						o.setValue(cartService.getTxt_size(add, o.getValue()));
						o.setMaxAge(60 * 60 * 24);
						response.addCookie(o);
					}
				} else if (!li_color.contains("prod_size")) {
					Cookie addtocartprod = new Cookie("prod_size", add);
					addtocartprod.setMaxAge(60 * 60 * 24);
					response.addCookie(addtocartprod);
				}
			}
			// color_product
			for (Cookie o : arrO) {
				String add = arr[1] + "_" + arr[2];
				if (o.getName().equals("prod_color")) {
					if (o.getName().equals("prod_color")) {
						o.setValue(cartService.getTxt(add, o.getValue()));
						o.setMaxAge(60 * 60 * 24);
						response.addCookie(o);
					}
				} else if (!li_color.contains("prod_color")) {
					Cookie addtocartprod = new Cookie("prod_color", add);
					addtocartprod.setMaxAge(60 * 60 * 24);
					response.addCookie(addtocartprod);
				}
			}
			// product
			for (Cookie o : arrO) {
				String add = arr[2];
				if (o.getName().equals("addtocart")) {
					o.setValue(o.getValue() + "/" + add);
					o.setMaxAge(60 * 60 * 24);
					response.addCookie(o);
				} else if (!li_color.contains("addtocart")) {
					Cookie addtocartprod = new Cookie("addtocart", add);
					addtocartprod.setMaxAge(60 * 60 * 24);
					response.addCookie(addtocartprod);
				}
			}
		}
		// System.out.println(size );

		/*
		 * for (Cookie o : o_color) { if(o.getName().equals("prod_color")) {
		 * System.out.println(o.getValue()); } }
		 */

		
			mv.addObject("listSize", map_size);
			mv.addObject("listColor", map_color);
		
		if (!colorService.getAllColor().isEmpty()) {
			mv.addObject("listAllColor", colorService.getAllColor());
		}
		if (!color_sizeService.getCS().isEmpty()) {
			mv.addObject("hmProd_Color_Size", color_sizeService.getCS());
		}
		if (!hm.isEmpty()) {
			mv.addObject("listProd", hm);
		}

		mv.addObject("totalPayment", totalPayment);
		
		
		

		return mv;
	}

}
