package TT.Controller.Shipper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import TT.Model.User;
import TT.Service.Shipper.sOrderService;
import TT.Service.User.UserService;

@Controller
public class ShipperController {
	private UserService userService;
	private sOrderService sOrderService;

	@RequestMapping(value = { "/shipper" })
	public ModelAndView signup(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("shipper/shipper");
		userService = new UserService();
		sOrderService = new sOrderService();

		HttpSession session = request.getSession();

		if (session.getAttribute("shipperID") != null) {
			String id = String.valueOf(session.getAttribute("shipperID"));
			User u = userService.get_user_by_id(Integer.parseInt(id));
			mv.addObject("user", u);

			// goal today
			mv.addObject("percentofday", (sOrderService.get_order_today(u.getId()) * 100 / 70));

			// today order
			int order_yesterday = sOrderService.get_order_yesterday(u.getId());
			int order_today = sOrderService.get_order_today(u.getId());
			double percent_order_of_day = (double) order_today / order_yesterday * 100 - 100;
			mv.addObject("orderofday", order_today);
			mv.addObject("percentorderofday", (double) Math.round(percent_order_of_day * 10) / 10);
			// month order
			mv.addObject("orderofmonth", sOrderService.get_order_of_month(u.getId()));

			// today revenue
			double revenue_today = order_today * 0.5 + order_today / 30 * 0.5;
			double revenue_ytd = order_yesterday * 0.5 + order_yesterday / 30 * 0.5;
			double percent_revenue_of_day = (double) revenue_today / revenue_ytd * 100 - 100;
			mv.addObject("revenueofday", revenue_today);
			mv.addObject("percentrevenueofday", (double) Math.round(percent_revenue_of_day * 10) / 10);

			// month revenue
			int order_of_month = sOrderService.get_order_of_month(u.getId());
			System.out.println(order_of_month + "===" + order_of_month / 30 * 0.5);
			double revenue_of_month = order_of_month * 0.5 + order_of_month / 30 * 0.5;
			mv.addObject("revenueofmonth", revenue_of_month);
			
			mv.addObject("listdayname" , sOrderService.list_day_name_from_now());
			mv.addObject("listrevenueofweek", sOrderService.list_order_of_week_number(Integer.parseInt(id)));
			mv.addObject("listmonthname", sOrderService.list_month_name_from_now());
			mv.addObject("listrevenueofmonth", sOrderService.list_revenue_all_month_from_1_to_now(Integer.parseInt(id)));
		}

		return mv;
	}
}
