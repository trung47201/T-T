package TT.Controller.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import TT.Service.Admin.aStatisticsService;
import TT.Service.User.PostsService;
import TT.Service.User.SlidesService;
import TT.Service.User.StyleService;
import TT.Service.User.Product.ProductService;

@Controller
public class reHomeController {

	private SlidesService slidesService;
	private ProductService productService;
	private StyleService styleService;
	private aStatisticsService aStatisticsService;
	private PostsService postsService;

	@RequestMapping(value = { "/" })
	public ModelAndView load_home_without_id(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("user/re-index");
		postsService = new PostsService();
		slidesService = new SlidesService();
		productService = new ProductService();
		styleService = new StyleService();
		aStatisticsService = new aStatisticsService();
		
		String buy = request.getParameter("buynow");
		if (buy != null) {
			HttpSession session = request.getSession();
			session.setAttribute("order", "start");
		}

		if (!aStatisticsService.check_date_of_today_exist()) { // not exists
			aStatisticsService.insert_new_statistics();
		}

		mv.addObject("style", styleService.getAllStyle());
		mv.addObject("slides", slidesService.getAllSlides());
		mv.addObject("listNewArrivals", productService.getNewArrivals());
		mv.addObject("listMostLovedProducts", productService.getMostLovedProducts());
		mv.addObject("listPosts", postsService.getAllPosts());
		mv.addObject("hmPosts", postsService.listPost());

		return mv;
	}

	// reset cookie
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
