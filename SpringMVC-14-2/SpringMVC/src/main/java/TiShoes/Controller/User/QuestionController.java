package TiShoes.Controller.User;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import TiShoes.Service.User.UserService;

@Controller
public class QuestionController {
	private UserService userService;
	
	@RequestMapping(value = {"questions"})
	public ModelAndView loadQuestion(){
		ModelAndView mv = new ModelAndView("user/questions");
		return mv;
	}
	
	@RequestMapping(value = {"questions/{id}"})
	public ModelAndView loadQuestionByUser(@PathVariable String id){
		ModelAndView mv = new ModelAndView("user/questions");
		
		userService = new UserService();
		
		
		mv.addObject("userID", id);
		mv.addObject("avatar", userService.getAvatarByUserID(Integer.parseInt(id)));
		return mv;
	}
}
