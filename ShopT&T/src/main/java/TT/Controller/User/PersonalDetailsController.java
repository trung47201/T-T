package TT.Controller.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import TT.Model.User;
import TT.Service.User.SubCategoryService;
import TT.Service.User.UserService;

@Controller
public class PersonalDetailsController {
	private UserService userService;
	private SubCategoryService subCategoryService;

	@RequestMapping(value = { "/personal-details/{id}" })
	public ModelAndView loadHome(@PathVariable String id, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("user/personal_details");

		userService = new UserService();
		subCategoryService = new SubCategoryService();
		
		int id_ = Integer.parseInt(id);
		
		User u = userService.get_user_by_id(id_);
		
		String adr[] = u.getAddress().split("-");
		if (adr.length > 2) {
			String address = adr[0];
			String city = adr[1];
			String country = adr[2];
			mv.addObject("address", address.trim());
			mv.addObject("city", city.trim());
			mv.addObject("country", country.trim());
		}
		
		mv.addObject("user", u);
		mv.addObject("userID", id_);
		mv.addObject("user_id", id_);
		mv.addObject("avatar", userService.getAvatarByUserID(id_));
		mv.addObject("style", subCategoryService.getAllSubCategory());

		return mv;
	}
}
