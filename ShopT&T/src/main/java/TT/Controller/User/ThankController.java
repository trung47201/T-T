package TT.Controller.User;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import TT.Model.Color;
import TT.Model.Receipt;
import TT.Model.Receipt_details;
import TT.Model.Product;
import TT.Model.Sizes;
import TT.Service.User.CheckoutService;
import TT.Service.User.ColorService;
import TT.Service.User.ReceiptService;
import TT.Service.User.Receipt_detailsService;
import TT.Service.User.SizeService;
import TT.Service.User.UserService;
import TT.Service.User.VoucherService;
import TT.Service.User.Product.ShoesService;

@Controller
public class ThankController {
	private CheckoutService checkoutService;
	private ColorService colorService;
	private SizeService sizeService;
	private ShoesService shoesService;
	private VoucherService voucherService;
	private UserService userService;
	private ReceiptService receiptService;
	private Receipt_detailsService receipt_detailsService;
	
	@RequestMapping(value = {"sucess-buynow"})
	public ModelAndView loadOrder(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView("user/re-sucess-buynow");
		shoesService = new ShoesService();
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
		String address = request.getParameter("address");
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
		
		Product p = shoesService.getProduct(Integer.parseInt(id_prod));
		if(voucher != null) {
			double discount = (double) voucherService.getDiscountById_Voucher(Integer.parseInt(voucher));
			
			if(p.getDiscount() > 0) {
				discount = (p.getPrice()* Integer.parseInt(quantity) - p.getPrice() * Integer.parseInt(quantity) * p.getDiscount()/100) * discount/100;
			} else {
				discount = (p.getPrice()* Integer.parseInt(quantity)) * discount/100;
			}
			mv.addObject("discount", discount);
		}
		System.out.println(address);
		mv.addObject("method", method);
		mv.addObject("price_at", price_at);
		mv.addObject("id_prod", id_prod);
		mv.addObject("id_color", id_color);
		mv.addObject("id_size", id_size);
		mv.addObject("quantity", quantity);
		mv.addObject("fullname", fullname);
		mv.addObject("phone_number", phone_number);
		mv.addObject("email", email);
		mv.addObject("address", address);
		mv.addObject("note", note);
		mv.addObject("product", shoesService.getProduct(Integer.parseInt(id_prod)));
		mv.addObject("color", colorService.getColorById(Integer.parseInt(id_color)).getRgb());
		mv.addObject("size", sizeService.getSizeById(Integer.parseInt(id_size)).getSize_number());
		mv.addObject("back_home", "home");
		return mv;
	}
	@RequestMapping(value = {"thank"})
	public ModelAndView loadSucessCart(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView("user/thank");
		shoesService = new ShoesService();
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
		
		HttpSession session = request.getSession();
		if(session.getAttribute("checkoutcartnotlogin") != null) {
			if(String.valueOf(session.getAttribute("checkoutcartnotlogin")).equals("start")) {
				session.setAttribute("checkoutcartnotlogin", "end");
				System.out.println("checkout cart not login: "+session.getAttribute("checkoutcartnotlogin")+"!");
			} else {
				System.out.println("checkout cart not login: "+session.getAttribute("checkoutcartnotlogin")+"!");			}
		}
		if(session.getAttribute("blockorderid") != null) {
			String blockid = String.valueOf(session.getAttribute("blockorderid"));
			if(!blockid.equals(id)) {
				return new ModelAndView("redirect: /ShopTandT/thank/"+blockid);
			}
		}
		
		receiptService = new ReceiptService();
		receipt_detailsService = new Receipt_detailsService();
		userService = new UserService();
		
		Receipt o = receiptService.get_all_order_by_order_id(Integer.parseInt(id));
		System.out.println(id);
		double vch = o.getDiscount_at();
		String fullname = o.getFullname();
		String phone_number = o.getPhone_number();
		String email = o.getEmail();
		String address = o.getAddress();
		String note = o.getNote();
		String method = o.getMethod();
		
		List<Receipt_details> li = receipt_detailsService.get_all_order_details_by_order_id(Integer.parseInt(id.trim()));
		double totalProd = 0;
		for (Receipt_details o_details : li) {
			System.out.println("li: "+o_details.getId());
			totalProd += o_details.getPrice_at() * o_details.getQuantity();
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
		
		int user_id = 0;
		Cookie cookie[] = request.getCookies();
		for (Cookie coo : cookie) {
			if(coo.getName().trim().equals("userID")) {
				user_id = Integer.parseInt(coo.getValue());
				
			}
		}
		if(user_id != 0) {
			String avatar = userService.getAvatarByUserID(user_id);
			mv.addObject("avatar", avatar);
			mv.addObject("userid", user_id);
		}
		return mv;
	}
	
}
