package TiShoes.Controller.Admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {
	@RequestMapping(value = {"/admin"})
	public ModelAndView loadHome(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView("admin/admin");
		return mv;
	}
}
