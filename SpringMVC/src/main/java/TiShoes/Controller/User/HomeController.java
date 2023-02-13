package TiShoes.Controller.User;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import TiShoes.Service.User.LoginService;
import TiShoes.Service.User.MD5Service;
import TiShoes.Service.User.NewsService;
import TiShoes.Service.User.ProductService;
import TiShoes.Service.User.SlidesService;
import TiShoes.Service.User.StyleService;

@Controller
public class HomeController {
	
	private SlidesService slidesService;
	private ProductService productService;
	private NewsService newsService;
	private StyleService styleService;
	private LoginService loginService;
	private MD5Service md5Service;
	
	@RequestMapping(value = {"/", "/home"})
	public ModelAndView loadHome(HttpServletRequest request, HttpServletResponse response){
		slidesService = new SlidesService();
		productService = new ProductService();
		newsService = new NewsService();
		styleService = new StyleService();
		loginService = new LoginService();
		md5Service = new MD5Service();
		
		
		ModelAndView mv = new ModelAndView("user/index");
		
		List<String> li = null;
		String txt="";
		String addtocart = request.getParameter("add-to-cart");
		String username = String.valueOf(request.getParameter("username"));
		String password = String.valueOf(request.getParameter("password"));
		String logout = String.valueOf(request.getParameter("logout"));
		
		
		Cookie arr[] = request.getCookies();
		//add name available in cookie to check name in cookie then add to cart
		if (arr != null) {
			li = new ArrayList<>();
			for (Cookie o : arr) {
				li.add(o.getName());
			}
		}
		// add product into cart from home
		if (arr != null) {
			for (Cookie o : arr) {
				if (o.getName().equals("addtocart")) {
					if (addtocart != null) {
						txt = o.getValue() + "/" + addtocart;
						Cookie cart = new Cookie("addtocart", txt);
						cart.setMaxAge(60*60*24);
						response.addCookie(cart);
						return new ModelAndView("redirect:/cart");
					}
					
				} else if (!li.contains("addtocart")) {
					if (addtocart != null) {
						Cookie cart = new Cookie("addtocart", addtocart);
						cart.setMaxAge(60*60*24);
						response.addCookie(cart);
						return new ModelAndView("redirect:/cart");
					}
				}
			}
		}
		
		String msg = "";
		if(!username.equals("null") && !password.equals("null")) {
			if(loginService.checkUserPass(username, password)) {
				msg = "true";
				Cookie oMsg = new Cookie("messageLogin", msg);
				oMsg.setMaxAge(60);
				response.addCookie(oMsg);
				Cookie oUser = new Cookie("usernameLogin", username);
				oUser.setMaxAge(60*60*24*10);
				response.addCookie(oUser);
				Cookie oPass = new Cookie("passwordLogin", password);
				oPass.setMaxAge(60*60*24*10);
				response.addCookie(oPass);
				Cookie oUserId = new Cookie("userID", String.valueOf(loginService.getIdUser(username, password)));
				oUserId.setMaxAge(60*60*24*10);
				response.addCookie(oUserId);
			} else {
				msg = "false";
				Cookie oMsg = new Cookie("messageLogin", msg);
				oMsg.setMaxAge(60);
				response.addCookie(oMsg);
			}
		}
		
		
		if (arr != null) {
			for (Cookie o : arr) {
				if(o.getName().equals("messageLogin")) {
					mv.addObject("message", o.getValue());
					
				}
				if(o.getName().equals("userID")) {
					mv.addObject("userID", o.getValue());
				}
//				if(o.getName().equals("messageLogin")) {
//					Cookie oMsg = new Cookie("messageLogin", msg);
//					oMsg.setMaxAge(0);
//					response.addCookie(oMsg);
//				}
				System.out.println(o.getName() +"="+o.getValue());
			}
			
		}
		if(logout.equals("true")) {
			Cookie oUserId = new Cookie("userID", "0");
			oUserId.setMaxAge(0);
			response.addCookie(oUserId);
			Cookie oMsg = new Cookie("messageLogin", "logout");
			oMsg.setMaxAge(60);
			response.addCookie(oMsg);
		}
		
		mv.addObject("style", styleService.getAllStyle());
		mv.addObject("slides", slidesService.getAllSlides());
		mv.addObject("listNewArrivals", productService.getNewArrivals());
		mv.addObject("listNewsHomeRight", newsService.getNewsHome());
		mv.addObject("listNewsHomeLeft", newsService.listNewsHomeLeft);
		mv.addObject("listMostLovedProducts", productService.getMostLovedProducts());
		
		return mv;
	}
	
	@RequestMapping(value = {"news"})
	public ModelAndView loadNews(){
		ModelAndView mv = new ModelAndView("user/news");
		return mv;
	}
	@RequestMapping(value = {"questions"})
	public ModelAndView loadQuestion(){
		ModelAndView mv = new ModelAndView("user/questions");
		return mv;
	}
	@RequestMapping(value = {"contact"})
	public ModelAndView loadContact(){
		ModelAndView mv = new ModelAndView("user/contact");
		return mv;
	}
	
	//reset cookie
//	if(arr!= null) {
//		for (Cookie o : arr) {
//			System.out.println(o.getName() +"==" + o.getValue());
//		}
//	}
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
