package TT.Controller.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import TT.Service.Admin.aStatisticsService;
import TT.Service.Admin.aUserService;

@Controller
public class SignUpController {
	private aUserService aUserService;
	private aStatisticsService statisticsService;

	@RequestMapping(value = { "sign-up" })
	public ModelAndView loadProducts(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("user/signup");
		
		aUserService = new aUserService();
		statisticsService = new aStatisticsService();
		
		String fullname = request.getParameter("fullname");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String phone_number = request.getParameter("phonenumber");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String town = request.getParameter("town");
		String adr = address + " - " + town + " - " + city;

		if(fullname != null && password != null && email != null && phone_number != null && address != null && city != null && town != null) {
			if (aUserService.existUser(email, phone_number)) {
				mv.addObject("message", "exist");
			} else {
				if(aUserService.insert(fullname, email, phone_number, adr, password, "", 2)) {
					System.out.println("Sign up success!");
					mv.addObject("message", "true");
					if(statisticsService.check_date_of_today_exist()) { // exists
						if(statisticsService.update_user_num_in_statistics_DB()) {
							System.out.println("Update user num in statistics DB success!");
						} else {
							System.out.println("Update user num in statistics DB unsuccess!");
						}
					} else { // not exists
						statisticsService.insert_new_statistics();
						if(statisticsService.update_user_num_in_statistics_DB()) {
							System.out.println("Update user num in statistics DB success!");
						} else {
							System.out.println("Update user num in statistics DB unsuccess!");
						}
					}
				} else {
					System.out.println("Sign up unsuccess!");
					mv.addObject("message", "false");
				}
			}
			
		}
		return mv;
	}
}
