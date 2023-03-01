package TiShoes.Controller.User;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import TiShoes.Service.User.OrderService;
import TiShoes.Service.User.Order_detailsService;
import TiShoes.Service.User.UserService;


@Controller
public class ViewOrderController {
	private UserService userService;
	private OrderService orderService;
	private Order_detailsService order_detailsService;
	
	@RequestMapping(value = {"order/{id}"})
	public ModelAndView loadContact(@PathVariable String id){
		ModelAndView mv = new ModelAndView("user/order");
		userService = new UserService();
		orderService = new OrderService();
		order_detailsService = new Order_detailsService();
		
		if(orderService.get_all_order_by_user_id(Integer.parseInt(id)).size() > 0) {
			mv.addObject("listOrder", orderService.get_all_order_by_user_id(Integer.parseInt(id)));
		}
		
		if(order_detailsService.get_all_order_details_by_user_id(Integer.parseInt(id)).size() > 0) {
			mv.addObject("listOrder_detalis", order_detailsService.get_all_order_details_by_user_id(Integer.parseInt(id)));
		}
		
		mv.addObject("avatar", userService.getAvatarByUserID(Integer.parseInt(id)));
		mv.addObject("userID", id);
		
		return mv;
	}
}
