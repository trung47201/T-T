package TT.Controller.User;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import TT.Model.Cart;
import TT.Model.Product;
import TT.Model.User;
import TT.Service.User.CartService;
import TT.Service.User.CheckoutService;
import TT.Service.User.Color_sizeService;
import TT.Service.User.OrderService;
import TT.Service.User.Order_detailsService;
import TT.Service.User.ProductService;
import TT.Service.User.StatisticsService;
import TT.Service.User.UserService;
import TT.Service.User.VoucherService;

@Controller
public class CheckoutController {
	private ProductService productService;
	private CheckoutService checkoutService;
	private Color_sizeService color_sizeService;
	private VoucherService voucherService;
	private Order_detailsService order_detailsService;
	private OrderService orderService;
	private UserService userService;
	private CartService cartService;
	private StatisticsService statisticsService;

	@RequestMapping(value = { "cart/checkout/ok/{id}" })
	public ModelAndView checkout_ok(@PathVariable String id, HttpServletRequest request, HttpServletResponse response) {
		order_detailsService = new Order_detailsService();
		orderService = new OrderService();
		productService = new ProductService();
		checkoutService = new CheckoutService();
		userService = new UserService();
		voucherService = new VoucherService();
		statisticsService = new StatisticsService();

		String fullname = request.getParameter("fullname");
		String phone_number = request.getParameter("phone");
		String email = request.getParameter("email");
		String city = request.getParameter("city");
		String town = request.getParameter("town");
		String village = request.getParameter("village");
		String note = request.getParameter("note");
		String method = request.getParameter("method");
		String size = request.getParameter("size");
		String color = request.getParameter("color");
		String id_prod = request.getParameter("idprod");
		String vccode = request.getParameter("vccode");
		String quantity = request.getParameter("quantity");

		List<String> li = new ArrayList<>();
		Cookie arrO[] = request.getCookies();
		if (arrO != null) {
			for (Cookie o : arrO) {
				li.add(o.getName());
			}
		}
		String arr[] = id.split("_");
		String user = "";
		if (arr.length > 1) {
			user = arr[0];
		}
		int vc_id = 1;
		if (vccode != null) {
			vc_id = voucherService.getVoucherIdByCode(vccode);
		}
		if (note == null) {
			note = "";
		}
		if (method == null) {
			method = "COD";
		}
		double price_at = 0;
		Product p = productService.getProduct(Integer.parseInt(id_prod));
		if (p.getDiscount() > 0) {
			price_at += p.getPrice()
					- p.getPrice() * p.getDiscount() / 100;
		} else {
			price_at += p.getPrice();
		}
		if (id_prod != null && vccode != null && size != null && color != null && city != null && town != null
				&& village != null && fullname != null && phone_number != null && email != null) {
			double dis = checkoutService.get_discount_at(Integer.parseInt(quantity), vccode, Integer.parseInt(id_prod));
			double pricetotal = checkoutService.get_price_at(Integer.parseInt(quantity), vccode,
					Integer.parseInt(id_prod));
			String address = city + " - " + town + " - " + village;
			if (vc_id == 0) {
				vc_id = 1;
			}
			if(pricetotal < 50) {
				pricetotal = pricetotal + 11.00;
			}
			if (vc_id != 1) {
				if (orderService.insertIntoOrder(fullname, email, phone_number, address, vc_id, note, method, dis)
						&& voucherService.update_limit_voucher(vc_id)
						&& order_detailsService.insertIntoOrder_details((double) Math.round(price_at * 100) / 100,
								Integer.parseInt(quantity), Integer.parseInt(id_prod), Integer.parseInt(size),
								Integer.parseInt(color), phone_number, email)
						&& color_sizeService.updateColor_size_Quantity(Integer.parseInt(size), Integer.parseInt(color),
								Integer.parseInt(id_prod), Integer.parseInt(quantity))
						&& productService.updateProduct_Sold(Integer.parseInt(id_prod), Integer.parseInt(quantity))
						&& statisticsService.update_order_revenue_product_num_in_statistics_DB(
								Integer.parseInt(quantity), pricetotal)) {
					System.out.println("buy now success (96 checkoutController)");
					return new ModelAndView("redirect: /SpringMVC/sucess-buynow?id_prod=" + id_prod + "&id_color="
							+ color + "&id_size=" + size + "&quantity=" + quantity + "&fullname=" + fullname
							+ "&phone_number=" + phone_number + "&email=" + email + "&city=" + city + "&town=" + town
							+ "&village=" + village + "&note=" + note + "&voucher=" + vc_id + "&priceat=" + pricetotal
							+ "&user=" + user + "&method=" + method);
				} else {
					System.out.println("buy now unsuccess");
					return new ModelAndView("redirect: /SpringMVC/cart/checkout/" + id);
				}
			} else {
				if (orderService.insertIntoOrder(fullname, email, phone_number, address, vc_id, note, method, dis)
						&& order_detailsService.insertIntoOrder_details((double) Math.round(price_at * 100) / 100,
								Integer.parseInt(quantity), Integer.parseInt(id_prod), Integer.parseInt(size),
								Integer.parseInt(color), phone_number, email)
						&& color_sizeService.updateColor_size_Quantity(Integer.parseInt(size), Integer.parseInt(color),
								Integer.parseInt(id_prod), Integer.parseInt(quantity))
						&& productService.updateProduct_Sold(Integer.parseInt(id_prod), Integer.parseInt(quantity))
						&& statisticsService.update_order_revenue_product_num_in_statistics_DB(
								Integer.parseInt(quantity), pricetotal)) {
					System.out.println("buy now success (96 checkoutController)");
					return new ModelAndView("redirect: /SpringMVC/sucess-buynow?id_prod=" + id_prod + "&id_color="
							+ color + "&id_size=" + size + "&quantity=" + quantity + "&fullname=" + fullname
							+ "&phone_number=" + phone_number + "&email=" + email + "&city=" + city + "&town=" + town
							+ "&village=" + village + "&note=" + note + "&voucher=" + vc_id + "&priceat=" + pricetotal
							+ "&user=" + user + "&method=" + method);
				} else {
					System.out.println("buy now unsuccess");
					return new ModelAndView("redirect: /SpringMVC/cart/checkout/" + id);
				}
			}
		}
		return new ModelAndView("redirect: /SpringMVC/");
	}

	@RequestMapping(value = { "cart/checkout/{id}" }) // buy now login and not login
	public ModelAndView checkout_buy_now(@PathVariable String id, HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("user/buynow");
		color_sizeService = new Color_sizeService();
		productService = new ProductService();
		checkoutService = new CheckoutService();
		voucherService = new VoucherService();
		userService = new UserService();
		orderService = new OrderService();

		String voucher = request.getParameter("voucher");
		String quantity = request.getParameter("quantity");
		String size = request.getParameter("size");
		String color = request.getParameter("color");
		String method = request.getParameter("method");

		String id_prod = "";
		String id_user = "";
		String a[] = id.split("_");
		if (a.length > 1) {
			id_prod = a[1];
			id_user = a[0];

			Product p = productService.getProduct(Integer.parseInt(id_prod));
			double total = 0;
			if (quantity != null) {
				if (p.getDiscount() > 0) {
					total = p.getPrice() * Integer.parseInt(quantity)
							- p.getPrice() * Integer.parseInt(quantity) * p.getDiscount() / 100;
				} else {
					total = p.getPrice() * Integer.parseInt(quantity);
				}
			} else {
				if (p.getDiscount() > 0) {
					total = p.getPrice() - p.getPrice() * p.getDiscount() / 100;
				} else {
					total = p.getPrice();
				}
			}
			if (total < 50) {
				total += 11.00;
			}
			mv.addObject("total", total);
		} else if (a.length == 1) {
			id_prod = a[0];
		}

		if (voucher != null) {
			if (voucherService.voucher_exists_by_code(voucher)) {
				if (voucherService.expired_voucher_by_code(voucher)) {
					mv.addObject("vcstatus", "outofdate");
					System.out.println("het han");
				} else {
					if (voucherService.voucher_start_date_by_code(voucher)) {
						mv.addObject("vcstatus", "notstartedyet");
						System.out.println("not started yet");
					} else {
						if (quantity != null) {
							Product p = productService.getProduct(Integer.parseInt(id_prod));
							double price_at = 0;
							if (p.getDiscount() > 0) {
								price_at = p.getPrice() * Integer.parseInt(quantity)
										- p.getPrice() * Integer.parseInt(quantity) * p.getDiscount() / 100;
							} else {
								price_at = p.getPrice() * Integer.parseInt(quantity);
							}
							double applyfor = voucherService.get_apply_for_by_code(voucher);
							if (price_at < applyfor && price_at != 0) {
								mv.addObject("vcstatus", "notenough");
								System.out.println("notenough");
								mv.addObject("applyfor", applyfor);
							} else {
								if (orderService.check_voucher_used_by_user_id(Integer.parseInt(id_user), voucher)) {
									int vch_discount = voucherService.get_discount_by_voucher_code(voucher);
									mv.addObject("vcdiscount", vch_discount);
									mv.addObject("vcstatus", "start");
									mv.addObject("vchprice", price_at * vch_discount / 100);
									System.out.println("start");
								} else {
									mv.addObject("vcstatus", "used");
									System.out.println("used");
								}
							}
						} else {
							double price_at = checkoutService.get_price_at(1, voucher, Integer.parseInt(id_prod));
							double applyfor = voucherService.get_apply_for_by_code(voucher);
							if (price_at < applyfor) {
								mv.addObject("vcstatus", "notenough");
								mv.addObject("applyfor", applyfor);
								System.out.println("notenough");
							} else {
								if (orderService.check_voucher_used_by_user_id(Integer.parseInt(id_user), voucher)) {
									System.out.println("a");
									int vch_discount = voucherService.get_discount_by_voucher_code(voucher);
									mv.addObject("vcdiscount", vch_discount);
									mv.addObject("vcstatus", "start");
									mv.addObject("vchprice", price_at * vch_discount / 100);
									System.out.println("start");
								} else {
									mv.addObject("vcstatus", "used");
									System.out.println("used");
								}
							}
						}
					}
				}
			} else {
				mv.addObject("vcstatus", "notexists");
				System.out.println("not exists");
			}
		}

		if (!id_user.equals("")) {
			User u = userService.get_user_by_id(Integer.parseInt(id_user));
			if (u != null) {
				mv.addObject("user", u);
				String address = u.getAddress();
				String city_value = "";
				String town_value = "";
				String village_value = "";
				if (address.split("-").length > 2) {
					city_value = address.split("-")[0];
					town_value = address.split("-")[1];
					village_value = address.split("-")[2];
				} else if (address.split(",").length > 2) {
					city_value = address.split("-")[0];
					town_value = address.split("-")[1];
					village_value = address.split("-")[2];
				}

				mv.addObject("city", city_value.trim());
				mv.addObject("town", town_value.trim());
				mv.addObject("village", village_value.trim());
			}
		}

		if (quantity != null) {
			mv.addObject("quantity", quantity);
		}
		if (size != null) {
			mv.addObject("size", size);
		}
		if (color != null) {
			mv.addObject("color", color);
		}
		if (method != null) {
			mv.addObject("method", method);
		}

		if (!color_sizeService.getAllSizeById_Prod(Integer.parseInt(id_prod)).isEmpty()) {
			mv.addObject("listSize", color_sizeService.getAllSizeById_Prod(Integer.parseInt(id_prod)));
		}
		if (!color_sizeService.getAllColorById_prod(Integer.parseInt(id_prod)).isEmpty()) {
			mv.addObject("listColor", color_sizeService.getAllColorById_prod(Integer.parseInt(id_prod)));
		}

		mv.addObject("averageRating", productService.averageRating(Integer.parseInt(id_prod)));
		mv.addObject("product", productService.getProduct(Integer.parseInt(id_prod)));

		mv.addObject("id", id);
		mv.addObject("idprod", id_prod);
		if (voucher != null) {
			mv.addObject("vccode", voucher);
		}
		if (id_user != null && !id_user.equals("")) {
			String avt = userService.getAvatarByUserID(Integer.parseInt(id_user));
			mv.addObject("avatar", avt);
			mv.addObject("userID", id_user);
			mv.addObject("id_user", id_user);

		}

		return mv;

	}

	@RequestMapping(value = { "cart/checkout-cart/{id}" }) // with id user
	public ModelAndView loadCheckout_cart_with_user_id(@PathVariable String id, HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("user/checkout-cart-user");
		System.out.println("checkout cart -> order with user id (294)");

		userService = new UserService();
		cartService = new CartService();
		color_sizeService = new Color_sizeService();
		productService = new ProductService();
		checkoutService = new CheckoutService();
		voucherService = new VoucherService();
		orderService = new OrderService();

		int user_id = 0;
		double total = 0;
		String address = "", city = "", town = "", village = "";
		String voucher = request.getParameter("voucher");
		if (voucher != null) {
			mv.addObject("voucher", voucher);
		}
		List<Cart> li = cartService.get_all_cart_by_string(id);
		if (li.size() > 0) {
			for (Cart cart : li) {
				user_id = cart.getUser().getId();
				// calculator total product price
				if (cart.getColor_size().getProd().getDiscount() > 0) {
					total += cart.getColor_size().getProd().getPrice() * cart.getQuantity()
							- cart.getColor_size().getProd().getPrice() * cart.getQuantity()
									* cart.getColor_size().getProd().getDiscount() / 100;
				} else {
					total += cart.getColor_size().getProd().getPrice() * cart.getQuantity();
				}
			}
			mv.addObject("total", total);
			mv.addObject("listCart", li);
		}
		if (user_id != 0) {
			address = userService.get_user_by_id(user_id).getAddress();
			String arrAddress[] = address.split("-");
			if (arrAddress.length > 2) {
				city = arrAddress[0];
				town = arrAddress[1];
				village = arrAddress[2];

				mv.addObject("city", city.trim());
				mv.addObject("town", town.trim());
				mv.addObject("village", village.trim());
			}

			mv.addObject("user", userService.get_user_by_id(user_id));
			// back home
			mv.addObject("back_home", "cart");
		}
		if (voucher != null) {
			if (voucherService.voucher_exists_by_code(voucher)) {
				if (voucherService.expired_voucher_by_code(voucher)) {
					mv.addObject("vcstatus", "outofdate");
					System.out.println("het han");
				} else {
					if (voucherService.voucher_start_date_by_code(voucher)) {
						mv.addObject("vcstatus", "notstartedyet");
						System.out.println("not started yet");
					} else {
						if (total != 0) {
							double applyfor = voucherService.get_apply_for_by_code(voucher);
							if (total < applyfor && total != 0) {
								mv.addObject("vcstatus", "notenough");
								System.out.println("notenough");
								mv.addObject("applyfor", applyfor);
							} else {
								if (user_id != 0) {
									if (orderService.check_voucher_used_by_user_id(user_id, voucher)) {
										System.out.println(voucher);
										int vch_discount = voucherService.get_discount_by_voucher_code(voucher);
										mv.addObject("vcdiscount", (double) Math.round(vch_discount * total) / 100);
										mv.addObject("vcstatus", "start");
										System.out.println("vcstart");
										mv.addObject("vchprice", (double) Math.round(vch_discount * total) / 100);
									} else {
										mv.addObject("vcstatus", "used");
										System.out.println("used");
									}
								}
							}
						}
					}
				}
			} else {
				mv.addObject("vcstatus", "notexists");
				System.out.println("not exists");
			}
		}
		mv.addObject("user_id", user_id);
		mv.addObject("id", id);

		return mv;
	}

}