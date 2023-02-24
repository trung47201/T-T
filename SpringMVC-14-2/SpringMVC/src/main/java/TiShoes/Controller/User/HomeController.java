package TiShoes.Controller.User;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import TiShoes.Service.User.CartService;
import TiShoes.Service.User.Color_sizeService;
import TiShoes.Service.User.LoginService;
import TiShoes.Service.User.MD5Service;
import TiShoes.Service.User.NewsService;
import TiShoes.Service.User.ProductService;
import TiShoes.Service.User.SlidesService;
import TiShoes.Service.User.StyleService;
import TiShoes.Service.User.UserService;

@Controller
public class HomeController {
	
	private SlidesService slidesService;
	private ProductService productService;
	private NewsService newsService;
	private StyleService styleService;
	private LoginService loginService;
	private MD5Service md5Service;
	private CartService cartService;
	private Color_sizeService color_sizeService;
	private UserService userService;
	
	@RequestMapping(value = {"/{id}", "/home/{id}"})
	public ModelAndView loadHomeByUserID(@PathVariable String id, HttpServletRequest request, HttpServletResponse response){
		slidesService = new SlidesService();
		productService = new ProductService();
		newsService = new NewsService();
		styleService = new StyleService();
		loginService = new LoginService();
		cartService= new CartService();
		
		ModelAndView mv = new ModelAndView("user/index");
		String logout = String.valueOf(request.getParameter("logout"));
		
		if(logout.equals("true")) {
			Cookie oUserId = new Cookie("userID", "0");
			oUserId.setMaxAge(0);
			response.addCookie(oUserId);
			Cookie oMsg = new Cookie("messageLogin", "logout");
			oMsg.setMaxAge(30);
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
	@RequestMapping(value = {"/", "/home"})
	public ModelAndView loadHome(HttpServletRequest request, HttpServletResponse response){
		slidesService = new SlidesService();
		productService = new ProductService();
		newsService = new NewsService();
		styleService = new StyleService();
		loginService = new LoginService();
		md5Service = new MD5Service();
		color_sizeService = new Color_sizeService();
		cartService = new CartService();
		userService = new UserService();
		
		ModelAndView mv = new ModelAndView("user/index");
		
		List<String> li = null;
		String txt="";
		String addtocart = request.getParameter("add-to-cart");
		String username = String.valueOf(request.getParameter("username"));
		String password = String.valueOf(request.getParameter("password"));
		String logout = String.valueOf(request.getParameter("logout"));
		String rememberme = String.valueOf(request.getParameter("rememberme"));
		
		Cookie arr[] = request.getCookies();
		//add name available in cookie to check name in cookie then add to cart
		if (arr != null) {
			li = new ArrayList<>();
			for (Cookie o : arr) {
				li.add(o.getName());
			}
		}
		String userID = "";
		if (arr != null) {
			for (Cookie o : arr) {
				if (o.getName().equals("userID")) {
					userID = o.getValue();
				}
			}
		}
		if (!userID.equals("") && addtocart!=null) {
			int id_prod = color_sizeService.firstColor_SizeById_Prod(Integer.parseInt(addtocart));
			cartService.insertIntoCartDB(1, id_prod, Integer.valueOf(userID));
			userID = "redirect: cart/"+userID;
			return new ModelAndView(userID);
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
				if(loginService.checkStatucBlock(username, password)) {
					msg = "block";
					Cookie oMsg = new Cookie("messageLogin", msg.trim());
					oMsg.setMaxAge(30);
					response.addCookie(oMsg);
				} else {
					msg = "true";
					Cookie oMsg = new Cookie("messageLogin", msg.trim());
					oMsg.setMaxAge(30);
					response.addCookie(oMsg);
					Cookie oUser = new Cookie("usernameLogin", username.trim());
					oUser.setMaxAge(60*60*24*20);
					response.addCookie(oUser);
					Cookie oPass = new Cookie("passwordLogin", md5Service.StringToMD5(password.trim()).trim());
					oPass.setMaxAge(60*60*24*20);
					response.addCookie(oPass);
					Cookie oUserId = new Cookie("userID", String.valueOf(loginService.getIdUser(username, password)));
					oUserId.setMaxAge(60*60*24*20);
					response.addCookie(oUserId);
				}
			} else {
				msg = "false";
				Cookie oMsg = new Cookie("messageLogin", msg);
				oMsg.setMaxAge(30);
				response.addCookie(oMsg);
			}
		}
		
		String getRememberMe = "", getUsername="", getPassword="";
		if (arr != null) {
			for (Cookie o : arr) {
				if(o.getName().equals("messageLogin")) {
					mv.addObject("message", o.getValue());
					
				}
				if(o.getName().equals("userID")) {
					mv.addObject("userID", o.getValue().trim());
					if(!userService.getAvatarByUserID(Integer.parseInt(o.getValue().trim())).equals("")) {
						mv.addObject("avatar", userService.getAvatarByUserID(Integer.parseInt(o.getValue().trim())));
					}
				}
				if(li.contains("rememberme")) {
					if(o.getName().equals("rememberme")) {
						mv.addObject("rememberme", o.getValue().trim());
						getRememberMe = o.getValue();
					}
				}
				if(li.contains("usernameLogin")) {
					if(o.getName().equals("usernameLogin")) {
						getUsername = o.getValue();
					}
				}
				if(li.contains("passwordLogin")) {
					if(o.getName().equals("passwordLogin")) {
						getPassword = o.getValue();
					}
				}
			}
			
		}
		
		if(getRememberMe.equals("true")) {
			mv.addObject("username", getUsername.trim());
			mv.addObject("password", getPassword.trim());
		}
		
		if(logout.equals("true")) {
			Cookie oUserId = new Cookie("userID", "0");
			oUserId.setMaxAge(0);
			response.addCookie(oUserId);
			Cookie oMsg = new Cookie("messageLogin", "logout");
			oMsg.setMaxAge(30);
			response.addCookie(oMsg);
		}
		if(rememberme.equals("true")) {
			Cookie oRemember = new Cookie("rememberme", "true");
			oRemember.setMaxAge(60*60*24*20);
			response.addCookie(oRemember);
		} else if(rememberme.equals("false")) {
			Cookie oRemember = new Cookie("rememberme", "false");
			oRemember.setMaxAge(0);
			response.addCookie(oRemember);
		}
		if(arr!= null) {
			for (Cookie o : arr) {
				System.out.println(o.getName() +"==" + o.getValue());
			}
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
