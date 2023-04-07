package TT.Controller.Shipper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import TT.Model.User;
import TT.Service.User.UserService;

@Controller
public class ShipperController {
	private UserService userService;

	@RequestMapping(value = { "/shipper" })
	public ModelAndView signup(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("shipper/shipper");
		userService = new UserService();
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("shipperID") != null) {
			String id = String.valueOf(session.getAttribute("shipperID"));
			User u = userService.get_user_by_id(Integer.parseInt(id));
			mv.addObject("user", u);
		}
		
		return mv;
	}
}
