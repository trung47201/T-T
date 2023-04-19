package TT.Controller.Admin;

import javax.servlet.http.Cookie;
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

	@RequestMapping(value = { "login" })
	public ModelAndView loadLogin(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("admin/login");
		aUserService = new aUserService();

		HttpSession session = request.getSession();
		Cookie arr[] = request.getCookies();
		
		String username = request.getParameter("username");
		String pw = request.getParameter("password");
		String id = request.getParameter("id");

		if (username != null && pw != null) {
			if (aUserService.check_login(username, pw) != 0) {
			} else {
				if (username.contains("@")) {
					session.setAttribute("msgLogin", "email");
					session.setMaxInactiveInterval(60);
				} else {
					session.setAttribute("msgLogin", "phone");
					session.setMaxInactiveInterval(60);
				}
				System.out.println("login_t: false");
			}
		}

		boolean check = false;
		if(arr != null) {
			for (Cookie o : arr) {
				if(o.getName().equals("adminID")) {
					check = true;
				}
			}
		}
		
		if(check) {
			for (Cookie o : arr) {
				if(o.getName().equals("adminID")) {
					id = o.getValue();
					session.setAttribute("msgLogin", "true");
					session.setAttribute("adminID", id);
					return new ModelAndView("redirect: /ShopTandT/admin");
				}
			}
		}
		
		if (id != null) {
			if(!check) {
				Cookie admin = new Cookie("adminID", id);
				admin.setMaxAge(60*60*24);
				response.addCookie(admin);
			}
			session.setAttribute("msgLogin", "true");
			session.setAttribute("adminID", id);
			return new ModelAndView("redirect: /ShopTandT/admin");
		}

		return mv;
	}
}
