package TT.Controller.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import TT.Service.User.ReceiptService;
import TT.Service.User.Receipt_detailsService;
import TT.Service.User.PostsService;
import TT.Service.User.SubCategoryService;
import TT.Service.User.UserService;


@Controller
public class ViewReceiptController {
	private UserService userService;
	private ReceiptService receiptService;
	private Receipt_detailsService receipt_detailsService;
	private SubCategoryService subCategoryService;
	private PostsService postsService;
	
	@RequestMapping(value = {"order/{id}"})
	public ModelAndView loadContact(@PathVariable String id, HttpServletRequest request,
			HttpServletResponse response){
		
		HttpSession session = request.getSession();
		if(session.getAttribute("receipt") != null) {
			String userid = String.valueOf(session.getAttribute("receipt"));
			if(!userid.equals(id)) {
				return new ModelAndView("redirect: /ShopTandT/order/"+userid);
			}
		} else {
			System.out.println("null");
		}
		
		ModelAndView mv = new ModelAndView("user/re-receipt");
		userService = new UserService();
		receiptService = new ReceiptService();
		receipt_detailsService = new Receipt_detailsService();
		subCategoryService = new SubCategoryService();
		postsService = new PostsService();
		
		if(receiptService.get_all_order_by_user_id(Integer.parseInt(id)).size() > 0) {
			mv.addObject("listReceipt", receiptService.get_all_order_by_user_id(Integer.parseInt(id)));
		}
		
		if(receipt_detailsService.get_all_order_details_by_user_id(Integer.parseInt(id)).size() > 0) {
			mv.addObject("listReceipt_detalis", receipt_detailsService.get_all_order_details_by_user_id(Integer.parseInt(id)));
		}
		
		mv.addObject("avatar", userService.getAvatarByUserID(Integer.parseInt(id)));
		mv.addObject("userID", id);
		mv.addObject("style", subCategoryService.getAllSubCategory());
		
		mv.addObject("hmPosts", postsService.listPost());
		return mv;
	}
}
