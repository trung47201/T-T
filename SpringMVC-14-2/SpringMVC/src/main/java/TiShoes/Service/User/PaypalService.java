package TiShoes.Service.User;

import java.util.ArrayList;
import java.util.List;

import com.paypal.api.payments.Amount;
import com.paypal.api.payments.Details;
import com.paypal.api.payments.Item;
import com.paypal.api.payments.ItemList;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payer;
import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.RedirectUrls;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;

public class PaypalService {
	private static final String CLIENT_ID = "Ab9hEluU0ckPAwAbNLhpJAzb3rvKFtHxQOnoF2wRk-IwScOcTK4g7aIVx6xIx6kM2STn2N_1dyBQR8mM";
	private static final String CLIENT_SECRET = "EG72j2PAsKci7RrsNgGTKhkbspj4Zl1pGNwaXMIo1ighuZUrxkFY6j3zCB71_lm8V8OKqk1IbgxTGr2q";
	private static final String MODE = "sandbox";

	public String authorizePayment(String product, float subtotal, float shipping, float tax, float total) throws PayPalRESTException {
		Payer payer = getPayerInformation();
		RedirectUrls redirectUrls = getRedirectURLs();
		List<Transaction> listTransaction = getTransactionInformation(product, subtotal, shipping, tax, total);

		Payment requestPayment = new Payment();
		requestPayment.setTransactions(listTransaction);
		requestPayment.setRedirectUrls(redirectUrls);
		requestPayment.setPayer(payer);
		requestPayment.setIntent("authorize");

		APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);

		Payment approvedPayment = requestPayment.create(apiContext);

		return getApprovalLink(approvedPayment);
	}
	
	private String getApprovalLink(Payment approvedPayment) {
	    List<Links> links = approvedPayment.getLinks();
	    String approvalLink = null;
	     
	    for (Links link : links) {
	        if (link.getRel().equalsIgnoreCase("approval_url")) {
	            approvalLink = link.getHref();
	            break;
	        }
	    }      
	    return approvalLink;
	}
	
	private List<Transaction> getTransactionInformation(String product, float subtotal, float shipping, float tax, float total) {
	    Details details = new Details();
	    details.setShipping(String.format("%.2f", shipping));
	    details.setSubtotal(String.format("%.2f", subtotal));
	    details.setTax(String.format("%.2f", tax));
	 
	    Amount amount = new Amount();
	    amount.setCurrency("USD");
	    amount.setTotal(String.format("%.2f", total));
	 	amount.setDetails(details);
	 

	    Transaction transaction = new Transaction();
	    transaction.setAmount(amount);
	    transaction.setDescription(product);
	     
	    ItemList itemList = new ItemList();
	    List<Item> items = new ArrayList<>();
	     
	    Item item = new Item();
	    item.setCurrency("USD");
	    item.setName(product);
	    item.setPrice(String.format("%.2f", subtotal));
	    item.setTax(String.format("%.2f", tax));
	    item.setQuantity("1");
	     
	    items.add(item);
	    itemList.setItems(items);
	    transaction.setItemList(itemList);
	 
	    List<Transaction> listTransaction = new ArrayList<>();
	    listTransaction.add(transaction);  
	     
	    return listTransaction;
	}

	private RedirectUrls getRedirectURLs() {
		RedirectUrls redirectUrls = new RedirectUrls();
		redirectUrls.setCancelUrl("http://localhost:8888/SpringMVC/cancel.html");
		redirectUrls.setReturnUrl("http://localhost:8888/SpringMVC/review_payment");
		return redirectUrls;
	}

	private Payer getPayerInformation() {
		Payer payer = new Payer();
		payer.setPaymentMethod("paypal");

		PayerInfo payerInfo = new PayerInfo();
		payerInfo.setFirstName("Trung");
		payerInfo.setLastName("Do");
		payerInfo.setEmail("dovantrung47201@gmail.com");

		payer.setPayerInfo(payerInfo);
		return payer;
	}
	
	public Payment getPaymentDetails(String paymentId) throws PayPalRESTException {
	    APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
	    return Payment.get(apiContext, paymentId);
	}

}