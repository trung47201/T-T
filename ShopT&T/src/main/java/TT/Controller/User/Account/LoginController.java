package TT.Controller.User.Account;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import TT.Model.User;
import TT.Service.User.LoginService;
import TT.Service.User.PostsService;

@Controller
public class LoginController {
	private PostsService postsService;
	private LoginService loginService;

	@RequestMapping(value = { "account/login" })
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("user/login");

		postsService = new PostsService();
		loginService = new LoginService();

		HttpSession session = request.getSession();
		String username = request.getParameter("email");
		String password = request.getParameter("password");

		String msg = "";

		if (username != null && password != null) {
			if (loginService.checkUserPass(username, password)) {
				if (loginService.checkStatucBlock(username, password)) {
					msg = "block";
					mv.addObject("message", msg);
					System.out.println("login false: block");
				} else {
					System.out.println("login true");
					User u = loginService.get_user_by_username_password(username, password);
					session.setAttribute("userid", u.getId());
					session.setAttribute("avatar", u.getAvatar());
					session.setAttribute("fullname", u.getFullname());
					return new ModelAndView("redirect: /ShopT&T/");
				}
			} else {
				msg = "false";
				mv.addObject("message", msg);
				System.out.println("login false: incorrect");
			}
		}

		mv.addObject("hmPosts", postsService.listPost());
		return mv;
	}
}
