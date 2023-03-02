package TiShoes.Controller.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import TiShoes.Service.Admin.aUserService;


@Controller
public class SignUpController {
	private aUserService aUserService;
	
	@RequestMapping(value = { "sign-up" })
	public ModelAndView loadProducts(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("user/signup");
		
		aUserService = new aUserService();
		
		String fullname = request.getParameter("fullname");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String phone_number = request.getParameter("phonenumber");
		String address = request.getParameter("address");
		
		if(fullname != null && password != null && email != null && phone_number != null && address != null) {
			if(aUserService.insert(fullname, email, phone_number, address, password, "", 2)) {
				System.out.println("Sign up success!");
			} else {
				System.out.println("Sign up unsuccess!");
			}
		}
		return mv;
	}
}
