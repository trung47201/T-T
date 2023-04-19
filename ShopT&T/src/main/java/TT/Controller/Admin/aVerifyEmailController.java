package TT.Controller.Admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import TT.Service.Admin.aUserService;
import TT.Service.Mail.EmailService;

@Controller
public class aVerifyEmailController {
	private aUserService aUserService;
	private EmailService emailService;

	@RequestMapping(value = { "verify" })
	public ModelAndView loadLogin(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("admin/verify");

		aUserService = new aUserService();
		emailService = new EmailService();

		String username = request.getParameter("username");
		String pw = request.getParameter("password");
		if (username != null && pw != null) {
			if (aUserService.check_login(username, pw) != 0) {
				int adminID = aUserService.check_login(username, pw);
				emailService.sendEmail("dotr47201@gmail.com", "dovantrung47201@gmail.com", "Verify",
						"http://localhost:8888/ShopTandT/login?id="+adminID);
			} else {
				return new ModelAndView("redirect: /ShopTandT/login?username=" + username + "&password=" + pw);
			}
		}
		return mv;
	}
}
