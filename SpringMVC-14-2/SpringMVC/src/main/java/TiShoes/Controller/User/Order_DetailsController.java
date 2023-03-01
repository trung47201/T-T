package TiShoes.Controller.User;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import TiShoes.Model.Order_;
import TiShoes.Service.User.OrderService;
import TiShoes.Service.User.Order_detailsService;
import TiShoes.Service.User.UserService;

@Controller
public class Order_DetailsController {
	private UserService userService;
	private Order_detailsService order_detailsService;
	private OrderService orderService;
	
	
	@RequestMapping(value = { "order-details/{id}_{order_id}" })
	public ModelAndView loadContact(@PathVariable String id, @PathVariable String order_id) {
		ModelAndView mv = new ModelAndView("user/order_details");
		
		userService = new UserService();
		order_detailsService = new Order_detailsService();
		orderService = new OrderService();
		Order_ order_ = orderService.get_all_order_by_order_id(Integer.parseInt(order_id));
		if(order_ != null) {
			mv.addObject("order", order_);
			String name = "";
			String arr[] = order_.getFullname().trim().split("\\s+");
			for (String s : arr) {
				if(!s.equals("")) {
					name = s;
				}
			}
			if(!name.equals("")) {
				mv.addObject("nameUser", name);
			}
		}
		
		if (order_detailsService.get_all_order_details_by_order_id(Integer.parseInt(order_id)).size() > 0) {
			mv.addObject("listOrder_details", order_detailsService.get_all_order_details_by_order_id(Integer.parseInt(order_id)));
		}
		double voucher = order_detailsService.price_when_apply_voucher_by_order_id(Integer.parseInt(order_id));
		if(voucher > 0) {
			mv.addObject("voucher", voucher);
		}
		
		mv.addObject("totalPaid", order_detailsService.total_paid_by_order_id(Integer.parseInt(order_id)));
		mv.addObject("total", order_detailsService.total_order_by_id_order(Integer.parseInt(order_id)));
		mv.addObject("avatar", userService.getAvatarByUserID(Integer.parseInt(id)));
		mv.addObject("userID", id);

		return mv;
	}
}
