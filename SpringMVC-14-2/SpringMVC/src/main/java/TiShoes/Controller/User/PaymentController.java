package TiShoes.Controller.User;

import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.paypal.api.payments.Item;
import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.ShippingAddress;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.PayPalRESTException;

import TiShoes.Model.Cart;
import TiShoes.Model.Color_size;
import TiShoes.Service.User.CartService;
import TiShoes.Service.User.Color_sizeService;
import TiShoes.Service.User.PaymentService;
import TiShoes.Service.User.UserService;

@Controller
public class PaymentController {
	private UserService userService;
	private CartService cartService;
	private Color_sizeService color_sizeService;
	
	@RequestMapping(value = { "/payment" })
	public ModelAndView loadpayment(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("payment/payment");

		return mv;
	}

	@RequestMapping(value = { "/review_payment/{id}" })
	public ModelAndView load_execute_payment(@PathVariable String id, HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
		ModelAndView mv = new ModelAndView("payment/review");
		String paymentId = request.getParameter("paymentId");
		String payerId = request.getParameter("PayerID");

		cartService = new CartService();
		userService = new UserService();
		color_sizeService = new Color_sizeService();
		
		try {
			PaymentService paymentServices = new PaymentService();
			Payment payment = paymentServices.getPaymentDetails(paymentId);

			PayerInfo payerInfo = payment.getPayer().getPayerInfo();
			Transaction transaction = payment.getTransactions().get(0);
			ShippingAddress shippingAddress = transaction.getItemList().getShippingAddress();

			request.setAttribute("payer", payerInfo);
			request.setAttribute("transaction", transaction);
			request.setAttribute("shippingAddress", shippingAddress);
			
			request.setAttribute("phone", payerInfo.getPhone().replace("+84 ", "0"));
			
			String cartid = "";
			HashMap<Cart, Integer> liCS = new LinkedHashMap<>();
			for (Item it : transaction.getItemList().getItems()) {
				
					if(it.getDescription() != null) {
						if(it.getDescription().contains("cs")) {
							System.out.println(it.getDescription());
							Color_size c = color_sizeService.getByIdCS(Integer.parseInt(it.getDescription().replace("cs", "").trim()));
							mv.addObject("csprod", c);
							mv.addObject("quantity", it.getQuantity());
							mv.addObject("id", id+"_"+c.getProd().getId());
						} else {
							liCS.put(cartService.get_cart_by_cart_id(Integer.parseInt(it.getDescription())), Integer.parseInt(it.getQuantity()));
							cartid += it.getDescription()+"_";
						}
					}
					if(it.getName().contains("Voucher")) {
						mv.addObject("voucher", Double.parseDouble(it.getPrice().replace("-", "")));
						System.out.println("voucher: " + it.getPrice());
						mv.addObject("vccode", it.getName().replace("Voucher:", "").trim());
						System.out.println("vc code:" + it.getName().replace("Voucher:", "").trim());
					}
			}
			if(liCS.size() > 0) {
				request.setAttribute("listProd", liCS);
			}
			double total = Double.parseDouble(transaction.getAmount().getTotal());
			mv.addObject("total", total);
			mv.addObject("cartid", cartid);
		} catch (PayPalRESTException ex) {
			request.setAttribute("errorMessage", ex.getMessage());
			ex.printStackTrace();
		}
		String avt = userService.getAvatarByUserID(Integer.parseInt(id));
		mv.addObject("avatar", avt);
		mv.addObject("userID", Integer.parseInt(id));
		mv.addObject("back_home", "home");
		return mv;
	}

	@RequestMapping(value = { "/authorize_payment" })
	public void load_payment_paypal(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, PayPalRESTException {
		color_sizeService = new Color_sizeService();
		String product = request.getParameter("product"); // product = {id_prod_quantity}/{id_prod_quantity}/{id_prod_quantity}...
		String voucher = request.getParameter("vchprice");
		String total = request.getParameter("total");
		String user_id = request.getParameter("userid");
		String vccode = request.getParameter("vccode");
		String cartid = request.getParameter("cartid");
		
		String color = request.getParameter("color");
		String size = request.getParameter("size");
		
		if(voucher == null) {
			voucher="0";
		}
		if(user_id == null) {
			user_id = "1";
		}
		PaymentService paymentServices = new PaymentService();
		if(cartid != null && !cartid.equals("")) {
			String approvalLink = paymentServices.authorizePayment(product, Float.parseFloat(voucher), Float.parseFloat(total), Integer.parseInt(user_id), cartid, vccode);
			response.sendRedirect(approvalLink);
		} else {
				int cs = color_sizeService.get_Color_size_id(Integer.parseInt(size), Integer.parseInt(color), Integer.parseInt(product.split("_")[0]));
				String approvalLink = paymentServices.authorizePaymentBuyNow(product, Float.parseFloat(voucher), Float.parseFloat(total), Integer.parseInt(user_id), cs, vccode);
				response.sendRedirect(approvalLink);
				System.out.println(color +"-"+size);
		}
		
	}
}