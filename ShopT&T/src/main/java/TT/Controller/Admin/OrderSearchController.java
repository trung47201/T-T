package TT.Controller.Admin;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import TT.Model.Order;
import TT.Service.Admin.aOrderService;

@Controller
public class OrderSearchController {

	private aOrderService _aOrderService;

	@RequestMapping(value = { "/admin/search-order" })
	public ModelAndView loadSearch(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("admin/order-search");

		_aOrderService = new aOrderService();

		String search = request.getParameter("search");

		String sortby = request.getParameter("sortby");

		if (sortby != null) {
			if (sortby.equals("id-asc")) { // id-asc
				if (!_aOrderService.sort_by_id_asc().isEmpty()) {
					mv.addObject("listOrder", _aOrderService.sort_by_id_asc());
				}
			} else if (sortby.equals("id-desc")) { // id-desc
				if (!_aOrderService.sort_by_id_desc().isEmpty()) {
					mv.addObject("listOrder", _aOrderService.sort_by_id_desc());
				}
			} else if (sortby.equals("fullname-desc")) { // fullname-desc
				if (!_aOrderService.sort_by_fullname_desc().isEmpty()) {
					mv.addObject("listOrder", _aOrderService.sort_by_fullname_desc());
				}
			} else if (sortby.equals("fullname-asc")) { // fullname-asc
				if (!_aOrderService.sort_by_fullname_asc().isEmpty()) {
					mv.addObject("listOrder", _aOrderService.sort_by_fullname_asc());
				}
			} else if (sortby.equals("email-desc")) { // email-desc
				if (!_aOrderService.sort_by_email_desc().isEmpty()) {
					mv.addObject("listOrder", _aOrderService.sort_by_email_desc());
				}
			} else if (sortby.equals("email-asc")) { // email-asc
				if (!_aOrderService.sort_by_email_asc().isEmpty()) {
					mv.addObject("listOrder", _aOrderService.sort_by_email_asc());
				}
			} else if (sortby.equals("address-desc")) { // address-desc
				if (!_aOrderService.sort_by_address_desc().isEmpty()) {
					mv.addObject("listOrder", _aOrderService.sort_by_address_desc());
				}
			} else if (sortby.equals("address-asc")) { // address-asc
				if (!_aOrderService.sort_by_address_asc().isEmpty()) {
					mv.addObject("listOrder", _aOrderService.sort_by_address_asc());
				}
			} else if (sortby.equals("order-date-desc")) { // order-date-desc
				if (!_aOrderService.sort_by_order_date_desc().isEmpty()) {
					mv.addObject("listOrder", _aOrderService.sort_by_order_date_desc());
				}
			} else if (sortby.equals("order-date-asc")) { // order-date-asc
				if (!_aOrderService.sort_by_order_date_asc().isEmpty()) {
					mv.addObject("listOrder", _aOrderService.sort_by_order_date_asc());
				}
			} else if (sortby.equals("status-desc")) { // status-desc
				if (!_aOrderService.sort_by_status_desc().isEmpty()) {
					mv.addObject("listOrder", _aOrderService.sort_by_status_desc());
				}
			} else if (sortby.equals("status-asc")) { // status-asc
				if (!_aOrderService.sort_by_status_asc().isEmpty()) {
					mv.addObject("listOrder", _aOrderService.sort_by_status_asc());
				}
			}
		}

		if (search != null) {
			if (!_aOrderService.search_order_by_string(search).isEmpty()) {
				mv.addObject("listOrder", _aOrderService.search_order_by_string(search));
			}
		}

		if (search == null && sortby == null) {
			List<Order> li = _aOrderService.getAllOrder();
			Collections.sort(li, new Comparator<Order>() {
				@Override
				public int compare(Order o1, Order o2) {
					return o2.getId()-o1.getId();
				}
			
			});
			mv.addObject("listOrder", li);
		}
		return mv;
	}
}
