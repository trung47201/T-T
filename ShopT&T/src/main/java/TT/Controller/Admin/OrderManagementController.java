package TT.Controller.Admin;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import TT.Model.Receipt;
import TT.Service.Admin.aReceiptService;
import TT.Service.Admin.aReceipt_detailsSevice;
import TT.Service.Admin.aStatusService;
import TT.Service.Shipper.QRCodeService;
import TT.Service.User.Receipt_detailsService;

@Controller
public class OrderManagementController {
	private aReceiptService _aReceiptService;
	private aReceipt_detailsSevice _aReceipt_detailsSevice;
	private aStatusService _aStatusService;
	private Receipt_detailsService receipt_detailsService;
	private QRCodeService qrCodeService;

	@RequestMapping(value = { "/admin/order-management" })
	public ModelAndView loadManagement(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("admin/order");

		_aReceiptService = new aReceiptService();
		qrCodeService = new QRCodeService();
		String id_order = String.valueOf(request.getParameter("id_order"));
		String status = String.valueOf(request.getParameter("status"));
		String bill = request.getParameter("bill");
		String endbill = request.getParameter("endbill");
		String print = request.getParameter("print");
		HttpSession session = request.getSession();
		if (bill != null) {
			session.setAttribute("bill", bill);
		}
		if (endbill != null) {
			session.setAttribute("bill", "false");
		}

		if (!id_order.equals("null") && !status.equals("null")) {
			if (_aReceiptService.editStatusOrderById(Integer.parseInt(id_order), Integer.parseInt(status))) {
				System.out.println("Update status order success!");
			}
		}
		if (print != null && bill != null) {
			String qrcode = qrCodeService.create_qr_code(bill);
			String barcode = qrCodeService.create_bar_code(bill);
			if (_aReceiptService.packing_generator_qrcode(Integer.parseInt(bill), qrcode, barcode)) {
				System.out.println("packing success!");
				return new ModelAndView("redirect: /ShopTandT/admin/order-management/bill/" + bill);
			} else {
				System.out.println("packing unsuccess!");
			}
		} else {
			System.out.println("packing null!");
		}
		mv.addObject("management", "true");
		mv.addObject("editorder", "false");
		mv.addObject("orderdetails", "false");
		List<Receipt> li = _aReceiptService.getAllOrder();
		Collections.sort(li, new Comparator<Receipt>() {
			@Override
			public int compare(Receipt o1, Receipt o2) {
				return o2.getId() - o1.getId();
			}

		});

		mv.addObject("listOrder", li);

		return mv;
	}

	@RequestMapping(value = { "/admin/order-management/edit-order" })
	public ModelAndView loadEditOrder(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("admin/order");

		_aReceiptService = new aReceiptService();
		_aReceipt_detailsSevice = new aReceipt_detailsSevice();
		_aStatusService = new aStatusService();
		receipt_detailsService = new Receipt_detailsService();

		String id_order = String.valueOf(request.getParameter("id_order"));
		if (!id_order.equals("null")) {
			Receipt o = _aReceiptService.getOrderByID(Integer.parseInt(id_order));
			if (_aReceiptService.getOrderByID(Integer.parseInt(id_order)) != null) {
				mv.addObject("orderById", o);
			}
			if (!_aReceipt_detailsSevice.getOrder_detailsByIdOrder(Integer.parseInt(id_order)).isEmpty()) {
				mv.addObject("orderDetailsById",
						_aReceipt_detailsSevice.getOrder_detailsByIdOrder(Integer.parseInt(id_order)));
			}
			double total = receipt_detailsService.total_order_by_id_order(Integer.parseInt(id_order));
			if (total < 50) {
				total = total + 11.0 - o.getDiscount_at();
				mv.addObject("total", (double) Math.round(total * 100) / 100);
			} else {
				mv.addObject("total", (double) Math.round((total - o.getDiscount_at()) * 100) / 100);
			}
		}

		mv.addObject("management", "false");
		mv.addObject("editorder", "true");
		mv.addObject("orderdetails", "false");
		List<Receipt> li = _aReceiptService.getAllOrder();
		Collections.sort(li, new Comparator<Receipt>() {
			@Override
			public int compare(Receipt o1, Receipt o2) {
				return o2.getId() - o1.getId();
			}

		});
		mv.addObject("listOrder", li);
		if (!_aStatusService.getAllStatus().isEmpty()) {
			mv.addObject("listStatus", _aStatusService.getAllStatus());
		}
		return mv;
	}

	@RequestMapping(value = { "/admin/order-management/order-details" })
	public ModelAndView loadOrderDetails(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("admin/order");

		_aReceiptService = new aReceiptService();
		_aReceipt_detailsSevice = new aReceipt_detailsSevice();
		_aStatusService = new aStatusService();
		receipt_detailsService = new Receipt_detailsService();

		String id_order = String.valueOf(request.getParameter("id_order"));
		if (!id_order.equals("null")) {
			Receipt o = _aReceiptService.getOrderByID(Integer.parseInt(id_order));
			if (_aReceiptService.getOrderByID(Integer.parseInt(id_order)) != null) {
				mv.addObject("orderById", o);
			}
			if (!_aReceipt_detailsSevice.getOrder_detailsByIdOrder(Integer.parseInt(id_order)).isEmpty()) {
				mv.addObject("orderDetailsById",
						_aReceipt_detailsSevice.getOrder_detailsByIdOrder(Integer.parseInt(id_order)));
			}
			double total = receipt_detailsService.total_order_by_id_order(Integer.parseInt(id_order));
			if (total < 50) {
				total = total + 11.0 - o.getDiscount_at();
				mv.addObject("total", (double) Math.round(total * 100) / 100);
			} else {
				mv.addObject("total", (double) Math.round((total - o.getDiscount_at()) * 100) / 100);
			}
		}

		mv.addObject("management", "false");
		mv.addObject("editorder", "false");
		mv.addObject("orderdetails", "true");
		if (!_aReceiptService.getAllOrder().isEmpty()) {
			List<Receipt> li = _aReceiptService.getAllOrder();
			Collections.sort(li, new Comparator<Receipt>() {
				@Override
				public int compare(Receipt o1, Receipt o2) {
					return o2.getId() - o1.getId();
				}

			});
			mv.addObject("listOrder", li);
		}
		if (!_aStatusService.getAllStatus().isEmpty()) {
			mv.addObject("listStatus", _aStatusService.getAllStatus());
		}
		return mv;
	}

	@RequestMapping(value = { "/admin/order-management/countermand/{id}" })
	public void countermand(@PathVariable String id) {
		_aReceiptService = new aReceiptService();
		if (_aReceiptService.editStatusOrderById(Integer.parseInt(id), 6)) {
			System.out.println("Countermand success! (order management controller)");
		} else {
			System.out.println("Countermand unsuccess! (order management controller)");
		}
	}

	@RequestMapping(value = { "/admin/order-management/bill/{id}" })
	public ModelAndView bill(@PathVariable String id, HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		if (session.getAttribute("bill") != null) {
			String bill = String.valueOf(session.getAttribute("bill"));
			if (bill.equals("") || bill.equals("false")) {
				return new ModelAndView("redirect: /ShopTandT/admin/order-management");
			}
		} else {
			return new ModelAndView("redirect: /ShopTandT/admin/order-management");
		}

		ModelAndView mv = new ModelAndView("admin/bill");

		_aReceiptService = new aReceiptService();
		_aReceipt_detailsSevice = new aReceipt_detailsSevice();
		_aStatusService = new aStatusService();
		receipt_detailsService = new Receipt_detailsService();

		String id_order = id;
		if (!id_order.equals("null")) {
			Receipt o = _aReceiptService.getOrderByID(Integer.parseInt(id_order));
			if (_aReceiptService.getOrderByID(Integer.parseInt(id_order)) != null) {
				mv.addObject("orderById", o);
			}
			if (!_aReceipt_detailsSevice.getOrder_detailsByIdOrder(Integer.parseInt(id_order)).isEmpty()) {
				mv.addObject("orderDetailsById",
						_aReceipt_detailsSevice.getOrder_detailsByIdOrder(Integer.parseInt(id_order)));
			}
			double total = receipt_detailsService.total_order_by_id_order(Integer.parseInt(id_order));
			if (total < 50) {
				total = total + 11.0 - o.getDiscount_at();
				mv.addObject("total", (double) Math.round(total * 100) / 100);
			} else {
				mv.addObject("total", (double) Math.round((total - o.getDiscount_at()) * 100) / 100);
			}
		}

		mv.addObject("orderid", id);
		return mv;
	}

	@RequestMapping(value = { "admin/packing" })
	public ModelAndView packing(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("admin/barcode");
		mv.addObject("packing", "true");
		return mv;
	}

	@RequestMapping(value = { "admin/shipping" })
	public ModelAndView shipping(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("admin/barcode");
		mv.addObject("shipping", "true");
		return mv;
	}

}
