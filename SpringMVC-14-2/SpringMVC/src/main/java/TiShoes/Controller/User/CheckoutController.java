package TiShoes.Controller.User;

import java.util.ArrayList;
import java.util.HashMap;
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
import TiShoes.Model.Order_;
import TiShoes.Model.Product;
import TiShoes.Model.Sizes;
import TiShoes.Model.User;
import TiShoes.Service.User.CartService;
import TiShoes.Service.User.CheckoutService;
import TiShoes.Service.User.Color_sizeService;
import TiShoes.Service.User.MD5Service;
import TiShoes.Service.User.OrderService;
import TiShoes.Service.User.Order_detailsService;
import TiShoes.Service.User.ProductService;
import TiShoes.Service.User.UserService;
import TiShoes.Service.User.VoucherService;

@Controller
public class CheckoutController {
	private ProductService productService;
	private CheckoutService checkoutService;
	private Color_sizeService color_sizeService;
	private VoucherService voucherService;
	private MD5Service md5Service;
	private Order_ order_;
	private Order_detailsService order_detailsService;
	private OrderService orderService;
	private UserService userService;
	private CartService cartService;

	@RequestMapping(value = { "cart/checkout/ok/{id}" })
	public ModelAndView checkout_ok(@PathVariable String id, HttpServletRequest request, HttpServletResponse response) {
		md5Service = new MD5Service();
		order_detailsService = new Order_detailsService();
		orderService = new OrderService();
		productService = new ProductService();
		checkoutService = new CheckoutService();
		userService = new UserService();
		voucherService = new VoucherService();

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

		if (id_prod != null && vccode != null && size != null && color != null && city != null && town != null
				&& village != null && fullname != null && phone_number != null && email != null) {
			double dis = checkoutService.get_discount_at(Integer.parseInt(quantity), vccode, Integer.parseInt(id_prod));
			double price_at = checkoutService.get_price_at(Integer.parseInt(quantity), vccode,
					Integer.parseInt(id_prod));
			String address = city + " - " + town + " - " + village;
			if (checkoutService.check_status_order_await(phone_number, email, price_at, Integer.parseInt(quantity),
					Integer.parseInt(id_prod), Integer.parseInt(size), Integer.parseInt(color))) {
				System.out.println("Awaiting confirmation");
			} else {
				//
				if (orderService.insertIntoOrder(fullname, email, phone_number, address, vc_id, note, method, dis)
						&& order_detailsService.insertIntoOrder_details(price_at, Integer.parseInt(quantity),
								Integer.parseInt(id_prod), Integer.parseInt(size), Integer.parseInt(color),
								phone_number, email)) {
					System.out.println("buy now success");
					return new ModelAndView("redirect: /SpringMVC/sucess-buynow?id_prod=" + id_prod + "&id_color="
							+ color + "&id_size=" + size + "&quantity=" + quantity + "&fullname=" + fullname
							+ "&phone_number=" + phone_number + "&email=" + email + "&city=" + city + "&town=" + town
							+ "&village=" + village + "&note=" + note + "&voucher=" + vc_id + "&priceat=" + price_at
							+ "&user=" + user);
				} else {
					System.out.println("buy now unsuccess");
					return new ModelAndView("redirect: /SpringMVC/cart/checkout/" + id);
				}
			}
		}
		return new ModelAndView("redirect: /SpringMVC/");
	}

	@RequestMapping(value = { "cart/checkout/{id}" })
	public ModelAndView checkout_buy_now(@PathVariable String id, HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("user/buynow");
		color_sizeService = new Color_sizeService();
		productService = new ProductService();
		checkoutService = new CheckoutService();
		voucherService = new VoucherService();
		userService = new UserService();

		String voucher = request.getParameter("voucher");
		String quantity = request.getParameter("quantity");
		String size = request.getParameter("size");

		String id_prod = "";
		String id_user = "";
		String a[] = id.split("_");
		if (a.length > 1) {
			id_prod = a[1];
			id_user = a[0];
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
								int vch_discount = voucherService.get_discount_by_voucher_code(voucher);
								mv.addObject("vcdiscount", vch_discount);
								mv.addObject("vcstatus", "start");
								System.out.println("start");
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
									int vch_discount = voucherService.get_discount_by_voucher_code(voucher);
									mv.addObject("vcdiscount", vch_discount);
									mv.addObject("vcstatus", "start");
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
				String city_value = address.split("-")[0];
				String town_value = address.split("-")[1];
				String village_value = address.split("-")[2];
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
		if (id_user != null) {
			String avt = userService.getAvatarByUserID(Integer.parseInt(id_user));
			mv.addObject("avatar", avt);
			mv.addObject("userID", id_user);

		}

		return mv;

	}

	@RequestMapping(value = { "cart/checkout-cart" }) // without id user
	public ModelAndView loadCheckout_cart(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("user/checkout-cart");

		productService = new ProductService();
		checkoutService = new CheckoutService();
		md5Service = new MD5Service();
		voucherService = new VoucherService();
		order_detailsService = new Order_detailsService();
		orderService = new OrderService();
		order_ = new Order_();

		List<Product> li_prod = null;
		HashMap<Integer, Color> li_color = null;
		HashMap<Integer, Sizes> li_size = null;
		HashMap<Integer, Integer> li_amount = null;

		Double totalPayment = 0.0;

		String voucher_code = String.valueOf(request.getParameter("voucher"));
		String order = String.valueOf(request.getParameter("order"));
		String process = String.valueOf(request.getParameter("process"));
		String fullname = String.valueOf(request.getParameter("fullname"));
		String phone_number = String.valueOf(request.getParameter("phone"));
		String email = String.valueOf(request.getParameter("email"));
		String city = request.getParameter("city");
		String town = request.getParameter("town");
		String village = request.getParameter("village");
		String note = String.valueOf(request.getParameter("note"));
		String method = String.valueOf(request.getParameter("method"));
		String address = city + " - " + town + " - " + village;
		// String size = String.valueOf(request.getParameter("id_size"));
		// String quantity = String.valueOf(request.getParameter("quantity"));
		String _name = "", _phone = "", _email = "", _phone_ = "", _email_ = "", _city = "", _town = "", _village = "",
				_note = "";
		int voucher = voucherService.getVoucherIdByCode(voucher_code);

		order_ = new Order_();
		order_.setId(0);
		order_.setFullname(fullname);
		order_.setEmail(email);
		order_.setPhone_number(phone_number);
		order_.setAddress(md5Service.decodeHTML(address));
		order_.setOrder_date(null);
		order_.setUpdated_at(null);
		order_.setVoucher(null);
		order_.setNote(note);
		order_.setStatus(null);
		order_.setMethod(null);

		if (method.equals("null")) {
			method = "COD";
		}
		if (fullname == "") {
			_name = "Fullname is empty!";
		} else if (phone_number == "") {
			_phone = "Phone number is empty!";
		} else if (!phone_number.matches("\\d+")) {
			_phone_ = "Phone number must be alphanumeric!";
		} else if (email == "") {
			_email = "Email address is empty!";
		} else if (!email.matches("\\b[\\w.%-]+@[-.\\w]+\\.[A-Za-z]{2,4}\\b")) {
			_email_ = "Invalidate!";
		} else if (city == "") {
			_city = "City is empty!";
		} else if (town == "") {
			_town = "Town is empty!";
		} else if (village == "") {
			_village = "Village is empty!";
		} else if (note == "") {
			_note = "Note is empty!";
		} else {
			if (order.equals("Order")) {

				String adr = city + " " + town + " " + village;
				String arr1[] = process.split("/");
				if (voucher != 0) {
					orderService.insertIntoOrder_not_login(fullname, email, phone_number, adr, voucher, note, method);
				} else {
					orderService.insertIntoOrder_not_login(fullname, email, phone_number, adr, 1, note, method);
				}
				Cookie orr[] = request.getCookies();
				for (String s : arr1) {
					String arr[] = s.split("_");
					int id_prod = Integer.parseInt(arr[0]);
					String color = arr[1];
					String size = arr[2];
					String quantity = arr[3];
					// insert and update sql
					// System.out.println(id_prod);

					order_detailsService.insertIntoOrder_details(productService.getProduct(id_prod).getPrice(),
							Integer.parseInt(quantity), id_prod, Integer.parseInt(size), Integer.parseInt(color),
							phone_number, email);

					for (Cookie o : orr) {
						if (o.getName().equals("addtocart")) {
							String li_prod_txt = checkoutService.removeProductFromCartAfterCheckout(id_prod,
									o.getValue());

							System.out.println(o.getValue() + "==" + li_prod_txt);
							Cookie addtocart_new = new Cookie("addtocart", li_prod_txt);
							addtocart_new.setMaxAge(60 * 60 * 24 * 15);
							response.addCookie(addtocart_new);

						}
					}

				}

				return new ModelAndView(
						"redirect:/thank?you=" + md5Service.encode(order_.toString()) + "&orders=" + process);
			}
		}

		if (!process.equals("null")) {
			li_prod = checkoutService.getListProductByString(process);
			li_color = checkoutService.getListColorByString(process);
			li_size = checkoutService.getListSizeByString(process);
			li_amount = checkoutService.getListAmountByString(process);
			totalPayment = checkoutService.getTotalPaymentByString(process);
		}

		mv.addObject("listProd", li_prod);
		mv.addObject("listColor", li_color);
		mv.addObject("listSize", li_size);
		mv.addObject("listAmount", li_amount);
		mv.addObject("totalPayment", totalPayment);

		// check null
		mv.addObject("fullname", _name);
		mv.addObject("phone", _phone);
		mv.addObject("email", _email);
		mv.addObject("phone_", _phone_);
		mv.addObject("email_", _email_);
		mv.addObject("city", _city);
		mv.addObject("town", _town);
		mv.addObject("village", _village);
		mv.addObject("note", _note);

		// keep value on click submit
		mv.addObject("value_name", fullname);
		mv.addObject("value_phone", phone_number);
		mv.addObject("value_email", email);
		mv.addObject("value_city", city);
		mv.addObject("value_town", town);
		mv.addObject("value_village", village);
		mv.addObject("value_note", note);

		// back home
		mv.addObject("back_home", "cart");
		return mv;
	}

	@RequestMapping(value = { "cart/checkout-cart/{id}" }) // with id user
	public ModelAndView loadCheckout_cart_with_user_id(@PathVariable String id, HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("user/checkout-cart-user");

		userService = new UserService();
		cartService = new CartService();
		color_sizeService = new Color_sizeService();
		productService = new ProductService();
		checkoutService = new CheckoutService();
		voucherService = new VoucherService();
		orderService = new OrderService();

		String voucher = request.getParameter("voucher");

		if (voucher != null) {
			mv.addObject("voucher", voucher);
		}

		int user_id = 0;
		String address = "", city = "", town = "", village = "";
		double total = 0;
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
			System.out.println(total);
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
										int vch_discount = voucherService.get_discount_by_voucher_code(voucher);
										mv.addObject("vcdiscount", (double) Math.round(vch_discount * total) / 100);
										mv.addObject("vcstatus", "start");
										System.out.println("start");
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

		mv.addObject("id", id);
		return mv;
	}

	@RequestMapping(value = { "cart/checkout/user-cart/{id}" })
	public ModelAndView checkout_ok_cart(@PathVariable String id, HttpServletRequest request,
			HttpServletResponse response) {
		md5Service = new MD5Service();
		order_detailsService = new Order_detailsService();
		orderService = new OrderService();
		productService = new ProductService();
		checkoutService = new CheckoutService();
		userService = new UserService();
		voucherService = new VoucherService();
		cartService = new CartService();

		String fullname = request.getParameter("fullname");
		String phone_number = request.getParameter("phone");
		String email = request.getParameter("email");
		String city = request.getParameter("city");
		String town = request.getParameter("town");
		String village = request.getParameter("village");
		String note = request.getParameter("note");
		String method = request.getParameter("method");

		String vccode = request.getParameter("vccode");

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

		double total = 0;
		List<Cart> liCart = cartService.get_all_cart_by_string(id);
		if (liCart.size() > 0) {
			for (Cart cart : liCart) {
				// calculator total product price
				if (cart.getColor_size().getProd().getDiscount() > 0) {
					total += cart.getColor_size().getProd().getPrice() * cart.getQuantity()
							- cart.getColor_size().getProd().getPrice() * cart.getQuantity()
									* cart.getColor_size().getProd().getDiscount() / 100;
				} else {
					total += cart.getColor_size().getProd().getPrice() * cart.getQuantity();
				}
			}
		}
		int vch_discount = voucherService.getDiscountById_Voucher(vc_id);
		double dis = 0;
		if (vch_discount > 0) {
			dis = (double) Math.round(vch_discount * total) / 100;
		}

		if (city != null && town != null && village != null && fullname != null && phone_number != null
				&& email != null) {
			String address = city + " - " + town + " - " + village;
			if (orderService.insertIntoOrder(fullname, email, phone_number, address, vc_id, note, method, dis)) {
				for (Cart cart : liCart) {
					double price_at = 0;
					if (cart.getColor_size().getProd().getDiscount() > 0) {
						price_at = cart.getColor_size().getProd().getPrice() * cart.getQuantity()
								- cart.getColor_size().getProd().getPrice() * cart.getQuantity()
										* cart.getColor_size().getProd().getDiscount() / 100;
					} else {
						price_at = cart.getColor_size().getProd().getPrice() * cart.getQuantity();
					}
					if (order_detailsService.insertIntoOrder_details(price_at, cart.getQuantity(),
							cart.getColor_size().getProd().getId(), cart.getColor_size().getSize().getId(),
							cart.getColor_size().getColor().getId(), phone_number, email)) {
					}
				}
				int order_id = orderService.get_last_order_id_by(phone_number, email);
				System.out.println("buy cart success");
			
				return new ModelAndView("redirect: /SpringMVC/thanks/" + order_id);

			} else {
				System.out.println("buy cart unsuccess");
				return new ModelAndView("redirect: /SpringMVC/cart/checkout-cart/" + id);
			}
		}

		return null;
	}
}
