package TiShoes.Controller.User;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import TiShoes.Service.User.UserService;


@Controller
public class ViewOrderController {
	private UserService userService;
	
	@RequestMapping(value = {"order/{id}"})
	public ModelAndView loadContact(@PathVariable String id){
		ModelAndView mv = new ModelAndView("user/order");
		userService = new UserService();
		
		mv.addObject("avatar", userService.getAvatarByUserID(Integer.parseInt(id)));
		mv.addObject("userID", id);
		
		return mv;
	}
}
