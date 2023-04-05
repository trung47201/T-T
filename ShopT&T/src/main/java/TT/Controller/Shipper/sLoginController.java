package TT.Controller.Shipper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import TT.Service.Admin.aUserService;
import TT.Service.Shipper.sLoginService;
import TT.Service.User.UserService;

@Controller
public class sLoginController {

	private sLoginService loginService;
	private UserService userService;
	@RequestMapping(value = { "shipper/login" })
	public ModelAndView signup(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("shipper/s-login");
		loginService = new sLoginService();
		userService = new UserService();
		HttpSession session = request.getSession();

		String username = request.getParameter("username");
		String pw = request.getParameter("password");
		
		int shipperID = 0;
		if (username != null && pw != null) {
			if (loginService.check_login(username, pw) != 0) {
				shipperID = loginService.check_login(username, pw);
				session.setAttribute("shipperID", shipperID);
				session.setAttribute("msgLoginShipper", "true");
				
				String avt = userService.getAvatarByUserID(shipperID);
				session.setAttribute("avatarshipper", avt);
				
				System.out.println("login_shipper: true");
				return new ModelAndView("redirect: /ShopTandT/shipper");
			} else {
				if(username.contains("@")) {
					session.setAttribute("msgLoginShipper", "email");
					session.setMaxInactiveInterval(60);
				} else {
					session.setAttribute("msgLoginShipper", "phone");
					session.setMaxInactiveInterval(60);
				}
				System.out.println("login_t: false");
			}
		}
		
		return mv;
	}
}
