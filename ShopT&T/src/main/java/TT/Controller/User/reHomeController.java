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
import TT.Service.User.Product.ProductService;
import TT.Service.User.Product.ShoesService;

@Controller
public class reHomeController {

	private SlidesService slidesService;
	private ShoesService shoesService;
	private aStatisticsService aStatisticsService;
	private PostsService postsService;
	private ProductService productService;
	

	@RequestMapping(value = { "/" })
	public ModelAndView load_home_without_id(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("user/re-index");
		postsService = new PostsService();
		slidesService = new SlidesService();
		shoesService = new ShoesService();
		aStatisticsService = new aStatisticsService();
		productService = new ProductService();
		
		
		String buy = request.getParameter("buynow");
		String blockid = request.getParameter("blockid");
		HttpSession session = request.getSession();
		if (buy != null) {
			session.setAttribute("order", "start");
		}
		if (blockid != null) {
			session.setAttribute("blockid", blockid);
			System.out.println("blockid: " + blockid);
		}

		if (!aStatisticsService.check_date_of_today_exist()) { // not exists
			aStatisticsService.insert_new_statistics();
		}
		
		if(session.getAttribute("favorite") != null) {
			String txt = String.valueOf(session.getAttribute("favorite"));
			System.out.println("a"+txt);
			mv.addObject("listProduct", productService.get_product_by_str(txt));
		}

		mv.addObject("slides", slidesService.getAllSlides());
		mv.addObject("listNewArrivals", shoesService.getNewArrivals());
		mv.addObject("listMostLovedProducts", shoesService.getMostLovedProducts());
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
