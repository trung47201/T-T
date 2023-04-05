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

import com.google.zxing.qrcode.encoder.QRCode;

import TT.Model.Receipt;
import TT.Service.Admin.aReceiptService;
import TT.Service.Admin.aReceipt_detailsSevice;
import TT.Service.Admin.aStatusService;
import TT.Service.Shipper.QRCodeService;
import TT.Service.Shipper.sOrderService;
import TT.Service.User.Receipt_detailsService;

@Controller
public class sOrderManagementController {
	private aReceipt_detailsSevice _aOrder_detailsSevice;
	private Receipt_detailsService receipt_detailsService;
	private aStatusService _aStatusService;
	private sOrderService sOrderService;
	private aReceiptService _aReceiptService;
	private QRCodeService qrCodeService;

	@RequestMapping(value = { "/shipper/order-management" })
	public ModelAndView loadManagement(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("shipper/s-order");
		qrCodeService = new QRCodeService();
		sOrderService = new sOrderService();
		HttpSession session = request.getSession();

		String shipper_id = "";
		if(session.getAttribute("shipperID") != null ) {
			shipper_id = String.valueOf(session.getAttribute("shipperID"));
		}
		
		String id_order = request.getParameter("id_order");
		String ok = request.getParameter("ok");
		if (id_order != null && !shipper_id.equals("")) {
			sOrderService = new sOrderService();
			String qrcode = "";
			if(!sOrderService.check_exits_qr_code(Integer.parseInt(id_order))) {
				qrcode = qrCodeService.create_qr_code(id_order);
			}
			if(!qrcode.equals("")) {
				if (sOrderService.take_order(Integer.parseInt(id_order), Integer.parseInt(shipper_id), qrcode)) {
					session.setAttribute("takeorder", "true");
					System.out.println("takeorder: true");
				} else {
					session.setAttribute("takeorder", "false");
					System.out.println("takeorder: false");
				}
			} else {
				if (sOrderService.take_order(Integer.parseInt(id_order), Integer.parseInt(shipper_id), qrcode)) {
					session.setAttribute("takeorder", "true");
					System.out.println("takeorder: true");
				} else {
					session.setAttribute("takeorder", "false");
					System.out.println("takeorder: false");
				}
			}
		}
		if (ok != null) {
			session.setAttribute("takeorder", "none");
			System.out.println("takeorder: none");
		}

		mv.addObject("management", "true");
		mv.addObject("editorder", "false");
		mv.addObject("orderdetails", "false");
		List<Receipt> li = sOrderService.getAllOrder();
		Collections.sort(li, new Comparator<Receipt>() {
			@Override
			public int compare(Receipt o1, Receipt o2) {
				return o2.getId() - o1.getId();
			}

		});
		mv.addObject("listOrder", li);

		return mv;
	}

	@RequestMapping(value = { "/shipper/order-management/order-details" })
	public ModelAndView loadOrderDetails(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("shipper/s-order");

		_aReceiptService = new aReceiptService();
		_aOrder_detailsSevice = new aReceipt_detailsSevice();
		_aStatusService = new aStatusService();
		receipt_detailsService = new Receipt_detailsService();
		sOrderService = new sOrderService();
		
		String id_order = String.valueOf(request.getParameter("id_order"));
		if (!id_order.equals("null")) {
			Receipt o = _aReceiptService.getOrderByID(Integer.parseInt(id_order));
			if (_aReceiptService.getOrderByID(Integer.parseInt(id_order)) != null) {
				mv.addObject("orderById", o);
			}
			if (!_aOrder_detailsSevice.getOrder_detailsByIdOrder(Integer.parseInt(id_order)).isEmpty()) {
				mv.addObject("orderDetailsById",
						_aOrder_detailsSevice.getOrder_detailsByIdOrder(Integer.parseInt(id_order)));
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
		if (!sOrderService.getAllOrder().isEmpty()) {
			List<Receipt> li = sOrderService.getAllOrder();
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

}
