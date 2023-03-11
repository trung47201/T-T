package TiShoes.Controller.User;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.ShippingAddress;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.PayPalRESTException;

import TiShoes.Service.User.PaypalService;

@Controller
public class PaymentController {
	@RequestMapping(value = { "/payment" })
	public ModelAndView loadpayment(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("payment/payment");

		return mv;
	}

	@RequestMapping(value = { "/review_payment" })
	public ModelAndView load_execute_payment(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
		ModelAndView mv = new ModelAndView("payment/review");
		String paymentId = request.getParameter("paymentId");
		String payerId = request.getParameter("PayerID");

		try {
			PaypalService paymentServices = new PaypalService();
			Payment payment = paymentServices.getPaymentDetails(paymentId);

			PayerInfo payerInfo = payment.getPayer().getPayerInfo();
			Transaction transaction = payment.getTransactions().get(0);
			ShippingAddress shippingAddress = transaction.getItemList().getShippingAddress();

			request.setAttribute("payer", payerInfo);
			request.setAttribute("transaction", transaction);
			request.setAttribute("shippingAddress", shippingAddress);
			 
		} catch (PayPalRESTException ex) {
			request.setAttribute("errorMessage", ex.getMessage());
			ex.printStackTrace();
		}
		return mv;
	}

	@RequestMapping(value = { "/authorize_payment" })
	public void load_payment_paypal(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, PayPalRESTException {
		String product = request.getParameter("product");
		String subtotal = request.getParameter("subtotal");
		String shipping = request.getParameter("shipping");
		String tax = request.getParameter("tax");
		String total = request.getParameter("total");

		PaypalService paymentServices = new PaypalService();
		String approvalLink = paymentServices.authorizePayment(product, Float.parseFloat(subtotal),
				Float.parseFloat(shipping), Float.parseFloat(tax), Float.parseFloat(total));
		response.sendRedirect(approvalLink);
	}
}