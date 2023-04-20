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
import TT.Service.User.SubCategoryService;
import TT.Service.User.UserService;
import TT.Service.User.Product.ProductService;

@Controller
public class rePersonalDetailsController {
	private UserService userService;
	private SubCategoryService subCategoryService;
	private PostsService postsService;

	@RequestMapping(value = { "/profile/{id}" })
	public ModelAndView loadHome(@PathVariable String id, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		if (session.getAttribute("profile") != null) {
			String userid = String.valueOf(session.getAttribute("profile"));
			if(!userid.equals(id)) {
				return new ModelAndView("redirect: /ShopTandT/profile/"+userid);
			}
		}
		ModelAndView mv = new ModelAndView("user/re-personal_details");
		postsService = new PostsService();
		userService = new UserService();
		subCategoryService = new SubCategoryService();
		
		int id_ = Integer.parseInt(id);
		
		User u = userService.get_user_by_id(id_);
		
		ProductService productService = new ProductService();
		if(session.getAttribute("favorite") != null) {
			String txt1 = String.valueOf(session.getAttribute("favorite"));
			System.out.println("a"+txt1);
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
}
