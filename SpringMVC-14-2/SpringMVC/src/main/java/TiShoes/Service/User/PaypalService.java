package TiShoes.Service.User;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.paypal.api.payments.Amount;
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

import TiShoes.Model.Product;

public class PaypalService {
	private static final String CLIENT_ID = "Ab9hEluU0ckPAwAbNLhpJAzb3rvKFtHxQOnoF2wRk-IwScOcTK4g7aIVx6xIx6kM2STn2N_1dyBQR8mM";
	private static final String CLIENT_SECRET = "EG72j2PAsKci7RrsNgGTKhkbspj4Zl1pGNwaXMIo1ighuZUrxkFY6j3zCB71_lm8V8OKqk1IbgxTGr2q";
	private static final String MODE = "sandbox";
	
	private ProductService productService;

	public String authorizePayment(String product, float voucher, float subtotal) throws PayPalRESTException {
		Payer payer = getPayerInformation();
		RedirectUrls redirectUrls = getRedirectURLs();
		List<Transaction> listTransaction = getTransactionInformation(product, voucher, subtotal);

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
	
	private List<Transaction> getTransactionInformation(String product, float voucher, float subtotal) {
		productService = new ProductService();
		float total = subtotal;
		if(subtotal < 50) {
			total = total + 11;
		}
		if(voucher > 0) {
			total = total - voucher;
		}
	    Amount amount = new Amount();
	    amount.setCurrency("USD");
	    amount.setTotal(String.format("%.2f", total));

	    Transaction transaction = new Transaction();
	    transaction.setAmount(amount);
	    transaction.setDescription("Details");
	     
	    ItemList itemList = new ItemList();
	    List<Item> items = new ArrayList<>();
	     
	    HashMap<Integer, String> hm = get_product_Id_and_quantity(product);
		for (Integer i : hm.keySet()) {
			Product p = productService.getProduct(i);
			Item item = new Item();
		    item.setCurrency("USD");
		    item.setName(p.getTitle());
		    if(p.getDiscount() > 0) {
		    	item.setPrice(String.format("%.2f", p.getPrice() - p.getPrice()*p.getDiscount()/100));
		    } else {
		    	item.setPrice(String.format("%.2f", p.getPrice()));
		    }
		    item.setQuantity(hm.get(i));
		    items.add(item);
		}
	    
	    
	    Item item1 = new Item();
	    item1.setCurrency("USD");
	    item1.setName("Shipping charges");
	    item1.setPrice(String.format("%.2f", (float) 11));
	    item1.setQuantity("1");
	    
	    
	   
	    items.add(item1);
	    if(total >= 50 ) {
	    	Item item2 = new Item();
		    item2.setCurrency("USD");
		    item2.setName("Free ship");
		    item2.setPrice(String.format("%.2f", (float) -11));
		    item2.setQuantity("1");
		    items.add(item2);
	    }
	     
	    
	    if(voucher > 0) {
	    	// voucher
	    	Item it_vc = new Item();
	    	it_vc.setCurrency("USD");
	    	it_vc.setName("Voucher");
	    	it_vc.setPrice(String.format("%.2f", (float) -voucher));
	    	it_vc.setQuantity("1");
		    items.add(it_vc);
	    }
	   
	    
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

	public HashMap<Integer, String> get_product_Id_and_quantity (String s) {
		HashMap<Integer, String> hm = new HashMap<>();
		String arr[] = s.split("/");
		for (String p : arr) {
			if(!p.equals("")) {
				if(p.length() > 2) {
					hm.put(Integer.parseInt(p.split("_")[0]), p.split("_")[1]);
				}
			}
		}
		return hm;
	}
}