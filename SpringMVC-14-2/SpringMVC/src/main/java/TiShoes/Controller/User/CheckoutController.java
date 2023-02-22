package TiShoes.Controller.User;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import TiShoes.Model.Color;
import TiShoes.Model.Order_;
import TiShoes.Model.Product;
import TiShoes.Model.Sizes;
import TiShoes.Service.User.CheckoutService;
import TiShoes.Service.User.Color_sizeService;
import TiShoes.Service.User.MD5Service;
import TiShoes.Service.User.OrderService;
import TiShoes.Service.User.Order_detailsService;
import TiShoes.Service.User.ProductService;
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

	@RequestMapping(value = { "cart/checkout" })
	public ModelAndView loadCheckout_buyNow(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("user/buynow");

		color_sizeService = new Color_sizeService();
		productService = new ProductService();
		checkoutService = new CheckoutService();
		voucherService = new VoucherService();

		int id_prod = Integer.parseInt(request.getParameter("id_prod"));
		String voucher_code = String.valueOf(request.getParameter("voucher"));
		String fullname = String.valueOf(request.getParameter("fullname"));
		String phone = String.valueOf(request.getParameter("phone"));
		String email = String.valueOf(request.getParameter("email"));
		String city = String.valueOf(request.getParameter("city"));
		String town = String.valueOf(request.getParameter("town"));
		String village = String.valueOf(request.getParameter("village"));
		String note = String.valueOf(request.getParameter("note"));
		String order = String.valueOf(request.getParameter("order"));
		String size = String.valueOf(request.getParameter("id_size"));
		String quantity = String.valueOf(request.getParameter("quantity"));
		String color = String.valueOf(request.getParameter("id_color"));
		String method = String.valueOf(request.getParameter("method"));
		String _name = "", _phone = "", _email = "", _phone_ = "", _email_ = "", _city = "", _town = "", _village = "";

		int voucher = voucherService.getVoucherIdByCode(voucher_code);
		int id_size = 0;
		int id_color = 0;
		if (!color.equals("null")) {

			id_color = Integer.parseInt(color);
			mv.addObject("listSize", color_sizeService.getAllColor_sizeById_prod(id_prod, id_color));
			mv.addObject("color_id", id_color);

			if (!size.equals("null")) {
				id_size = Integer.parseInt(size);
				mv.addObject("size_id", id_size);
			} else if (size.equals("null")) {
				mv.addObject("size_id", color_sizeService.firstSizeId(id_prod, id_color));
			}
		} else {
			mv.addObject("listSize",
					color_sizeService.getAllColor_sizeById_prod(id_prod, checkoutService.firstColor(id_prod)));
			mv.addObject("color_id", checkoutService.firstColor(id_prod));
		}

		if (method.equals("null")) {
			method = "COD";
		}
		if (fullname == "") {
			_name = "Fullname is empty!";
		} else if (phone == "") {
			_phone = "Phone number is empty!";
		} else if (!phone.matches("\\d+")) {
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
		} else {
			if (order.equals("Order")) {
				if (color.equals("null")) {
					color = String.valueOf(color_sizeService.firstColorId(id_prod));
				}
				if (size.equals("null")) {
					if (color.equals("null")) {
						size = String.valueOf(
								color_sizeService.firstSizeId(id_prod, color_sizeService.firstColorId(id_prod)));
					} else {
						size = String.valueOf(color_sizeService.firstSizeId(id_prod, Integer.parseInt(color)));
						System.out.println(size);
					}
				}
				String address = city + " " + town + " " + village;
				// insert and update sql
				if (voucher != 0) {
					if (checkoutService.checkout_buynow(id_prod, Integer.valueOf(quantity), Integer.valueOf(size),
							Integer.valueOf(color), fullname, email, phone, address, voucher, note, method,
							(productService.getPriceByIdProd(id_prod, voucher) * Double.valueOf(quantity)))) {

					} else {
						System.out.println("unsuccess");
					}
				} else if (voucher == 0) {
					if (checkoutService.checkout_buynow(id_prod, Integer.valueOf(quantity), Integer.valueOf(size),
							Integer.valueOf(color), fullname, email, phone, address, 1, note, method,
							(productService.getPriceByIdProd(id_prod, 1) * Double.valueOf(quantity)))) {

					} else {
						System.out.println("unsuccess");
					}
				}

				return new ModelAndView("redirect:/sucess-buynow?id_prod=" + id_prod + "&id_color=" + color
						+ "&id_size=" + size + "&quantity=" + quantity + "&fullname=" + fullname + "&phone_number="
						+ phone + "&email=" + email + "&city=" + city + "&town=" + town + "&village=" + village
						+ "&note=" + note);

			}
		}

		// msg error
		mv.addObject("fullname", _name);
		mv.addObject("phone", _phone);
		mv.addObject("email", _email);
		mv.addObject("phone_", _phone_);
		mv.addObject("email_", _email_);
		mv.addObject("city", _city);
		mv.addObject("town", _town);
		mv.addObject("village", _village);

		// keep value on click submit
		mv.addObject("value_name", fullname);
		mv.addObject("value_phone", phone);
		mv.addObject("value_email", email);
		mv.addObject("value_city", city);
		mv.addObject("value_town", town);
		mv.addObject("value_village", village);
		mv.addObject("value_note", note);
		mv.addObject("value_quantity", quantity);

		mv.addObject("back_home", "home");

		mv.addObject("prod", productService.getProduct(id_prod));
		mv.addObject("listRgb", checkoutService.getRgbById_prod(id_prod));

		return mv;

	}

	@RequestMapping(value = { "cart/checkout-cart" })
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
				if (voucher != 0 ) {
					orderService.insertIntoOrder(fullname, email, phone_number, adr, voucher, note, method);
				} else {
					orderService.insertIntoOrder(fullname, email, phone_number, adr, 1, note, method);
				}
				Cookie orr[] = request.getCookies();
				for (String s : arr1) {
					String arr[] = s.split("_");
					int id_prod = Integer.parseInt(arr[0]);
					String color = arr[1];
					String size = arr[2];
					String quantity = arr[3];
					// insert and update sql
					//System.out.println(id_prod);

					order_detailsService.insertIntoOrder_details(productService.getProduct(id_prod).getPrice(),
							Integer.parseInt(quantity), id_prod, Integer.parseInt(size), Integer.parseInt(color));
					
					for (Cookie o : orr) {
						if (o.getName().equals("addtocart")) {
							String li_prod_txt = checkoutService.removeProductFromCartAfterCheckout(id_prod,
									o.getValue());
							
							
								System.out.println(o.getValue() + "==" + li_prod_txt);
								Cookie addtocart_new = new Cookie("addtocart", li_prod_txt);
								addtocart_new.setMaxAge(60*60*24*15);
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
}
