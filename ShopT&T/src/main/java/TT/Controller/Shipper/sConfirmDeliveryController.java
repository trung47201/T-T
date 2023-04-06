package TT.Controller.Shipper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import TT.Service.Shipper.sDeliveryService;

@Controller
public class sConfirmDeliveryController {
	
	private sDeliveryService sDeliveryService;

	@RequestMapping(value = { "shipper/confirm-delivery" })
	public ModelAndView delivery(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("shipper/s-confirm-delivery");
		return mv;
	}
	
	@RequestMapping(value = { "shipper/confirm-delivery/{id}" })
	public ModelAndView delivery_by_order_id(@PathVariable String id , HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("shipper/s-confirm-delivery");
		
		sDeliveryService = new sDeliveryService();
		
		if(sDeliveryService.check_receipt(Integer.parseInt(id))) {
			if(sDeliveryService.delivered(Integer.parseInt(id))) {
				System.out.println("delivered: " + id);
				mv.addObject("delivered", "true");
			} else {
				System.out.println("delivery unsuccess!");
				mv.addObject("delivered", "false");
			}
		} else {
			mv.addObject("delivered", "false");
		}
		
		return mv;
	}
}
