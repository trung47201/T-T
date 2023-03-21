package TT.Controller.User;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import TT.Service.User.OrderService;
import TT.Service.User.Order_detailsService;
import TT.Service.User.StyleService;
import TT.Service.User.UserService;


@Controller
public class ViewOrderController {
	private UserService userService;
	private OrderService orderService;
	private Order_detailsService order_detailsService;
	private StyleService styleService;
	
	@RequestMapping(value = {"order/{id}"})
	public ModelAndView loadContact(@PathVariable String id){
		ModelAndView mv = new ModelAndView("user/order");
		userService = new UserService();
		orderService = new OrderService();
		order_detailsService = new Order_detailsService();
		styleService = new StyleService();

		
		if(orderService.get_all_order_by_user_id(Integer.parseInt(id)).size() > 0) {
			mv.addObject("listOrder", orderService.get_all_order_by_user_id(Integer.parseInt(id)));
		}
		
		if(order_detailsService.get_all_order_details_by_user_id(Integer.parseInt(id)).size() > 0) {
			mv.addObject("listOrder_detalis", order_detailsService.get_all_order_details_by_user_id(Integer.parseInt(id)));
		}
		
		mv.addObject("avatar", userService.getAvatarByUserID(Integer.parseInt(id)));
		mv.addObject("userID", id);
		mv.addObject("style", styleService.getAllStyle());
		return mv;
	}
}
