package TiShoes.Controller.Admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class OrderController {
	@RequestMapping(value = {"/admin/order-management"})
	public ModelAndView loadManagement(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView("admin/order");
		
		mv.addObject("management", "true");
		mv.addObject("search", "false");
		return mv;
	}
	
	@RequestMapping(value = {"/admin/search-order"})
	public ModelAndView loadSearch(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView("admin/order");
		
		String search = String.valueOf(request.getParameter("search"));
		
		if(!search.equals("null")) {
			System.out.println(search);
		}
		
		mv.addObject("search", "true");
		mv.addObject("management", "false");
		return mv;
	}
}
