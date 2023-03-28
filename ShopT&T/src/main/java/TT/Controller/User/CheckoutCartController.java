package TT.Controller.User;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import TT.Model.Cart;
import TT.Model.Product_color_size;
import TT.Service.User.CartService;
import TT.Service.User.CheckoutService;
import TT.Service.User.OrderService;
import TT.Service.User.Order_detailsService;
import TT.Service.User.PostsService;
import TT.Service.User.Product_color_sizeService;
import TT.Service.User.StatisticsService;
import TT.Service.User.VoucherService;
import TT.Service.User.Product.ShoesService;

@Controller
public class CheckoutCartController {
	private VoucherService voucherService;
	private Order_detailsService order_detailsService;
	private OrderService orderService;
	private CartService cartService;
	private CheckoutService checkoutService;
	private Product_color_sizeService product_color_sizeService;
	private ShoesService shoesService;
	private StatisticsService statisticsService;
	private PostsService postsService;

	@RequestMapping(value = { "cart/checkout/user-cart/{id}" })
	public ModelAndView checkout_ok_cart(@PathVariable String id, HttpServletRequest request,
			HttpServletResponse response) {
		order_detailsService = new Order_detailsService();
		orderService = new OrderService();
		voucherService = new VoucherService();
		cartService = new CartService();
		product_color_sizeService = new Product_color_sizeService();
		shoesService = new ShoesService();
		statisticsService = new StatisticsService();

		HttpSession session = request.getSession();

		String fullname = request.getParameter("fullname");
		String phone_number = request.getParameter("phone");
		String email = request.getParameter("email");
		String city = request.getParameter("city");
		String town = request.getParameter("town");
		String village = request.getParameter("village");
		String note = request.getParameter("note");
		String method = request.getParameter("method");
		String vccode = request.getParameter("vccode");

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
		String userid = String.valueOf(session.getAttribute("userid"));
		boolean check_vc = false;
		if (vccode != null) {
			if (voucherService.voucher_exists_by_code(vccode)) {
				if (!voucherService.expired_voucher_by_code(vccode)) {
					if (!voucherService.voucher_start_date_by_code(vccode)) {
						double applyfor = voucherService.get_apply_for_by_code(vccode);
						if (total >= applyfor) {
							if (orderService.check_voucher_used_by_user_id(Integer.parseInt(userid), vccode)) {
								System.out.println("start");
								check_vc = true;
							}
						}
					}
				}
			}
		}
		int vc_id = 1;
		if (check_vc) {
			vc_id = voucherService.getVoucherIdByCode(vccode);
		}

		if (note == null) {
			note = "";
		}
		if (method == null) {
			method = "COD";
		}

		int vch_discount = voucherService.getDiscountById_Voucher(vc_id);
		double dis = 0;
		if (vch_discount > 0) {
			dis = (double) Math.round(vch_discount * total) / 100;
		}

		if (city != null && town != null && village != null && fullname != null && phone_number != null
				&& email != null) {
			String address = city + " - " + town + " - " + village;
			if (vc_id == 0) {
				vc_id = 1;
			}
			if (orderService.insertIntoOrder(fullname, email, phone_number, address, vc_id, note, method, dis)) {
				if (vc_id != 1) {
					voucherService.update_limit_voucher(vc_id);
				}
				if (vch_discount == 0) {
					vch_discount = 1;
				}
				for (Cart cart : liCart) {
					double price_at = 0;
					if (cart.getColor_size().getProd().getDiscount() > 0) {
						price_at = cart.getColor_size().getProd().getPrice() - cart.getColor_size().getProd().getPrice()
								* cart.getColor_size().getProd().getDiscount() / 100;
					} else {
						price_at = cart.getColor_size().getProd().getPrice();
					}
					if (order_detailsService.insertIntoOrder_details(price_at, cart.getQuantity(),
							cart.getColor_size().getProd().getId(), cart.getColor_size().getSize().getId(),
							cart.getColor_size().getColor().getId(), phone_number, email)
							&& product_color_sizeService.updateColor_size_Quantity(
									cart.getColor_size().getSize().getId(), cart.getColor_size().getColor().getId(),
									cart.getColor_size().getProd().getId(), cart.getQuantity())
							&& shoesService.updateProduct_Sold(cart.getColor_size().getProd().getId(),
									cart.getQuantity())
							&& statisticsService.update_order_revenue_product_num_in_statistics_DB(cart.getQuantity(),
									(double) Math.round(vch_discount * price_at) / 100)
							&& cartService.delete_cart_by_cart_id(cart.getId())) {
					}
				}
				int order_id = orderService.get_last_order_id_by(phone_number, email);
				System.out.println("buy cart success this checkout cart controller");
				System.out.println(vc_id + "_" + method);
				session.setAttribute("checkoutcart", "end");
				System.out.println(session.getAttribute("checkoutcart"));
				return new ModelAndView("redirect: /ShopTandT/thank/" + order_id);
			} else {
				System.out.println("buy cart unsuccess this");
				return new ModelAndView("redirect: /ShopTandT/cart/checkout-cart/" + id);
			}
		}
		return null;
	}

	@RequestMapping(value = { "checkout-cart" })
	public ModelAndView checkout_cart_not_login(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("user/checkout-cart");

		postsService = new PostsService();
		checkoutService = new CheckoutService();

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

		HashMap<Product_color_size, Integer> hm = checkoutService.get_list_color_size_qty_by_string_process(process);

		mv.addObject("listCart", hm);

		if (method.equals("null")) {
			method = "COD";
		}

		double totalPayment = checkoutService.get_total_by_string_process(process);

		mv.addObject("totalPayment", totalPayment);
		mv.addObject("process", process);
		// back home
		mv.addObject("back_home", "cart");
		mv.addObject("hmPosts", postsService.listPost());
		return mv;
	}

	@RequestMapping(value = { "checkout-cart/ok" })
	public ModelAndView checkout_cart_not_login_ok(HttpServletRequest request, HttpServletResponse response) {

		checkoutService = new CheckoutService();
		orderService = new OrderService();
		order_detailsService = new Order_detailsService();
		String process = String.valueOf(request.getParameter("process"));

		String fullname = request.getParameter("fullname");
		String phone_number = request.getParameter("phone");
		String email = request.getParameter("email");
		String city = request.getParameter("city");
		String town = request.getParameter("town");
		String village = request.getParameter("village");
		String note = request.getParameter("note");
		String method = request.getParameter("method");
		String address = city + " - " + town + " - " + village;
		HashMap<Product_color_size, Integer> hm = checkoutService.get_list_color_size_qty_by_string_process(process);
		if (method == null) {
			method = "COD";
		}

		if (city != null && town != null && village != null && fullname != null && phone_number != null
				&& email != null) {
			if (orderService.insertIntoOrder(fullname, email, phone_number, address, 1, note, method, 0)) {
				for (Product_color_size c : hm.keySet()) {
					double price_at = 0;
					if (c.getProd().getDiscount() > 0) {
						price_at = c.getProd().getPrice() - c.getProd().getPrice() * c.getProd().getDiscount() / 100;
					} else {
						price_at = c.getProd().getPrice();
					}
					if (order_detailsService.insertIntoOrder_details(price_at, hm.get(c), c.getProd().getId(),
							c.getSize().getId(), c.getColor().getId(), phone_number, email)
							&& product_color_sizeService.updateColor_size_Quantity(c.getSize().getId(),
									c.getColor().getId(), c.getProd().getId(), hm.get(c))) {

					}
				}
				int order_id = orderService.get_last_order_id_by(phone_number, email);
				System.out.println("buy cart success this checkout cart controller (192)");
				return new ModelAndView("redirect: /ShopTandT/cart?process-delete=" + process + "&order-id=" + order_id);
			} else {
				System.out.println("buy cart unsuccess this");
				return new ModelAndView("redirect: /ShopTandT/checkout-cart?process=" + process);
			}
		}
		return null;
	}
}
