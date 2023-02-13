package TiShoes.Controller.User;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import TiShoes.Model.Color;
import TiShoes.Model.Product;
import TiShoes.Model.Sizes;
import TiShoes.Service.User.CheckoutService;
import TiShoes.Service.User.ColorService;
import TiShoes.Service.User.ProductService;
import TiShoes.Service.User.SizeService;

@Controller
public class ThankController {
	private CheckoutService checkoutService;
	private ColorService colorService;
	private SizeService sizeService;
	private ProductService productService;
	
	@RequestMapping(value = {"sucess-buynow"})
	public ModelAndView loadOrder(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView("user/sucess-buynow");
		productService = new ProductService();
		checkoutService = new CheckoutService();
		colorService = new ColorService();
		sizeService = new SizeService();
		
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
	
}
