package TT.Controller.Admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import TT.Service.Admin.aReceiptService;
import TT.Service.Admin.aReceipt_detailsSevice;
import TT.Service.Admin.aStatisticsService;
import TT.Service.Admin.aUserService;

@Controller
public class AdminController {
	private aStatisticsService statisticsService;
	private aReceipt_detailsSevice aReceipt_detailsSevice;

	@RequestMapping(value = { "/admin" })
	public ModelAndView loadHome(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("admin/admin");
		aReceipt_detailsSevice = new aReceipt_detailsSevice();
		statisticsService = new aStatisticsService();
		if (!statisticsService.check_date_of_today_exist()) { // not exists
			statisticsService.insert_new_statistics();
		}

		// ORDER
		// ================================================================================
		List<Integer> li_order = statisticsService.list_order_of_week_number();
		int t_order = 0;
		for (Integer i : li_order) {
			t_order += i;
		}
		mv.addObject("totalorderofweek", t_order);
		mv.addObject("listorderofweek", li_order);
		mv.addObject("listdaynamefromnow", statisticsService.list_day_name_from_now());
		mv.addObject("orderofday", statisticsService.get_order_of_day_number());
		mv.addObject("percentorder", statisticsService.get_percent_order_of_day());
		int rs_order = statisticsService.get_update_history_order();
		if (rs_order >= 60 * 60 * 24) {
			rs_order = rs_order / (60 * 60 * 24);
			mv.addObject("orderDays", rs_order);
			System.out.println("d order: " + rs_order);
		} else if (rs_order >= 60 * 60) {
			rs_order = rs_order / (60 * 60);
			mv.addObject("orderHours", rs_order);
			System.out.println("h order: " + rs_order);
		} else if (rs_order >= 60) {
			rs_order = rs_order / (60);
			mv.addObject("orderMinute", rs_order);
			System.out.println("m order: " + rs_order);
		} else if (rs_order < 60) {
			mv.addObject("orderSeconds", rs_order);
			System.out.println("s order: " + rs_order);
		} else if (rs_order == 0) {
			mv.addObject("orderJust", 0);
			System.out.println("Just order: " + rs_order);
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
			System.out.println("d revenue: " + rs_revenue);
		} else if (rs_revenue >= 60 * 60) {
			rs_revenue = rs_revenue / (60 * 60);
			mv.addObject("revenueHours", rs_revenue);
			System.out.println("h revenue: " + rs_revenue);
		} else if (rs_revenue >= 60) {
			rs_revenue = rs_revenue / (60);
			mv.addObject("revenueMinute", rs_revenue);
			System.out.println("m revenue: " + rs_revenue);
		} else if (rs_revenue < 60) {
			mv.addObject("revenueSeconds", rs_revenue);
			System.out.println("s revenue: " + rs_revenue);
		} else if (rs_revenue == 0) {
			mv.addObject("revenueJust", 0);
			System.out.println("Just revenue: " + rs_revenue);
		}
		// USER
		// ================================================================================
		mv.addObject("userofday", statisticsService.get_user_of_day_number());
		mv.addObject("percentuser", statisticsService.get_percent_user_of_day());

		// VIEW
		// ================================================================================
		mv.addObject("viewofday", statisticsService.get_view_of_day_number());
		mv.addObject("percentview", statisticsService.get_percent_view_of_day());

		int clothing = aReceipt_detailsSevice.get_all_order_clothing();
		int handbags = aReceipt_detailsSevice.get_all_order_handbags();
		int shoes = aReceipt_detailsSevice.get_all_order_shoes();
		int gifts = aReceipt_detailsSevice.get_all_order_gifts();
		int accessories = aReceipt_detailsSevice.get_all_order_accessrories();
		mv.addObject("clothing", clothing);
		mv.addObject("handbags", handbags);
		mv.addObject("shoes", shoes);
		mv.addObject("gifts", gifts);
		mv.addObject("accessories", accessories);
		int total_order = clothing + handbags + accessories + shoes + gifts;
		mv.addObject("totalorder", total_order);
		return mv;
	}
}
