package TiShoes.Controller.Admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import TiShoes.Service.Admin.aOrderService;
import TiShoes.Service.Admin.aOrder_detailsSevice;
import TiShoes.Service.Admin.aStatusService;

@Controller
public class OrderController {
	private aOrderService _aOrderService;
	private aOrder_detailsSevice _aOrder_detailsSevice;
	private aStatusService _aStatusService;
	
	@RequestMapping(value = {"/admin/order-management"})
	public ModelAndView loadManagement(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView("admin/order");
		
		_aOrderService = new aOrderService();
		
		String id_order = String.valueOf(request.getParameter("id_order"));
		String status = String.valueOf(request.getParameter("status"));
		
		if(!id_order.equals("null") && !status.equals("null")) {
			if(_aOrderService.editStatusOrderById(Integer.parseInt(id_order), Integer.parseInt(status))) {
				System.out.println("Update status order success!");
			}
		}
		
		mv.addObject("management", "true");
		mv.addObject("search", "false");
		mv.addObject("editorder", "false");
		mv.addObject("orderdetails", "false");
		if(!_aOrderService.getAllOrder().isEmpty()) {
			mv.addObject("listOrder", _aOrderService.getAllOrder());
		}
		
		return mv;
	}
	
	@RequestMapping(value = {"/admin/order-management/edit-order"})
	public ModelAndView loadEditOrder(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView("admin/order");
		
		_aOrderService = new aOrderService();
		_aOrder_detailsSevice = new aOrder_detailsSevice();
		_aStatusService = new aStatusService();

		String id_order = String.valueOf(request.getParameter("id_order"));
		if(!id_order.equals("null")) {
			if(_aOrderService.getOrderByID(Integer.parseInt(id_order)) != null) {
				mv.addObject("orderById", _aOrderService.getOrderByID(Integer.parseInt(id_order)));
			}
			if(!_aOrder_detailsSevice.getOrder_detailsByIdOrder(Integer.parseInt(id_order)).isEmpty()) {
				mv.addObject("orderDetailsById", _aOrder_detailsSevice.getOrder_detailsByIdOrder(Integer.parseInt(id_order)));
			}
		}
		
		mv.addObject("management", "false");
		mv.addObject("search", "false");
		mv.addObject("editorder", "true");
		mv.addObject("orderdetails", "false");
		
		if(!_aOrderService.getAllOrder().isEmpty()) {
			mv.addObject("listOrder", _aOrderService.getAllOrder());
		}
		if(!_aStatusService.getAllStatus().isEmpty()) {
			mv.addObject("listStatus", _aStatusService.getAllStatus());
		}
		return mv;
	}
	
	@RequestMapping(value = {"/admin/order-management/order-details"})
	public ModelAndView loadOrderDetails(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView("admin/order");
		
		_aOrderService = new aOrderService();
		_aOrder_detailsSevice = new aOrder_detailsSevice();
		_aStatusService = new aStatusService();
		
		String id_order = String.valueOf(request.getParameter("id_order"));
		if(!id_order.equals("null")) {
			if(_aOrderService.getOrderByID(Integer.parseInt(id_order)) != null) {
				mv.addObject("orderById", _aOrderService.getOrderByID(Integer.parseInt(id_order)));
			}
			if(!_aOrder_detailsSevice.getOrder_detailsByIdOrder(Integer.parseInt(id_order)).isEmpty()) {
				mv.addObject("orderDetailsById", _aOrder_detailsSevice.getOrder_detailsByIdOrder(Integer.parseInt(id_order)));
			}
		}
		
		mv.addObject("management", "false");
		mv.addObject("search", "false");
		mv.addObject("editorder", "false");
		mv.addObject("orderdetails", "true");
		
		if(!_aOrderService.getAllOrder().isEmpty()) {
			mv.addObject("listOrder", _aOrderService.getAllOrder());
		}
		if(!_aStatusService.getAllStatus().isEmpty()) {
			mv.addObject("listStatus", _aStatusService.getAllStatus());
		}
		
		return mv;
	}
	
	@RequestMapping(value = {"/admin/search-order"})
	public ModelAndView loadSearch(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView("admin/order");
		
		_aOrderService = new aOrderService();
		String search = String.valueOf(request.getParameter("search"));
		
		if(!search.equals("null")) {
			System.out.println(search);
		}
		
		mv.addObject("search", "true");
		mv.addObject("management", "false");
		mv.addObject("editorder", "false");
		mv.addObject("orderdetails", "false");
		return mv;
	}
	
	
}
