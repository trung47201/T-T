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
		String vccode = request.getParameter("vccode");
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
		Product p = shoesService.getProduct(Integer.parseInt(id_prod));
		if (p.getDiscount() > 0) {
			price_at += p.getPrice() - p.getPrice() * p.getDiscount() / 100;
		} else {
			price_at += p.getPrice();
		}
		if (id_prod != null && vccode != null && size != null && color != null && city != null && district != null
				&& address != null && firstname != null && lastname != null && phone_number != null && email != null) {
			double dis = checkoutService.get_discount_at(Integer.parseInt(quantity), vccode, Integer.parseInt(id_prod));
			double pricetotal = checkoutService.get_price_at(Integer.parseInt(quantity), vccode,
					Integer.parseInt(id_prod));
			if (vc_id == 0) {
				vc_id = 1;
			}
			if (pricetotal < 50) {
				pricetotal = pricetotal + 11.00;
			}
			if (vc_id != 1) {
				if (receiptService.insertIntoOrder(fullname, email, phone_number, adr, vc_id, note, method, dis)
						&& voucherService.update_limit_voucher(vc_id)
						&& receipt_detailsService.insertIntoOrder_details((double) Math.round(price_at * 100) / 100,
								Integer.parseInt(quantity), Integer.parseInt(id_prod), Integer.parseInt(size),
								Integer.parseInt(color), phone_number, email)
						&& product_color_sizeService.updateColor_size_Quantity(Integer.parseInt(size),
								Integer.parseInt(color), Integer.parseInt(id_prod), Integer.parseInt(quantity))
						&& shoesService.updateProduct_Sold(Integer.parseInt(id_prod), Integer.parseInt(quantity))
						&& statisticsService.update_order_revenue_product_num_in_statistics_DB(
								Integer.parseInt(quantity), pricetotal)) {
					session.setAttribute("order", "end");
					System.out.println("buy now success (96 checkoutController)");
					return new ModelAndView("redirect: /ShopTandT/sucess-buynow?id_prod=" + id_prod + "&id_color=" + color
							+ "&id_size=" + size + "&quantity=" + quantity + "&fullname=" + fullname + "&phone_number="
							+ phone_number + "&email=" + email + "&address=" + adr + "&note=" + note + "&voucher="
							+ vc_id + "&priceat=" + pricetotal + "&user=" + user + "&method=" + method);
				} else {
					System.out.println("buy now unsuccess");
					return new ModelAndView("redirect: /ShopTandT/cart/checkout/" + id);
				}
			} else {
				if (receiptService.insertIntoOrder(fullname, email, phone_number, adr, vc_id, note, method, dis)
						&& receipt_detailsService.insertIntoOrder_details((double) Math.round(price_at * 100) / 100,
								Integer.parseInt(quantity), Integer.parseInt(id_prod), Integer.parseInt(size),
								Integer.parseInt(color), phone_number, email)
						&& product_color_sizeService.updateColor_size_Quantity(Integer.parseInt(size),
								Integer.parseInt(color), Integer.parseInt(id_prod), Integer.parseInt(quantity))
						&& shoesService.updateProduct_Sold(Integer.parseInt(id_prod), Integer.parseInt(quantity))
						&& statisticsService.update_order_revenue_product_num_in_statistics_DB(
								Integer.parseInt(quantity), pricetotal)) {
					session.setAttribute("order", "end");
					System.out.println("buy now success (96 checkoutController)");
					return new ModelAndView("redirect: /ShopTandT/sucess-buynow?id_prod=" + id_prod + "&id_color=" + color
							+ "&id_size=" + size + "&quantity=" + quantity + "&fullname=" + fullname + "&phone_number="
							+ phone_number + "&email=" + email + "&address=" + adr + "&note=" + note + "&voucher="
							+ vc_id + "&priceat=" + pricetotal + "&user=" + user + "&method=" + method);
				} else {
					System.out.println("buy now unsuccess");
					return new ModelAndView("redirect: /ShopTandT/cart/checkout/" + id);
				}
			}
		}
		return new ModelAndView("redirect: /ShopTandT/");
	}

	@RequestMapping(value = { "cart/checkout/{id}" }) // buy now login and not login
	public ModelAndView checkout_buy_now(@PathVariable String id, HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("user/re-buynow");
		product_color_sizeService = new Product_color_sizeService();
		shoesService = new ShoesService();
		checkoutService = new CheckoutService();
		voucherService = new VoucherService();
		userService = new UserService();
		receiptService = new ReceiptService();
		postsService = new PostsService();

		String voucher = request.getParameter("voucher");
		String quantity = request.getParameter("quantity");
		String size = request.getParameter("size");
		String color = request.getParameter("color");
		String method = request.getParameter("paymentmethods");
		String login = request.getParameter("login");
		
		HttpSession session = request.getSession();
		if(login != null) {
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
		System.out.println("checkout cart -> order with user id (360)");

		userService = new UserService();
		cartService = new CartService();
		product_color_sizeService = new Product_color_sizeService();
		shoesService = new ShoesService();
		checkoutService = new CheckoutService();
		voucherService = new VoucherService();
		receiptService = new ReceiptService();
		
		int user_id = 0;
		double total = 0;
		String address = "", city = "", district = "", village = "";
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
				district = arrAddress[1];
				village = arrAddress[2];

				mv.addObject("city", city.trim());
				mv.addObject("district", district.trim());
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
									if (receiptService.check_voucher_used_by_user_id(user_id, voucher)) {
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
