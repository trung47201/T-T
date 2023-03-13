package TiShoes.Controller.User;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import TiShoes.Model.Cart;
import TiShoes.Service.User.CartService;
import TiShoes.Service.User.OrderService;
import TiShoes.Service.User.Order_detailsService;
import TiShoes.Service.User.VoucherService;

@Controller
public class CheckoutCartController {
	private VoucherService voucherService;
	private Order_detailsService order_detailsService;
	private OrderService orderService;
	private CartService cartService;

	@RequestMapping(value = { "cart/checkout/user-cart/{id}" })
	public ModelAndView checkout_ok_cart(@PathVariable String id, HttpServletRequest request,
			HttpServletResponse response) {
		order_detailsService = new Order_detailsService();
		orderService = new OrderService();
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
			if (vc_id == 0) {
				vc_id = 1;
			}
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
				System.out.println("buy cart success this checkout cart controller");
				System.out.println(vc_id +"_"+ method);
				return new ModelAndView("redirect: /SpringMVC/thank/" + order_id);

			} else {
				System.out.println("buy cart unsuccess this");
				return new ModelAndView("redirect: /SpringMVC/cart/checkout-cart/" + id);
			}
		}

		return null;
	}
}
