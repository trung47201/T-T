package TT.Controller.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import TT.Model.User;
import TT.Service.User.PostsService;
import TT.Service.User.ProfileService;
import TT.Service.User.SubCategoryService;
import TT.Service.User.UserService;
import TT.Service.User.Product.ProductService;

@Controller
public class rePersonalDetailsController {
	private UserService userService;
	private SubCategoryService subCategoryService;
	private PostsService postsService;
	private ProfileService profileService;

	@RequestMapping(value = { "/profile/{id}" })
	public ModelAndView loadHome(@PathVariable String id, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		if (session.getAttribute("profile") != null) {
			String userid = String.valueOf(session.getAttribute("profile"));
			if (!userid.equals(id)) {
				return new ModelAndView("redirect: /ShopTandT/profile/" + userid);
			}
		}
		ModelAndView mv = new ModelAndView("user/re-personal_details");
		postsService = new PostsService();
		userService = new UserService();
		subCategoryService = new SubCategoryService();

		int id_ = Integer.parseInt(id);

		User u = userService.get_user_by_id(id_);

		ProductService productService = new ProductService();
		if (session.getAttribute("favorite") != null) {
			String txt1 = String.valueOf(session.getAttribute("favorite"));
			System.out.println("a" + txt1);
			mv.addObject("listProduct", productService.get_product_by_str(txt1));
		}
		mv.addObject("user", u);
		mv.addObject("userID", id_);
		mv.addObject("user_id", id_);
		mv.addObject("avatar", userService.getAvatarByUserID(id_));
		mv.addObject("style", subCategoryService.getAllSubCategory());
		mv.addObject("hmPosts", postsService.listPost());
		return mv;
	}

	@RequestMapping(value = { "/profile/block/{id}" })
	public ModelAndView block_user(@PathVariable String id, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("user/re-personal_details");

		HttpSession session = request.getSession();
		session.setAttribute("profile", id);

		return mv;
	}

	@RequestMapping(value = { "/profile/save-pw/{id}" })
	public ModelAndView save_pw(@PathVariable String id, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("user/re-personal_details");
		profileService = new ProfileService();
		userService = new UserService();
		String oldpw = request.getParameter("oldpw");
		String newpw = request.getParameter("newpw");
		HttpSession session = request.getSession();

		User u = userService.get_user_by_id(Integer.parseInt(id));
		if (oldpw != null && newpw != null) {
			if (profileService.check_pw(oldpw, u)) {
				if (profileService.update_pw(newpw, u)) {
					session.setAttribute("change", "pwtrue");
					return new ModelAndView("redirect: /ShopTandT/profile/" + id);
				}
			} else {
				session.setAttribute("change", "oldfalse");
				return new ModelAndView("redirect: /ShopTandT/profile/" + id);
			}
		}
		return mv;
	}

	@RequestMapping(value = { "/profile/save-intro/{id}" })
	public ModelAndView save_intro(@PathVariable String id, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("user/re-personal_details");

		return mv;
	}

	@RequestMapping(value = { "/profile/save-contact/{id}" })
	public ModelAndView save_contact(@PathVariable String id, HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("user/re-personal_details");
		profileService = new ProfileService();
		userService = new UserService();
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String phonenumber = request.getParameter("phonenumber");
		String email = request.getParameter("email");
		HttpSession session = request.getSession();
		User u = userService.get_user_by_id(Integer.parseInt(id));
		if (firstname != null && lastname != null && phonenumber != null && email != null) {
			if (profileService.update_contact(firstname, lastname, phonenumber, email, u)) {
				session.setAttribute("change", "contacttrue");
				return new ModelAndView("redirect: /ShopTandT/profile/" + id);
			}
		}
		return mv;
	}

	@RequestMapping(value = { "/profile/save-address/{id}" })
	public ModelAndView save_address(@PathVariable String id, HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("user/re-personal_details");
		profileService = new ProfileService();
		userService = new UserService();
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String district = request.getParameter("district");
		HttpSession session = request.getSession();
		User u = userService.get_user_by_id(Integer.parseInt(id));
		if (address != null && district != null && city != null) {
			if (profileService.update_address(address, district, city, u)) {
				session.setAttribute("change", "addresstrue");
				return new ModelAndView("redirect: /ShopTandT/profile/" + id);
			}
		}
		return mv;
	}

	@RequestMapping(value = { "/profile/save-change" })
	public ModelAndView save_change(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("user/re-personal_details");
		String change = request.getParameter("change");
		HttpSession session = request.getSession();
		System.out.println("heare");
		if (change != null) {
			session.setAttribute("change", "");
		}
		return mv;
	}
}
