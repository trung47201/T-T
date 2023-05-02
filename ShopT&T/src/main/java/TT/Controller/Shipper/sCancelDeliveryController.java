package TT.Controller.Shipper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import TT.Service.Admin.aReceipt_detailsSevice;
import TT.Service.Shipper.sDeliveryService;
import TT.Service.User.StatisticsService;

@Controller
public class sCancelDeliveryController {

	private sDeliveryService sDeliveryService;

	@RequestMapping(value = { "shipper/cancel-delivery" })
	public ModelAndView delivery(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("shipper/s-cancel-delivery");
		return mv;
	}

	@RequestMapping(value = { "shipper/cancel-delivery/{id}" })
	public ModelAndView delivery_by_order_id(@PathVariable String id, HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("shipper/s-cancel-delivery");

		sDeliveryService = new sDeliveryService();
		if (sDeliveryService.check_receipt(Integer.parseInt(id))) {
			if (sDeliveryService.canceled(Integer.parseInt(id))) {
				System.out.println("canceled unsuccess!");
			} else {
				System.out.println("canceled unsuccess!");
				mv.addObject("canceled", "false");
			}
		} else {
			mv.addObject("canceled", "false");
		}

		return mv;
	}
}
