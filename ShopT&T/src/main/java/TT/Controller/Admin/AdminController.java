package TT.Controller.Admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import TT.Service.Admin.aReceiptService;
import TT.Service.Admin.aStatisticsService;
import TT.Service.Admin.aUserService;

@Controller
public class AdminController {
	private aStatisticsService statisticsService;

	@RequestMapping(value = { "/admin" })
	public ModelAndView loadHome(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("admin/admin");

		statisticsService = new aStatisticsService();
		if (!statisticsService.check_date_of_today_exist()) { // not exists
			statisticsService.insert_new_statistics();
		}

		// ORDER
		// ================================================================================
		List<Integer> li_order = statisticsService.list_order_of_week_number();
		mv.addObject("listorderofweek", li_order);
		mv.addObject("orderofday", statisticsService.get_order_of_day_number());
		mv.addObject("percentorder", statisticsService.get_percent_order_of_day());
		int rs_order = statisticsService.get_update_history_order();
		if (rs_order >= 60 * 60 * 24) {
			rs_order = rs_order / (60 * 60 * 24);
			mv.addObject("orderDays", rs_order);
			System.out.println("d order: "+rs_order);
		} else if (rs_order >= 60 * 60) {
			rs_order = rs_order / (60 * 60);
			mv.addObject("orderHours", rs_order);
			System.out.println("h order: "+rs_order);
		} else if (rs_order >= 60) {
			rs_order = rs_order / (60);
			mv.addObject("orderMinute", rs_order);
			System.out.println("m order: "+rs_order);
		} else if (rs_order < 60) {
			mv.addObject("orderSeconds", rs_order);
			System.out.println("s order: "+rs_order);
		} else if (rs_order == 0) {
			mv.addObject("orderJust", 0);
			System.out.println("Just order: "+rs_order);
		}

		// PRODUCT
		// ================================================================================
		mv.addObject("productofday", statisticsService.get_product_of_day_number());
		mv.addObject("percentproduct", statisticsService.get_percent_product_of_day());

		// REVENUE
		// ================================================================================
		List<String> li_month_name = statisticsService.list_month_name_from_now();
		mv.addObject("listmonthname", li_month_name);
		List<Integer> li_revenue_of_month = statisticsService.list_revenue_all_month_from_1_to_now();
		mv.addObject("listrevenueofmonth", li_revenue_of_month);
		mv.addObject("revenueofday", statisticsService.get_revenue_of_day_number());
		mv.addObject("percentrevenue", statisticsService.get_percent_revenue_of_day());
		mv.addObject("revenueofmonth", statisticsService.get_revenue_of_this_month_number());
		mv.addObject("percentrevenuemonth", statisticsService.get_percent_revenue_of_month());
		int rs_revenue = statisticsService.get_update_history_revenue();
		if (rs_revenue >= 60 * 60 * 24) {
			rs_revenue = rs_revenue / (60 * 60 * 24);
			mv.addObject("revenueDays", rs_revenue);
			System.out.println("d revenue: "+rs_revenue);
		} else if (rs_revenue >= 60 * 60) {
			rs_revenue = rs_revenue / (60 * 60);
			mv.addObject("revenueHours", rs_revenue);
			System.out.println("h revenue: "+rs_revenue);
		} else if (rs_revenue >= 60) {
			rs_revenue = rs_revenue / (60);
			mv.addObject("revenueMinute", rs_revenue);
			System.out.println("m revenue: "+rs_revenue);
		} else if (rs_revenue < 60) {
			mv.addObject("revenueSeconds", rs_revenue);
			System.out.println("s revenue: "+rs_revenue);
		} else if (rs_revenue == 0) {
			mv.addObject("revenueJust", 0);
			System.out.println("Just revenue: "+rs_revenue);
		}
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
}
