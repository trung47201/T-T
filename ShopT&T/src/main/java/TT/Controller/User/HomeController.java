package TT.Controller.User;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import TT.Service.Admin.aStatisticsService;
import TT.Service.User.LoginService;
import TT.Service.User.PostsService;
import TT.Service.User.ProductService;
import TT.Service.User.SlidesService;
import TT.Service.User.StyleService;
import TT.Service.User.UserService;

@Controller
public class HomeController {
	
	private SlidesService slidesService;
	private ProductService productService;
	private StyleService styleService;
	private LoginService loginService;
	private UserService userService;
	private aStatisticsService aStatisticsService;
	private PostsService postsService;
	
	@RequestMapping(value = {"/"})
	public ModelAndView loadHome(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView("user/re-index");
		postsService = new PostsService();
		slidesService = new SlidesService();
		productService = new ProductService();
		styleService = new StyleService();
		loginService = new LoginService();
		userService = new UserService();
		aStatisticsService = new aStatisticsService();
		
		List<String> li = null;
		String username = String.valueOf(request.getParameter("username"));
		String password = String.valueOf(request.getParameter("password"));
		String logout = String.valueOf(request.getParameter("logout"));
		String rememberme = request.getParameter("rememberme");
		
		if(!aStatisticsService.check_date_of_today_exist()) { // not exists
			aStatisticsService.insert_new_statistics();
		}
		
		Cookie arr[] = request.getCookies();
		//add name available in cookie to check name in cookie then add to cart
		if (arr != null) {
			li = new ArrayList<>();
			for (Cookie o : arr) {
				li.add(o.getName());
			}
		}
		// login
		String msg = "";
		
		if(!username.equals("null") && !password.equals("null")) {
			String get_user_id = String.valueOf(loginService.getIdUser(username, password));
			if(loginService.checkUserPass(username, password)) {
				if(loginService.checkStatucBlock(username, password)) {
					msg = "block";
					mv.addObject("message", msg);
				} else {
					msg = "true";
					mv.addObject("message", msg);
					mv.addObject("userID", get_user_id);
					if(rememberme != null) {
						Cookie oUserId = new Cookie("userID", get_user_id);
						oUserId.setMaxAge(60*60*24*15);
						response.addCookie(oUserId);
						Cookie msgLogin = new Cookie("msgLogin", "true");
						msgLogin.setMaxAge(30);
						response.addCookie(msgLogin);
						System.out.println("login true - remember");
					} else {
						Cookie oUserId = new Cookie("userID", get_user_id);
						oUserId.setMaxAge(60*60*24);
						response.addCookie(oUserId);
						System.out.println("login true - not remember: "+username+ " - " + password);
						Cookie msgLogin = new Cookie("msgLogin", "true");
						msgLogin.setMaxAge(30);
						response.addCookie(msgLogin);
					}
					mv.addObject("avatar", userService.getAvatarByUserID(loginService.getIdUser(username, password)));
				}
			} else {
				msg = "false";	
				mv.addObject("message", msg);
				System.out.println("login false");
			}
		}
		
		if (arr != null) {
			for (Cookie o : arr) {
				if(o.getName().equals("userID")) {
					mv.addObject("userID", o.getValue().trim());
					if(!userService.getAvatarByUserID(Integer.parseInt(o.getValue().trim())).equals("")) {
						mv.addObject("avatar", userService.getAvatarByUserID(Integer.parseInt(o.getValue().trim())));
					}
				}
			}
		}
		
		if(logout.equals("true")) {
			if(arr!= null) {
				for (Cookie o : arr) {
					if(o.getName().equals("userID")) {
						o.setValue("");
						o.setMaxAge(0);
						response.addCookie(o);
					}
				}
			}
			mv.addObject("logout", "true");
		}
		//
		if(arr!= null) {
			for (Cookie o : arr) {
				System.out.println(o.getName()+"=="+o.getValue());
			}
		}
		
		mv.addObject("style", styleService.getAllStyle());
		mv.addObject("slides", slidesService.getAllSlides());
		mv.addObject("listNewArrivals", productService.getNewArrivals());
		mv.addObject("listMostLovedProducts", productService.getMostLovedProducts());
		mv.addObject("listPosts", postsService.getAllPosts());
		
		return mv;
	}
	
	
	//reset cookie
//	
//	for (Cookie o : arr) {
//		if (o.getName().equals("prod_size")) {
//			Cookie addtocartprod = new Cookie("prod_size", "6_6_1/5_19_12/4_6_1");
//			addtocartprod.setMaxAge(0);
//			response.addCookie(addtocartprod);
//		}
//	}
//	//color_product
//	for (Cookie o : arr) {
//		if (o.getName().equals("prod_color")) {
//			
//			Cookie addtocartprod = new Cookie("prod_color", "6_1/19_12/6_1");
//			addtocartprod.setMaxAge(0);
//			response.addCookie(addtocartprod);
//		}
//	}	
	
}
