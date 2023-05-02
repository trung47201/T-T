package TT.Controller.Shipper;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import TT.Model.Receipt;
import TT.Service.Shipper.sDeliveryService;
import TT.Service.Shipper.sOrderService;

@Controller
public class sOrderDeliveryController {

	private sDeliveryService _sDeliveryService;
	private sOrderService orderService;

	@RequestMapping(value = { "/shipper/profile/order" })
	public ModelAndView loadManagement(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("shipper/s-orders-delivery");
		HttpSession session = request.getSession();

		String shipper_id = "";
		if (session.getAttribute("shipperID") != null) {
			shipper_id = String.valueOf(session.getAttribute("shipperID"));
		}

		_sDeliveryService = new sDeliveryService();
		orderService = new sOrderService();
		String search = request.getParameter("search");
		String sortby = request.getParameter("sortby");

		if (sortby != null) {
			if (sortby.equals("id-asc")) { // id-asc
				if (!_sDeliveryService.sort_by_id_asc(Integer.parseInt(shipper_id)).isEmpty()) {
					mv.addObject("listOrder", _sDeliveryService.sort_by_id_asc(Integer.parseInt(shipper_id)));
				}
			} else if (sortby.equals("id-desc")) { // id-desc
				if (!_sDeliveryService.sort_by_id_desc(Integer.parseInt(shipper_id)).isEmpty()) {
					mv.addObject("listOrder", _sDeliveryService.sort_by_id_desc(Integer.parseInt(shipper_id)));
				}
			} else if (sortby.equals("fullname-desc")) { // fullname-desc
				if (!_sDeliveryService.sort_by_fullname_desc(Integer.parseInt(shipper_id)).isEmpty()) {
					mv.addObject("listOrder", _sDeliveryService.sort_by_fullname_desc(Integer.parseInt(shipper_id)));
				}
			} else if (sortby.equals("fullname-asc")) { // fullname-asc
				if (!_sDeliveryService.sort_by_fullname_asc(Integer.parseInt(shipper_id)).isEmpty()) {
					mv.addObject("listOrder", _sDeliveryService.sort_by_fullname_asc(Integer.parseInt(shipper_id)));
				}
			} else if (sortby.equals("email-desc")) { // email-desc
				if (!_sDeliveryService.sort_by_email_desc(Integer.parseInt(shipper_id)).isEmpty()) {
					mv.addObject("listOrder", _sDeliveryService.sort_by_email_desc(Integer.parseInt(shipper_id)));
				}
			} else if (sortby.equals("email-asc")) { // email-asc
				if (!_sDeliveryService.sort_by_email_asc(Integer.parseInt(shipper_id)).isEmpty()) {
					mv.addObject("listOrder", _sDeliveryService.sort_by_email_asc(Integer.parseInt(shipper_id)));
				}
			} else if (sortby.equals("address-desc")) { // address-desc
				if (!_sDeliveryService.sort_by_address_desc(Integer.parseInt(shipper_id)).isEmpty()) {
					mv.addObject("listOrder", _sDeliveryService.sort_by_address_desc(Integer.parseInt(shipper_id)));
				}
			} else if (sortby.equals("address-asc")) { // address-asc
				if (!_sDeliveryService.sort_by_address_asc(Integer.parseInt(shipper_id)).isEmpty()) {
					mv.addObject("listOrder", _sDeliveryService.sort_by_address_asc(Integer.parseInt(shipper_id)));
				}
			} else if (sortby.equals("order-date-desc")) { // order-date-desc
				if (!_sDeliveryService.sort_by_order_date_desc(Integer.parseInt(shipper_id)).isEmpty()) {
					mv.addObject("listOrder", _sDeliveryService.sort_by_order_date_desc(Integer.parseInt(shipper_id)));
				}
			} else if (sortby.equals("order-date-asc")) { // order-date-asc
				if (!_sDeliveryService.sort_by_order_date_asc(Integer.parseInt(shipper_id)).isEmpty()) {
					mv.addObject("listOrder", _sDeliveryService.sort_by_order_date_asc(Integer.parseInt(shipper_id)));
				}
			} else if (sortby.equals("status-desc")) { // status-desc
				if (!_sDeliveryService.sort_by_status_desc(Integer.parseInt(shipper_id)).isEmpty()) {
					mv.addObject("listOrder", _sDeliveryService.sort_by_status_desc(Integer.parseInt(shipper_id)));
				}
			} else if (sortby.equals("status-asc")) { // status-asc
				if (!_sDeliveryService.sort_by_status_asc(Integer.parseInt(shipper_id)).isEmpty()) {
					mv.addObject("listOrder", _sDeliveryService.sort_by_status_asc(Integer.parseInt(shipper_id)));
				}
			}
		}

		if (search != null) {
			if (!_sDeliveryService.search_order_by_string(search, Integer.parseInt(shipper_id)).isEmpty()) {
				mv.addObject("listOrder",
						_sDeliveryService.search_order_by_string(search, Integer.parseInt(shipper_id)));
				mv.addObject("search", search);
			}
		}

		if (search == null && sortby == null && !shipper_id.equals("")) {
			List<Receipt> li = orderService.get_all_by_shipper_id(Integer.parseInt(shipper_id));
			Collections.sort(li, new Comparator<Receipt>() {
				@Override
				public int compare(Receipt o1, Receipt o2) {
					return o2.getId() - o1.getId();
				}

			});
			mv.addObject("listOrder", li);
		}

		mv.addObject("keyword", search);
		return mv;
	}
}
