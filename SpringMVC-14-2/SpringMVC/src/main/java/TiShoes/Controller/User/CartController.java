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
import TiShoes.Model.Color;
import TiShoes.Model.Color_size;
import TiShoes.Model.Product;
import TiShoes.Service.User.CartService;
import TiShoes.Service.User.ColorService;
import TiShoes.Service.User.Color_sizeService;
import TiShoes.Service.User.ProductService;
import TiShoes.Service.User.UserService;

@Controller
public class CartController {
	private ProductService productService;
	private CartService cartService;
	private Color_sizeService color_sizeService;
	private ColorService colorService;
	private UserService userService;

	@RequestMapping(value = { "/cart/{id}" })
	public ModelAndView loadCartByUserID(@PathVariable String id, HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("user/cart-user");

		cartService = new CartService();
		color_sizeService = new Color_sizeService();
		colorService = new ColorService();
		userService = new UserService();

		String plus = request.getParameter("plus");
		String size = request.getParameter("size");
		String color = request.getParameter("color");
		String minus = request.getParameter("minus");
		String del_prod = request.getParameter("delete");
		String delete = request.getParameter("minusdelete");

		if(size != null) {
			if(cartService.update_size_in_cart_by_string(size)) {
				System.out.println("size: "+size);
			}
 		}
		
		if(color != null) {
			if(cartService.update_color_in_cart_by_string(color)) {
				System.out.println("color: "+color);
			}
 		}
		
		if(plus != null) {
			if(cartService.plus_product_in_cart_by_cart_id(Integer.parseInt(plus))) { 
				System.out.println("plus: "+ plus);
			}
 		}
		if(minus != null && delete == null) {
			if(cartService.minus_product_in_cart_by_cart_id(Integer.parseInt(minus))) { 
				System.out.println("minus: "+ minus);
			}
		} else if (minus != null && delete != null) {
			if(cartService.minus_product_in_cart_by_cart_id(Integer.parseInt(minus))) { 
				System.out.println("minus: "+ minus);
			}
		}
		if(del_prod != null) {
			if(cartService.delete_cart_by_cart_id(Integer.parseInt(del_prod))) { 
				System.out.println("delete: "+ del_prod);
			}
		}
		// information to display in cart
		List<Cart> li = cartService.getAllCart();
		List<Cart> li_c = new ArrayList<>();
		for (Cart cart : li) {
			if (cart.getUser().getId() == Integer.parseInt(id)) {
				li_c.add(cart);
			}
		}
		if(li_c.size() > 0) {
			mv.addObject("cart", li_c);
		}
		if (!colorService.getAllColor().isEmpty()) {
			mv.addObject("listAllColor", colorService.getAllColor());
		}
		if (!color_sizeService.getCS().isEmpty()) {
			mv.addObject("hmProd_Color_Size", color_sizeService.getCS());
		}
		
		int id_ = Integer.parseInt(id);
		
		mv.addObject("userID", id_);
		mv.addObject("user_id", id_);
		mv.addObject("avatar", userService.getAvatarByUserID(Integer.parseInt(id)));
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
				System.out.println("prod_color" + o.getValue());
				map_color = cartService.getProd_Color_Size(o.getValue());
			}
		}
		for (Cookie o : arrO) {
			if (o.getName().equals("prod_size")) {
				System.out.println("prod_size" + o.getValue());
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

	@RequestMapping(value = { "/add-to-cart/{id}" })
	public void add_to_cart(@PathVariable String id, HttpServletRequest request, HttpServletResponse response) {

		cartService = new CartService();
		color_sizeService = new Color_sizeService();
		
		Cookie arr[] = request.getCookies();
		List<String> li = new ArrayList<>();
		for (Cookie o : arr) {
			li.add(o.getValue());
		}
		String txt = "";
		String a[] = id.split("_");
		if (a.length == 1) {
			String id_prod = a[0];
			if (arr != null) {
				for (Cookie o : arr) {
					if (o.getName().equals("addtocart")) {
							txt = o.getValue() + "/" + id_prod;
							o.setValue(txt);
					} else if (!li.contains("addtocart")) {
							Cookie cart = new Cookie("addtocart", id_prod);
							cart.setMaxAge(60*60*24);
							response.addCookie(cart);
					}
				}
			}
		} else if (a.length > 1) {
			String id_user = a[0];
			String id_prod = a[1];
			int id_color_size = color_sizeService.firstColor_SizeById_Prod(Integer.parseInt(id_prod));
			if(id_user != "" && id_prod != "") {
				cartService.insertIntoCartDB(1, id_color_size, Integer.parseInt(id_user));
			}
		}
	}

}
