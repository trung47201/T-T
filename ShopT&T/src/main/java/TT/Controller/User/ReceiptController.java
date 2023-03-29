package TT.Controller.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import TT.Model.Receipt;
import TT.Service.Admin.aOrderService;
import TT.Service.User.ReceiptService;
import TT.Service.User.PostsService;
@Controller
public class ReceiptController {
	private ReceiptService receiptService;
	private aOrderService aOrderService;
	
	@RequestMapping(value = { "order/countermand/{id}" })
	public void countermand_order(@PathVariable String id) {
		receiptService = new ReceiptService();
		aOrderService = new aOrderService();
		Receipt o = receiptService.get_all_order_by_order_id(Integer.parseInt(id));
		if (o.getStatus().getId() == 1) {
			aOrderService.editStatusOrderById(Integer.parseInt(id), 6);
		} else {
			receiptService.confirm_request(Integer.parseInt(id));
		}
	}
	
	@RequestMapping(value = { "order/block/{id}" })
	public ModelAndView block_order(@PathVariable String id, HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("user/re-receipt");
		HttpSession session = request.getSession();
		session.setAttribute("receipt", id);
		System.out.println("receipt: " +id);
		return mv;
	}
	@RequestMapping(value = { "order-details/block/{id}" })
	public ModelAndView block_order_details(@PathVariable String id, HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("user/re-receipt");
		HttpSession session = request.getSession();
		session.setAttribute("viewreceipt", id);
		System.out.println("viewreceipt: " +id);
		return mv;
	}
}
