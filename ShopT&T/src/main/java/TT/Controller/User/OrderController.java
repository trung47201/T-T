package TT.Controller.User;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import TT.Model.Order;
import TT.Service.Admin.aOrderService;
import TT.Service.User.OrderService;
@Controller
public class OrderController {
	private OrderService orderService;
	private aOrderService aOrderService;
	
	@RequestMapping(value = { "order/countermand/{id}" })
	public void countermand_order(@PathVariable String id) {
		orderService = new OrderService();
		aOrderService = new aOrderService();
		Order o = orderService.get_all_order_by_order_id(Integer.parseInt(id));
		if (o.getStatus().getId() == 1) {
			aOrderService.editStatusOrderById(Integer.parseInt(id), 6);
		} else {
			orderService.confirm_request(Integer.parseInt(id));
		}
	}
}
