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

import TiShoes.Model.Cart;
import TiShoes.Model.Product;
import TiShoes.Model.User;

public class PaymentService {
	private static final String CLIENT_ID = "Ab9hEluU0ckPAwAbNLhpJAzb3rvKFtHxQOnoF2wRk-IwScOcTK4g7aIVx6xIx6kM2STn2N_1dyBQR8mM";
	private static final String CLIENT_SECRET = "EG72j2PAsKci7RrsNgGTKhkbspj4Zl1pGNwaXMIo1ighuZUrxkFY6j3zCB71_lm8V8OKqk1IbgxTGr2q";
	private static final String MODE = "sandbox";
	
	private ProductService productService;
	private UserService userService;
	private CartService cartService;
	
	public String authorizePayment(String product, float voucher, float subtotal, int user_id, String cartid, String vccode) throws PayPalRESTException {
		userService = new UserService();
		Payer payer = getPayerInformation(userService.get_user_by_id(user_id));
		RedirectUrls redirectUrls = getRedirectURLs(user_id);
		List<Transaction> listTransaction = getTransactionInformation(product, voucher, subtotal, cartid, vccode);

		Payment requestPayment = new Payment();
		requestPayment.setTransactions(listTransaction);
		requestPayment.setRedirectUrls(redirectUrls);
		requestPayment.setPayer(payer);
		requestPayment.setIntent("authorize");

		APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);

		Payment approvedPayment = requestPayment.create(apiContext);
		return getApprovalLink(approvedPayment);
	}
	
	public String authorizePaymentBuyNow(String product, float voucher, float subtotal, int user_id, int cs, String vccode) throws PayPalRESTException {
		userService = new UserService();
		Payer payer = getPayerInformation(userService.get_user_by_id(user_id));
		RedirectUrls redirectUrls = getRedirectURLs(user_id);
		List<Transaction> listTransaction = getTransactionInformationBN(product, voucher, subtotal, cs, vccode);

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
	
	private List<Transaction> getTransactionInformation(String product, float voucher, float subtotal, String cartid, String vccode) {
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
	    
	    List<Cart> li = get_list_color_size_by_string(cartid);
	    
	    HashMap<Integer, String> hm = get_product_Id_and_quantity(product);
		for (Integer i : hm.keySet()) {
			Product p = productService.getProduct(i);
			Item item = new Item();
			for (Cart c : li) {
				if(c.getColor_size().getProd().getId() == p.getId()) {
					item.setDescription(String.valueOf(c.getId()));
				}
			}
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
	    	it_vc.setName("Voucher:" + vccode);
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
	
	private List<Transaction> getTransactionInformationBN(String product, float voucher, float subtotal, int cs, String vccode) {
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
			item.setDescription("cs"+String.valueOf(cs));
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
	    	it_vc.setName("Voucher:" + vccode);
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

	private RedirectUrls getRedirectURLs(int user_id) {
		RedirectUrls redirectUrls = new RedirectUrls();
		redirectUrls.setCancelUrl("http://localhost:8888/SpringMVC/products/"+user_id);
		redirectUrls.setReturnUrl("http://localhost:8888/SpringMVC/review_payment/"+user_id);
		return redirectUrls;
	}

	private Payer getPayerInformation(User u) {
		String arr[] = u.getFullname().split("\\s+");
		
		String firstname = arr[arr.length-1];
		String lastname = u.getFullname().replace(firstname, "").trim();
		
		Payer payer = new Payer();
		payer.setPaymentMethod("paypal");
		
		PayerInfo payerInfo = new PayerInfo();
		payerInfo.setFirstName(firstname);
		payerInfo.setLastName(lastname);
		payerInfo.setEmail(u.getEmail());

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
	
	
	public List<Cart> get_list_color_size_by_string(String cs) {
		cartService = new CartService();
		List<Cart> li = new ArrayList<>();
		String a[] = cs.split("_");
		for (String s : a) {
			if(!s.equals("")) {
				li.add(cartService.get_cart_by_cart_id(Integer.parseInt(s)));
			}
		}
		return li;
	}
}