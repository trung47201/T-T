package TT.Controller.User.Account;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import TT.Service.User.PostsService;

@Controller
public class ForgotPassword {
	private PostsService postsService;
	
	@RequestMapping(value = { "account/forgot-password" })
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("user/re-forgot-password");
		
		postsService = new PostsService();
		
		mv.addObject("hmPosts", postsService.listPost());
		return mv;
	}
}
