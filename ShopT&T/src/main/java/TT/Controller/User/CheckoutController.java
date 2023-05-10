package TT.Controller.User;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import TT.Model.Cart;
import TT.Model.Product;
import TT.Model.User;
import TT.Service.User.CartService;
import TT.Service.User.CheckoutService;
import TT.Service.User.ReceiptService;
import TT.Service.User.Receipt_detailsService;
import TT.Service.User.PostsService;
import TT.Service.User.Product_color_sizeService;
import TT.Service.User.StatisticsService;
import TT.Service.User.UserService;
import TT.Service.User.VoucherService;
import TT.Service.User.Voucher_SaveService;
import TT.Service.User.Product.ShoesService;

@Controller
public class CheckoutController {
	private ShoesService shoesService;
	private CheckoutService checkoutService;
	private Product_color_sizeService product_color_sizeService;
	private VoucherService voucherService;
	private Receipt_detailsService receipt_detailsService;
	private ReceiptService receiptService;
	private UserService userService;
	private CartService cartService;
	private StatisticsService statisticsService;
	private PostsService postsService;
	private Voucher_SaveService voucher_saveService;

	@RequestMapping(value = { "cart/checkout/ok/{id}" })
	public ModelAndView checkout_ok(@PathVariable String id, HttpServletRequest request, HttpServletResponse response) {
		receipt_detailsService = new Receipt_detailsService();
		receiptService = new ReceiptService();
		shoesService = new ShoesService();
		checkoutService = new CheckoutService();
		userService = new UserService();
		voucherService = new VoucherService();
		statisticsService = new StatisticsService();
		product_color_sizeService = new Product_color_sizeService();

		HttpSession session = request.getSession();

		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String phone_number = request.getParameter("phone");
		String email = request.getParameter("email");
		String city = request.getParameter("city");
		String district = request.getParameter("district");
		String address = request.getParameter("address");
		String note = request.getParameter("note");
		String method = request.getParameter("paymentmethods");
		String size = request.getParameter("size");
		String color = request.getParameter("color");
		String id_prod = request.getParameter("idprod");
		String vchid = request.getParameter("vchid");
		String quantity = request.getParameter("quantity");
		String fullname = "";

		if (firstname != null && lastname != null) {
			fullname = firstname + " " + lastname;
		}

		String adr = "";
		if (address != null && city != null && district != null) {
			adr = address + "-" + district + "-" + city;
		}
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
		if (vchid != null) {
			if (!vchid.equals("")) {
				vc_id = Integer.parseInt(vchid);
			} else {
				System.out.println("vch: empty!");
			}
		} else {
			System.out.println("vch: null");
		}
		if (note == null) {
			note = "";
		}
		if (method == null) {
			method = "COD";
		} else {
			method = String.valueOf(method);
			if (method.equalsIgnoreCase("COD")) {
				System.out.println("heare 111");
			} else {
				if (!user.equals("")) {
					User u = userService.get_user_by_id(Integer.parseInt(user));
					phone_number = u.getPhone_number();
				}
			}
		}
		double price_at = 0;
		Product p = shoesService.getProduct(Integer.parseInt(id_prod));
		if (p.getDiscount() > 0) {
			price_at += p.getPrice() - p.getPrice() * p.getDiscount() / 100;
		} else {
			price_at += p.getPrice();
		}

		System.out.println("here2 126:" + size + "---" + color + "====method" + method);
		if (id_prod != null && size != null && color != null && city != null && district != null && address != null
				&& firstname != null && lastname != null && phone_number != null && email != null) {
			if (size.equals("")) {
				size = "25";
			}
			double dis = checkoutService.get_discount_at(Integer.parseInt(quantity),
					voucherService.get_voucher_code_by_id(vc_id), Integer.parseInt(id_prod));
			double pricetotal = checkoutService.get_price_at(Integer.parseInt(quantity),
					voucherService.get_voucher_code_by_id(vc_id), Integer.parseInt(id_prod));
			if (vc_id == 0) {
				vc_id = 1;
			}
			if (pricetotal < 50) {
				pricetotal = pricetotal + 11.00;
			}
			System.out.println("here1 139");
			if (vc_id != 1) {
				System.out.println("here 141");
				if (receiptService.insertIntoOrder(fullname, email, phone_number, adr, vc_id, note, method, dis)
						&& voucherService.update_limit_voucher(vc_id)) {
					int order_id = receiptService.get_last_order_id_by(phone_number, email);
					if (receipt_detailsService.insertIntoOrder_details((double) Math.round(price_at * 100) / 100,
							Integer.parseInt(quantity), Integer.parseInt(id_prod), Integer.parseInt(size),
							Integer.parseInt(color), order_id)
							&& product_color_sizeService.updateColor_size_Quantity(Integer.parseInt(size),
									Integer.parseInt(color), Integer.parseInt(id_prod), Integer.parseInt(quantity))
							&& shoesService.updateProduct_Sold(Integer.parseInt(id_prod), Integer.parseInt(quantity))
							&& statisticsService.update_order_num_in_statistics_DB()) {
						session.setAttribute("order", "end");
						System.out.println("buy now success (118 checkoutController)");
						voucher_saveService.update(Integer.parseInt(user), vc_id);
						if (!method.equals("COD")) {
							double statistics = (double) Math.round((price_at * Integer.parseInt(quantity) - dis) * 100)
									/ 100;
							if (price_at < 50) {
								statistics = statistics + 11.0;
							}
							System.out.println("here 152 -------------------------------------------");
							statisticsService.update_revenue_product_num_in_statistics_DB(1, statistics);
						}
						return new ModelAndView("redirect: /ShopTandT/sucess-buynow?id_prod=" + id_prod + "&id_color="
								+ color + "&id_size=" + size + "&quantity=" + quantity + "&fullname=" + fullname
								+ "&phone_number=" + phone_number + "&email=" + email + "&address=" + adr + "&note="
								+ note + "&voucher=" + vc_id + "&priceat=" + pricetotal + "&user=" + user + "&method="
								+ method);
					}
				} else {
					System.out.println("buy now unsuccess");
					return new ModelAndView("redirect: /ShopTandT/cart/checkout/" + id);
				}
			} else {
				if (receiptService.insertIntoOrder(fullname, email, phone_number, adr, vc_id, note, method, dis)) {
					int order_id = receiptService.get_last_order_id_by(phone_number, email);
					if (receipt_detailsService.insertIntoOrder_details((double) Math.round(price_at * 100) / 100,
							Integer.parseInt(quantity), Integer.parseInt(id_prod), Integer.parseInt(size),
							Integer.parseInt(color), order_id)
							&& product_color_sizeService.updateColor_size_Quantity(Integer.parseInt(size),
									Integer.parseInt(color), Integer.parseInt(id_prod), Integer.parseInt(quantity))
							&& shoesService.updateProduct_Sold(Integer.parseInt(id_prod), Integer.parseInt(quantity))
							&& statisticsService.update_order_num_in_statistics_DB()) {
					}
					session.setAttribute("order", "end");
					System.out.println("buy now success (182 checkoutController)");
					if (!method.equals("COD")) {
						double statistics = (double) Math.round((price_at * Integer.parseInt(quantity) - dis) * 100)
								/ 100;
						if (price_at < 50) {
							statistics = statistics + 11.0;
						}
						System.out.println("here 184");
						statisticsService.update_revenue_product_num_in_statistics_DB(1, statistics);
					} else {
						System.out.println("here 188:" + method);
					}
					return new ModelAndView("redirect: /ShopTandT/sucess-buynow?id_prod=" + id_prod + "&id_color="
							+ color + "&id_size=" + size + "&quantity=" + quantity + "&fullname=" + fullname
							+ "&phone_number=" + phone_number + "&email=" + email + "&address=" + adr + "&note=" + note
							+ "&voucher=" + vc_id + "&priceat=" + pricetotal + "&user=" + user + "&method=" + method);
				} else {
					System.out.println("buy now unsuccess");
					return new ModelAndView("redirect: /ShopTandT/cart/checkout/" + id);
				}
			}
		} else {
			System.out.println("here chackoutController 198");
			System.out.println("city:" + city + " address:" + address + " district:" + district + " fullname:"
					+ fullname + " phone_number:" + phone_number + " email:" + email);
		}
		return new ModelAndView("redirect: /ShopTandT/cart/checkout/" + id);
	}

	@RequestMapping(value = { "cart/checkout/{id}" }) // buy now login and not login
	public ModelAndView checkout_buy_now(@PathVariable String id, HttpServletRequest request,
			HttpServletResponse response) {
		HttpSession session = request.getSession();
		if (session.getAttribute("blockid") != null) {
			String blockid = String.valueOf(session.getAttribute("blockid"));
			if (!blockid.equals(id)) {
				return new ModelAndView("redirect: /ShopTandT/cart/checkout/" + blockid);
			}
		}

		ModelAndView mv = new ModelAndView("user/re-buynow");
		product_color_sizeService = new Product_color_sizeService();
		shoesService = new ShoesService();
		checkoutService = new CheckoutService();
		voucherService = new VoucherService();
		userService = new UserService();
		receiptService = new ReceiptService();
		postsService = new PostsService();
		voucher_saveService = new Voucher_SaveService();

		String vch_id = request.getParameter("vchid");
		String voucher = null;
		if (vch_id != null) {
			mv.addObject("vchid", vch_id);
			System.out.println(vch_id);
			voucher = voucherService.get_voucher_code_by_id(Integer.parseInt(vch_id));
		}

		String quantity = request.getParameter("quantity");
		String size = request.getParameter("size");
		String color = request.getParameter("color");
		String method = request.getParameter("paymentmethods");
		String login = request.getParameter("login");

		System.out.println("test" + quantity);

		if (login != null) {
			session.setAttribute("buynowlogin", id);
			System.out.println(login);
		}

		String id_prod = "";
		String id_user = "";
		String a[] = id.split("_");
		if (a.length > 1) {
			id_prod = a[1];
			id_user = a[0];

			Product p = shoesService.getProduct(Integer.parseInt(id_prod));
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
			mv.addObject("limit", total);
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
							Product p = shoesService.getProduct(Integer.parseInt(id_prod));
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
								if (receiptService.check_voucher_used_by_user_id(Integer.parseInt(id_user), voucher)) {
									int vch_discount = voucherService.get_discount_by_voucher_code(voucher);
									mv.addObject("vcdiscount", vch_discount);
									mv.addObject("vcstatus", "start");
									mv.addObject("vchprice", price_at * vch_discount / 100);
									mv.addObject("applyfor", applyfor);
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
								if (receiptService.check_voucher_used_by_user_id(Integer.parseInt(id_user), voucher)) {
									int vch_discount = voucherService.get_discount_by_voucher_code(voucher);
									mv.addObject("vcdiscount", vch_discount);
									mv.addObject("vcstatus", "start");
									mv.addObject("vchprice", price_at * vch_discount / 100);
									mv.addObject("applyfor", applyfor);
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
				mv.addObject("listVoucher",
						voucher_saveService.get_all_voucher_save_by_user_id(Integer.parseInt(id_user)));
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

		if (!product_color_sizeService.getAllSizeById_Prod(Integer.parseInt(id_prod)).isEmpty()) {
			mv.addObject("listSize", product_color_sizeService.getAllSizeById_Prod(Integer.parseInt(id_prod)));
		}
		if (!product_color_sizeService.getAllColorById_prod(Integer.parseInt(id_prod)).isEmpty()) {
			mv.addObject("listColor", product_color_sizeService.getAllColorById_prod(Integer.parseInt(id_prod)));
		}

		mv.addObject("averageRating", shoesService.averageRating(Integer.parseInt(id_prod)));
		mv.addObject("product", shoesService.getProduct(Integer.parseInt(id_prod)));

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
		mv.addObject("back_home", "cart");
		mv.addObject("hmPosts", postsService.listPost());
		System.out.println(quantity);
		return mv;

	}

	@RequestMapping(value = { "cart/checkout-cart/{id}" }) // with id user
	public ModelAndView loadCheckout_cart_with_user_id(@PathVariable String id, HttpServletRequest request,
			HttpServletResponse response) {
		HttpSession session = request.getSession();
		if (session.getAttribute("checkout") != null) {
			String checkout = String.valueOf(session.getAttribute("checkout"));
			if (!checkout.equals(id)) {
				return new ModelAndView("redirect: /ShopTandT/cart/checkout-cart/" + checkout);
			}
		} else {
			System.out.println("null");
		}
		String userid = String.valueOf(session.getAttribute("userid"));
		if (session.getAttribute("checkoutcart") != null || session.getAttribute("checkoutcart") != "") {
			String checkout = String.valueOf(session.getAttribute("checkoutcart"));
			if (checkout.equals("end")) {
				return new ModelAndView("redirect: /ShopTandT/cart/" + userid);
			}
		} else {
			System.out.println("null");
		}

		ModelAndView mv = new ModelAndView("user/checkout-cart-user");
		System.out.println("checkoutController -> order with user id (390)");

		userService = new UserService();
		cartService = new CartService();
		product_color_sizeService = new Product_color_sizeService();
		shoesService = new ShoesService();
		checkoutService = new CheckoutService();
		voucherService = new VoucherService();
		receiptService = new ReceiptService();
		voucher_saveService = new Voucher_SaveService();

		int user_id = 0;
		double total = 0;
		String address = "", city = "", district = "", village = "";
		String voucher = request.getParameter("voucher");
		String vchid = request.getParameter("vchid");

		if (voucher != null) {
			mv.addObject("voucher", voucher);
		} else if (vchid != null) {
			mv.addObject("vchid", vchid);
			System.out.println(vchid);
			voucher = voucherService.get_voucher_code_by_id(Integer.parseInt(vchid));
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
			mv.addObject("limit", total);
			mv.addObject("total", total);
			mv.addObject("listCart", li);

		}

		if (user_id != 0) {
			address = userService.get_user_by_id(user_id).getAddress();
			String arrAddress[] = address.split("-");
			if (arrAddress.length > 2) {
				city = arrAddress[0];
				district = arrAddress[1];
				village = arrAddress[2];

				mv.addObject("city", city.trim());
				mv.addObject("district", district.trim());
				mv.addObject("village", village.trim());
			}

			mv.addObject("user", userService.get_user_by_id(user_id));
			// back home
			mv.addObject("back_home", "cart");
			mv.addObject("listVoucher", voucher_saveService.get_all_voucher_save_by_user_id((user_id)));
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
									if (receiptService.check_voucher_used_by_user_id(user_id, voucher)) {
										int vch_discount = voucherService.get_discount_by_voucher_code(voucher);
										System.out.println("dis: " + vch_discount + "; total: " + total);
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
