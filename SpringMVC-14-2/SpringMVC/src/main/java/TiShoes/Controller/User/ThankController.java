package TiShoes.Controller.User;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import TiShoes.Model.Color;
import TiShoes.Model.Order_;
import TiShoes.Model.Order_details;
import TiShoes.Model.Product;
import TiShoes.Model.Sizes;
import TiShoes.Service.User.CheckoutService;
import TiShoes.Service.User.ColorService;
import TiShoes.Service.User.OrderService;
import TiShoes.Service.User.Order_detailsService;
import TiShoes.Service.User.ProductService;
import TiShoes.Service.User.SizeService;
import TiShoes.Service.User.UserService;
import TiShoes.Service.User.VoucherService;

@Controller
public class ThankController {
	private CheckoutService checkoutService;
	private ColorService colorService;
	private SizeService sizeService;
	private ProductService productService;
	private VoucherService voucherService;
	private UserService userService;
	private OrderService orderService;
	private Order_detailsService order_detailsService;
	
	@RequestMapping(value = {"sucess-buynow"})
	public ModelAndView loadOrder(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView("user/sucess-buynow");
		productService = new ProductService();
		checkoutService = new CheckoutService();
		colorService = new ColorService();
		sizeService = new SizeService();
		voucherService = new VoucherService();
		userService = new UserService();
		
		String id_prod = request.getParameter("id_prod");
		String id_color = request.getParameter("id_color");
		String id_size = request.getParameter("id_size");
		String quantity = request.getParameter("quantity");
		String fullname = request.getParameter("fullname");
		String phone_number = request.getParameter("phone_number");
		String email = request.getParameter("email");
		String city = request.getParameter("city");
		String town = request.getParameter("town");
		String village = request.getParameter("village");
		String note = request.getParameter("note");
		String price_at = request.getParameter("priceat");
		String voucher = request.getParameter("voucher");
		String userID = request.getParameter("user");
		String method = request.getParameter("method");
		
		if(userID != null && !userID.equals("")) {
			mv.addObject("userID", userID);
			System.out.println(userID);
			String avatar = userService.getAvatarByUserID(Integer.parseInt(userID));
			mv.addObject("avatar", avatar);
		}
		
		Product p = productService.getProduct(Integer.parseInt(id_prod));
		if(voucher != null) {
			double discount = (double) voucherService.getDiscountById_Voucher(Integer.parseInt(voucher));
			
			if(p.getDiscount() > 0) {
				discount = (p.getPrice()* Integer.parseInt(quantity) - p.getPrice() * Integer.parseInt(quantity) * p.getDiscount()/100) * discount/100;
			} else {
				discount = (p.getPrice()* Integer.parseInt(quantity)) * discount/100;
			}
			mv.addObject("discount", discount);
		}
		
		mv.addObject("method", method);
		mv.addObject("price_at", price_at);
		mv.addObject("id_prod", id_prod);
		mv.addObject("id_color", id_color);
		mv.addObject("id_size", id_size);
		mv.addObject("quantity", quantity);
		mv.addObject("fullname", fullname);
		mv.addObject("phone_number", phone_number);
		mv.addObject("email", email);
		mv.addObject("city", city);
		mv.addObject("town", town);
		mv.addObject("village", village);
		mv.addObject("note", note);
		mv.addObject("freeship", note);
		mv.addObject("product", productService.getProduct(Integer.parseInt(id_prod)));
		mv.addObject("color", colorService.getColorById(Integer.parseInt(id_color)).getRgb());
		mv.addObject("size", sizeService.getSizeById(Integer.parseInt(id_size)).getSize_number());
		mv.addObject("back_home", "home");
		return mv;
	}
	@RequestMapping(value = {"thank"})
	public ModelAndView loadSucessCart(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView("user/thank");
		productService = new ProductService();
		checkoutService = new CheckoutService();
		colorService = new ColorService();
		sizeService = new SizeService();
		
		List<Product> li_prod = null;
		HashMap<Integer, Color> li_color = null;
		HashMap<Integer, Sizes> li_size = null;
		HashMap<Integer, Integer> li_amount = null;
		
		Double totalPayment = 0.0;
		
		String process = String.valueOf(request.getParameter("orders"));
		String you =String.valueOf(request.getParameter("you"));
		if (!process.equals("null") && !you.equals("null")) {
			li_prod = checkoutService.getListProductByString(process);
			li_color = checkoutService.getListColorByString(process);
			li_size = checkoutService.getListSizeByString(process);
			li_amount = checkoutService.getListAmountByString(process);
			totalPayment = checkoutService.getTotalPaymentByString(process);
		}
		
		String arr[] = you.split("\\+");
		
		String fullname = arr[0];
		String phone_number = arr[1];
		String email = arr[2];
		String address = arr[3];
		String note = arr[4];
		
		mv.addObject("fullname", fullname);
		mv.addObject("phone_number", phone_number);
		mv.addObject("email", email);
		mv.addObject("address", address);
		mv.addObject("note", note);
		mv.addObject("listProd", li_prod);
		mv.addObject("listColor", li_color);
		mv.addObject("listSize", li_size);
		mv.addObject("listAmount", li_amount);
		mv.addObject("totalPayment", totalPayment);
		mv.addObject("back_home", "home");
		
		return mv;
	}
	
	@RequestMapping(value = {"thank/{id}"})
	public ModelAndView loadSucessCart_user(@PathVariable String id, HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView("user/thank");
		
		orderService = new OrderService();
		order_detailsService = new Order_detailsService();
		
		Order_ o = orderService.get_all_order_by_order_id(Integer.parseInt(id));

		double vch = o.getDiscount_at();
		String fullname = o.getFullname();
		String phone_number = o.getPhone_number();
		String email = o.getEmail();
		String address = o.getAddress();
		String note = o.getNote();
		String method = o.getMethod();
		
		List<Order_details> li = order_detailsService.get_all_order_details_by_order_id(Integer.parseInt(id));
		double totalProd = 0;
		for (Order_details o_details : li) {
			totalProd += o_details.getPrice_at();
		}
		
		mv.addObject("totalProd", totalProd);
		mv.addObject("voucher", vch);
		mv.addObject("listOrder", li);
		mv.addObject("fullname", fullname);
		mv.addObject("phone_number", phone_number);
		mv.addObject("email", email);
		mv.addObject("address", address);
		mv.addObject("note", note);
		mv.addObject("method", method);
		mv.addObject("back_home", "home");
		
		return mv;
	}
	
}
