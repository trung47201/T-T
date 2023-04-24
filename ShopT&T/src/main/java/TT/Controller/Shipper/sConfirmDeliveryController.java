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
public class sConfirmDeliveryController {
	
	private sDeliveryService sDeliveryService;
	private StatisticsService statisticsService;
	private aReceipt_detailsSevice aReceipt_detailsSevice;
	@RequestMapping(value = { "shipper/confirm-delivery" })
	public ModelAndView delivery(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("shipper/s-confirm-delivery");
		return mv;
	}
	
	@RequestMapping(value = { "shipper/confirm-delivery/{id}" })
	public ModelAndView delivery_by_order_id(@PathVariable String id , HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("shipper/s-confirm-delivery");
		
		sDeliveryService = new sDeliveryService();
		statisticsService = new StatisticsService();
		aReceipt_detailsSevice = new aReceipt_detailsSevice();
		if(sDeliveryService.check_receipt(Integer.parseInt(id))) {
			if(sDeliveryService.delivered(Integer.parseInt(id))) {
				System.out.println("delivered: " + id);
				if (statisticsService.update_revenue_product_num_in_statistics_DB(aReceipt_detailsSevice.get_qty_product_by_order_id(Integer.parseInt(id)), aReceipt_detailsSevice.get_revenue_order_by_order_id(Integer.parseInt(id)))) {
					mv.addObject("delivered", "true");
				}
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
