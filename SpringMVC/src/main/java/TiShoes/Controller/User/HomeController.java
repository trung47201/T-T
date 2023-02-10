package TiShoes.Controller.User;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
	
	@RequestMapping(value = {"/", "/home"})
	public ModelAndView loadHome(HttpServletRequest request, HttpServletResponse response){
		slidesService = new SlidesService();
		productService = new ProductService();
		newsService = new NewsService();
		styleService = new StyleService();
		
		ModelAndView mv = new ModelAndView("user/index");
		
		List<String> li = null;
		String txt="";
		String addtocart = request.getParameter("add-to-cart");
		Cookie arr[] = request.getCookies();
		if (arr != null) {
			li = new ArrayList<>();
			for (Cookie o : arr) {
				li.add(o.getName());
			}
		}
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
	
	
	
}
