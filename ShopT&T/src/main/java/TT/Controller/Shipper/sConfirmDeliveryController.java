package TT.Controller.Shipper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class sConfirmDeliveryController {

	@RequestMapping(value = { "shipper/confirm-delivery" })
	public ModelAndView delivery(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("shipper/s-confirm-delivery");
		return mv;
	}
	
	@RequestMapping(value = { "shipper/confirm-delivery/{id}" })
	public ModelAndView delivery_by_order_id(@PathVariable String id , HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("shipper/s-confirm-delivery");
		return mv;
	}
}
