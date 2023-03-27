package TT.Controller.Admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import TT.Service.Admin.aUserService;

@Controller
public class aLoginController {
	
	private aUserService aUserService;
	
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
				session.setAttribute("msgLogin", "true");
				System.out.println("login_t: true");
			} else {
				session.setAttribute("adminID", 0);
				if(username.contains("@")) {
					session.setAttribute("msgLogin", "email");
					session.setMaxInactiveInterval(60);
				} else {
					session.setAttribute("msgLogin", "phone");
					session.setMaxInactiveInterval(60);
				}
				System.out.println("login_t: false");
			}
		}
		return new ModelAndView("redirect: /ShopTandT/admin");
	}
}
