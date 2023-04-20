package TT.Controller.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import TT.Model.Receipt;
import TT.Model.Receipt_details;
import TT.Service.User.PostsService;
import TT.Service.User.ReceiptService;
import TT.Service.User.Receipt_detailsService;
import TT.Service.User.SubCategoryService;
import TT.Service.User.UserService;
import TT.Service.User.Product.ProductService;

@Controller
public class Receipt_DetailsController {
	private UserService userService;
	private Receipt_detailsService receipt_detailsService;
	private ReceiptService receiptService;
	private SubCategoryService subCategoryService;
	private PostsService postsService;

	@RequestMapping(value = { "order-details/{id}_{order_id}" })
	public ModelAndView loadContact(@PathVariable String id, @PathVariable String order_id, HttpServletRequest request,
			HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		if(session.getAttribute("viewreceipt") != null) {
			String orderid = String.valueOf(session.getAttribute("viewreceipt"));
			if(!orderid.equals(id+"_"+order_id)) {
				return new ModelAndView("redirect: /ShopTandT/order-details/"+orderid);
			}
		}
		
		ModelAndView mv = new ModelAndView("user/re-receipt_details");

		userService = new UserService();
		receipt_detailsService = new Receipt_detailsService();
		receiptService = new ReceiptService();
		subCategoryService = new SubCategoryService();
		postsService = new PostsService();
		Receipt receipt = receiptService.get_all_order_by_order_id(Integer.parseInt(order_id));
		if (receipt != null) {
			mv.addObject("order", receipt);
			String name = "";
			String arr[] = receipt.getFullname().trim().split("\\s+");
			for (String s : arr) {
				if (!s.equals("")) {
					name = s;
				}
			}
			if (!name.equals("")) {
				mv.addObject("nameUser", name);
			}
		}

		int status_id = receiptService.get_status_id_by_order_id(Integer.parseInt(order_id));
		if (receiptService.get_status_id_by_order_id(Integer.parseInt(order_id)) != 0) {
			mv.addObject("status", status_id);
		}
		if (receipt_detailsService.get_all_order_details_by_order_id(Integer.parseInt(order_id)).size() > 0) {
			mv.addObject("listOrder_details",
					receipt_detailsService.get_all_order_details_by_order_id(Integer.parseInt(order_id)));
		}
		for (Receipt_details i : receipt_detailsService.get_all_order_details_by_order_id(Integer.parseInt(order_id))) {
			System.out.println(i.getProd().getDiscount() + "--" + i.getProd().getId() + "==" + i.getReceipt().getId());
		}
		ProductService productService = new ProductService();
		if(session.getAttribute("favorite") != null) {
			String txt = String.valueOf(session.getAttribute("favorite"));
			System.out.println("a"+txt);
			mv.addObject("listProduct", productService.get_product_by_str(txt));
		}
		mv.addObject("totalPaid", receipt_detailsService.total_order_by_id_order(Integer.parseInt(order_id)));
		mv.addObject("total", receipt_detailsService.total_order_by_id_order(Integer.parseInt(order_id)));
		mv.addObject("avatar", userService.getAvatarByUserID(Integer.parseInt(id)));
		mv.addObject("userID", id);
		mv.addObject("userid", Integer.parseInt(id));
		mv.addObject("style", subCategoryService.getAllSubCategory());
		mv.addObject("hmPosts", postsService.listPost());
		return mv;
	}
}
