package TT.Controller.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import TT.Service.User.GalleryService;
import TT.Service.User.PostsService;
import TT.Service.User.Product_color_sizeService;
import TT.Service.User.StyleService;
import TT.Service.User.UserService;
import TT.Service.User.Product.ProductService;

@Controller
public class reProductDetailsController {
	private ProductService productService;
	private GalleryService galleryService;
	private Product_color_sizeService product_color_sizeService;
	private UserService userService;
	private StyleService styleService;
	private PostsService postsService;
	
	@RequestMapping(value = { "product-details" })
	public ModelAndView loadProducts(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("user/re-product_details");
		
		postsService = new PostsService();
		productService = new ProductService();
		galleryService = new GalleryService();
		product_color_sizeService = new Product_color_sizeService();
		styleService = new StyleService();
		
		String id_prod = String.valueOf(request.getParameter("product-id"));
		String buy = request.getParameter("buynow");
		if (buy != null) {
			HttpSession session = request.getSession();
			session.setAttribute("order", "start");
		}
		
		if (!product_color_sizeService.getAllSizeById_Prod(Integer.parseInt(id_prod)).isEmpty()) {
			mv.addObject("listSize", product_color_sizeService.getAllSizeById_Prod(Integer.parseInt(id_prod)));
		}
		if (!product_color_sizeService.getAllColorById_prod(Integer.parseInt(id_prod)).isEmpty()) {
			mv.addObject("listColor", product_color_sizeService.getAllColorById_prod(Integer.parseInt(id_prod)));
		}
		if (!galleryService.getAllGalleryByProductId(Integer.parseInt(id_prod)).isEmpty()) {
			mv.addObject("gallery", galleryService.getAllGalleryByProductId(Integer.parseInt(id_prod)));
		}
		
		mv.addObject("style", styleService.getAllStyle());
		mv.addObject("averageRating", productService.averageRating(Integer.parseInt(id_prod)));
		mv.addObject("product", productService.getProduct(Integer.parseInt(id_prod)));
		mv.addObject("hmPosts", postsService.listPost());
		return mv;
	}
	
	@RequestMapping(value = { "product-details/{user_prod}" })
	public ModelAndView loadProducts(@PathVariable String user_prod, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("user/re-product_details");
		postsService = new PostsService();
		productService = new ProductService();
		galleryService = new GalleryService();
		product_color_sizeService = new Product_color_sizeService();
		userService = new UserService();
		styleService = new StyleService();
		
		String id_user = user_prod.split("_")[0];
		String id_prod = user_prod.split("_")[1];
		String buy = request.getParameter("buynow");
		if (buy != null) {
			HttpSession session = request.getSession();
			session.setAttribute("order", "start");
		}
		
		if (!product_color_sizeService.getAllSizeById_Prod(Integer.parseInt(id_prod)).isEmpty()) {
			mv.addObject("listSize", product_color_sizeService.getAllSizeById_Prod(Integer.parseInt(id_prod)));
		}
		if (!product_color_sizeService.getAllColorById_prod(Integer.parseInt(id_prod)).isEmpty()) {
			mv.addObject("listColor", product_color_sizeService.getAllColorById_prod(Integer.parseInt(id_prod)));
		}
		if (!galleryService.getAllGalleryByProductId(Integer.parseInt(id_prod)).isEmpty()) {
			mv.addObject("gallery", galleryService.getAllGalleryByProductId(Integer.parseInt(id_prod)));
		}
		
		mv.addObject("averageRating", productService.averageRating(Integer.parseInt(id_prod)));
		mv.addObject("product", productService.getProduct(Integer.parseInt(id_prod)));
		
		if(id_user != null) {
			mv.addObject("userID", Integer.parseInt(id_user));
		}
		
		
		mv.addObject("style", styleService.getAllStyle());
		mv.addObject("avatar", userService.getAvatarByUserID(Integer.parseInt(id_user)));
		mv.addObject("user_prod", user_prod);
		mv.addObject("hmPosts", postsService.listPost());
		return mv;
	}
}
