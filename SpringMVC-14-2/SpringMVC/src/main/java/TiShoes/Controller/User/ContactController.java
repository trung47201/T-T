package TiShoes.Controller.User;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import TiShoes.Service.User.UserService;

@Controller
public class ContactController {
	private UserService userService;
	
	@RequestMapping(value = {"contact"})
	public ModelAndView loadContact(){
		ModelAndView mv = new ModelAndView("user/contact");
		return mv;
	}
	
	@RequestMapping(value = {"contact/{id}"})
	public ModelAndView loadContactByUser(@PathVariable String id){
		ModelAndView mv = new ModelAndView("user/contact");
		
		userService = new UserService();
		
		mv.addObject("userID", id);
		mv.addObject("avatar", userService.getAvatarByUserID(Integer.parseInt(id)));
		return mv;
	}
	
}
