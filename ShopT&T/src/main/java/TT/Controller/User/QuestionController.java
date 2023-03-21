package TT.Controller.User;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import TT.Service.User.StyleService;
import TT.Service.User.UserService;

@Controller
public class QuestionController {
	private UserService userService;
	private StyleService styleService;
	
	@RequestMapping(value = {"questions"})
	public ModelAndView loadQuestion(){
		ModelAndView mv = new ModelAndView("user/questions");
		
		styleService = new StyleService();
		mv.addObject("style", styleService.getAllStyle());
		return mv;
	}
	
	@RequestMapping(value = {"questions/{id}"})
	public ModelAndView loadQuestionByUser(@PathVariable String id){
		ModelAndView mv = new ModelAndView("user/questions");
		
		userService = new UserService();
		styleService = new StyleService();

		mv.addObject("userID", id);
		mv.addObject("avatar", userService.getAvatarByUserID(Integer.parseInt(id)));
		mv.addObject("style", styleService.getAllStyle());
		return mv;
	}
}
