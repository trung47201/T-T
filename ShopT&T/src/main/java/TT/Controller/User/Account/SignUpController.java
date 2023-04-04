package TT.Controller.User.Account;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import TT.Service.Admin.aStatisticsService;
import TT.Service.Admin.aUserService;
import TT.Service.User.PostsService;

@Controller
public class SignUpController {
	private aUserService aUserService;
	private aStatisticsService statisticsService;
	private PostsService postsService;

	@RequestMapping(value = { "account/register" })
	public ModelAndView signup(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("user/re-signup");

		postsService = new PostsService();
		aUserService = new aUserService();
		statisticsService = new aStatisticsService();

		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String phone_number = request.getParameter("phonenumber");

		if (firstname != null && lastname != null && password != null && email != null && phone_number != null) {
			if (aUserService.existUser(email, phone_number)) {
				mv.addObject("message", "exist");
			} else {
				if (aUserService.insert(firstname, lastname, email, phone_number, "", "","", password, "", 2)) {
					System.out.println("Sign up success!");
					mv.addObject("message", "true");
					if (statisticsService.check_date_of_today_exist()) { // exists
						if (statisticsService.update_user_num_in_statistics_DB()) {
							System.out.println("Update user num in statistics DB success!");
						} else {
							System.out.println("Update user num in statistics DB unsuccess!");
						}
					} else { // not exists
						statisticsService.insert_new_statistics();
						if (statisticsService.update_user_num_in_statistics_DB()) {
							System.out.println("Update user num in statistics DB success!");
						} else {
							System.out.println("Update user num in statistics DB unsuccess!");
						}
					}
					return new ModelAndView("redirect: /ShopTandT/account/login");
				} else {
					System.out.println("Sign up unsuccess!");
					mv.addObject("message", "false");
				}
			}
		}
		
		mv.addObject("hmPosts", postsService.listPost());
		
		return mv;
	}
}
