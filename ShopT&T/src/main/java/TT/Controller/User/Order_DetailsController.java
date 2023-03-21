package TT.Controller.User;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import TT.Model.Order_;
import TT.Model.Order_details;
import TT.Service.User.OrderService;
import TT.Service.User.Order_detailsService;
import TT.Service.User.StyleService;
import TT.Service.User.UserService;

@Controller
public class Order_DetailsController {
	private UserService userService;
	private Order_detailsService order_detailsService;
	private OrderService orderService;
	private StyleService styleService;

	@RequestMapping(value = { "order-details/{id}_{order_id}" })
	public ModelAndView loadContact(@PathVariable String id, @PathVariable String order_id) {
		ModelAndView mv = new ModelAndView("user/order_details");

		userService = new UserService();
		order_detailsService = new Order_detailsService();
		orderService = new OrderService();
		styleService = new StyleService();

		Order_ order_ = orderService.get_all_order_by_order_id(Integer.parseInt(order_id));
		if (order_ != null) {
			mv.addObject("order", order_);
			String name = "";
			String arr[] = order_.getFullname().trim().split("\\s+");
			for (String s : arr) {
				if (!s.equals("")) {
					name = s;
				}
			}
			if (!name.equals("")) {
				mv.addObject("nameUser", name);
			}
		}

		int status_id = orderService.get_status_id_by_order_id(Integer.parseInt(order_id));
		if (orderService.get_status_id_by_order_id(Integer.parseInt(order_id)) != 0) {
			mv.addObject("status", status_id);
		}
		if (order_detailsService.get_all_order_details_by_order_id(Integer.parseInt(order_id)).size() > 0) {
			mv.addObject("listOrder_details",
					order_detailsService.get_all_order_details_by_order_id(Integer.parseInt(order_id)));
		}
		for (Order_details i : order_detailsService.get_all_order_details_by_order_id(Integer.parseInt(order_id))) {
			System.out.println(i.getProd().getDiscount() + "--" + i.getProd().getId() + "==" + i.getOrder_().getId());
		}

		mv.addObject("totalPaid", order_detailsService.total_order_by_id_order(Integer.parseInt(order_id)));
		mv.addObject("total", order_detailsService.total_order_by_id_order(Integer.parseInt(order_id)));
		mv.addObject("avatar", userService.getAvatarByUserID(Integer.parseInt(id)));
		mv.addObject("userID", id);
		mv.addObject("userid", Integer.parseInt(id));
		mv.addObject("style", styleService.getAllStyle());

		return mv;
	}
}
