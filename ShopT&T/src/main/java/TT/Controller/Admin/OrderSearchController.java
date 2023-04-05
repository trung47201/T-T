package TT.Controller.Admin;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import TT.Model.Receipt;
import TT.Service.Admin.aReceiptService;

@Controller
public class OrderSearchController {

	private aReceiptService _aReceiptService;

	@RequestMapping(value = { "/admin/search-order" })
	public ModelAndView loadSearch(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("admin/order-search");

		_aReceiptService = new aReceiptService();

		String search = request.getParameter("search");

		String sortby = request.getParameter("sortby");

		if (sortby != null) {
			if (sortby.equals("id-asc")) { // id-asc
				if (!_aReceiptService.sort_by_id_asc().isEmpty()) {
					mv.addObject("listOrder", _aReceiptService.sort_by_id_asc());
				}
			} else if (sortby.equals("id-desc")) { // id-desc
				if (!_aReceiptService.sort_by_id_desc().isEmpty()) {
					mv.addObject("listOrder", _aReceiptService.sort_by_id_desc());
				}
			} else if (sortby.equals("fullname-desc")) { // fullname-desc
				if (!_aReceiptService.sort_by_fullname_desc().isEmpty()) {
					mv.addObject("listOrder", _aReceiptService.sort_by_fullname_desc());
				}
			} else if (sortby.equals("fullname-asc")) { // fullname-asc
				if (!_aReceiptService.sort_by_fullname_asc().isEmpty()) {
					mv.addObject("listOrder", _aReceiptService.sort_by_fullname_asc());
				}
			} else if (sortby.equals("email-desc")) { // email-desc
				if (!_aReceiptService.sort_by_email_desc().isEmpty()) {
					mv.addObject("listOrder", _aReceiptService.sort_by_email_desc());
				}
			} else if (sortby.equals("email-asc")) { // email-asc
				if (!_aReceiptService.sort_by_email_asc().isEmpty()) {
					mv.addObject("listOrder", _aReceiptService.sort_by_email_asc());
				}
			} else if (sortby.equals("address-desc")) { // address-desc
				if (!_aReceiptService.sort_by_address_desc().isEmpty()) {
					mv.addObject("listOrder", _aReceiptService.sort_by_address_desc());
				}
			} else if (sortby.equals("address-asc")) { // address-asc
				if (!_aReceiptService.sort_by_address_asc().isEmpty()) {
					mv.addObject("listOrder", _aReceiptService.sort_by_address_asc());
				}
			} else if (sortby.equals("order-date-desc")) { // order-date-desc
				if (!_aReceiptService.sort_by_order_date_desc().isEmpty()) {
					mv.addObject("listOrder", _aReceiptService.sort_by_order_date_desc());
				}
			} else if (sortby.equals("order-date-asc")) { // order-date-asc
				if (!_aReceiptService.sort_by_order_date_asc().isEmpty()) {
					mv.addObject("listOrder", _aReceiptService.sort_by_order_date_asc());
				}
			} else if (sortby.equals("status-desc")) { // status-desc
				if (!_aReceiptService.sort_by_status_desc().isEmpty()) {
					mv.addObject("listOrder", _aReceiptService.sort_by_status_desc());
				}
			} else if (sortby.equals("status-asc")) { // status-asc
				if (!_aReceiptService.sort_by_status_asc().isEmpty()) {
					mv.addObject("listOrder", _aReceiptService.sort_by_status_asc());
				}
			}
		}

		if (search != null) {
			if (!_aReceiptService.search_order_by_string(search).isEmpty()) {
				mv.addObject("listOrder", _aReceiptService.search_order_by_string(search));
			}
		}

		if (search == null && sortby == null) {
			List<Receipt> li = _aReceiptService.getAllOrder();
			Collections.sort(li, new Comparator<Receipt>() {
				@Override
				public int compare(Receipt o1, Receipt o2) {
					return o2.getId()-o1.getId();
				}
			
			});
			mv.addObject("listOrder", li);
		}
		return mv;
	}
}
