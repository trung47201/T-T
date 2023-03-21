package TT.Controller.User;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import TT.Service.User.StyleService;
import TT.Service.User.UserService;

@Controller
public class ContactController {
	private UserService userService;
	private StyleService styleService;
	
	@RequestMapping(value = {"contact"})
	public ModelAndView loadContact(){
		ModelAndView mv = new ModelAndView("user/contact");
		styleService = new StyleService();

		mv.addObject("style", styleService.getAllStyle());
		return mv;
	}
	
	@RequestMapping(value = {"contact/{id}"})
	public ModelAndView loadContactByUser(@PathVariable String id){
		ModelAndView mv = new ModelAndView("user/contact");
		
		styleService = new StyleService();
		userService = new UserService();
		
		mv.addObject("userID", id);
		mv.addObject("avatar", userService.getAvatarByUserID(Integer.parseInt(id)));
		mv.addObject("style", styleService.getAllStyle());
		return mv;
	}
	
}
