package TiShoes.Controller.Admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import TiShoes.Service.Admin.StatisticsService;
import TiShoes.Service.Admin.aOrderService;
import TiShoes.Service.Admin.aUserService;

@Controller
public class AdminController {
	private aUserService aUserService;
	private StatisticsService statisticsService;

	@RequestMapping(value = { "/admin" })
	public ModelAndView loadHome(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("admin/admin");

		statisticsService = new StatisticsService();

		// ORDER
		// ================================================================================
		mv.addObject("orderofday", statisticsService.get_order_of_day_number());
		mv.addObject("percentorder", statisticsService.get_percent_order_of_day());

		// PRODUCT
		// ================================================================================
		mv.addObject("productofday", statisticsService.get_product_of_day_number());
		mv.addObject("percentproduct", statisticsService.get_percent_product_of_day());
		
		// REVENUE
		// ================================================================================
		mv.addObject("revenueofday", statisticsService.get_revenue_of_day_number());
		mv.addObject("percentrevenue", statisticsService.get_percent_revenue_of_day());

		// USER
		// ================================================================================
		mv.addObject("userofday", statisticsService.get_user_of_day_number());
		mv.addObject("percentuser", statisticsService.get_percent_user_of_day());
		
		// VIEW
		// ================================================================================
		mv.addObject("viewofday", statisticsService.get_view_of_day_number());
		mv.addObject("percentview", statisticsService.get_percent_view_of_day());
		
		return mv;
	}

	@RequestMapping(value = { "/admin/login" })
	public ModelAndView loadLogin(HttpServletRequest request, HttpServletResponse response) {
		aUserService = new aUserService();

		HttpSession session = request.getSession();

		String username = request.getParameter("username");
		String pw = request.getParameter("password");

		int adminID = 0;
		if (username != null && pw != null) {
			if (aUserService.check_login(username, pw) != 0) {
				adminID = aUserService.check_login(username, pw);
				session.setAttribute("adminID", adminID);
				session.setAttribute("login_t", true);
			} else {
				session.setAttribute("adminID", 0);
				session.setAttribute("login_t", false);
			}
		}
		return new ModelAndView("redirect: /SpringMVC/admin");
	}
}
