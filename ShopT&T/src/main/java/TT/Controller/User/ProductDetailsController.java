package TT.Controller.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import TT.Service.User.Color_sizeService;
import TT.Service.User.GalleryService;
import TT.Service.User.StyleService;
import TT.Service.User.UserService;
import TT.Service.User.Product.ProductService;

@Controller
public class ProductDetailsController {
	private ProductService productService;
	private GalleryService galleryService;
	private Color_sizeService color_sizeService;
	private UserService userService;
	private StyleService styleService;
	
	@RequestMapping(value = { "product-details" })
	public ModelAndView loadProducts(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("user/product_details");
		
		productService = new ProductService();
		galleryService = new GalleryService();
		color_sizeService = new Color_sizeService();
		styleService = new StyleService();

		
		String id_prod = String.valueOf(request.getParameter("product-id"));
		
		if (!color_sizeService.getAllSizeById_Prod(Integer.parseInt(id_prod)).isEmpty()) {
			mv.addObject("listSize", color_sizeService.getAllSizeById_Prod(Integer.parseInt(id_prod)));
		}
		if (!color_sizeService.getAllColorById_prod(Integer.parseInt(id_prod)).isEmpty()) {
			mv.addObject("listColor", color_sizeService.getAllColorById_prod(Integer.parseInt(id_prod)));
		}
		if (!galleryService.getAllGalleryByProductId(Integer.parseInt(id_prod)).isEmpty()) {
			mv.addObject("gallery", galleryService.getAllGalleryByProductId(Integer.parseInt(id_prod)));
		}
		
		mv.addObject("style", styleService.getAllStyle());
		mv.addObject("averageRating", productService.averageRating(Integer.parseInt(id_prod)));
		mv.addObject("product", productService.getProduct(Integer.parseInt(id_prod)));
		
		return mv;
	}
	
	@RequestMapping(value = { "product-details/{user_prod}" })
	public ModelAndView loadProducts(@PathVariable String user_prod, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("user/product_details");
		
		productService = new ProductService();
		galleryService = new GalleryService();
		color_sizeService = new Color_sizeService();
		userService = new UserService();
		styleService = new StyleService();

		
		String id_user = user_prod.split("_")[0];
		String id_prod = user_prod.split("_")[1];
		
		if (!color_sizeService.getAllSizeById_Prod(Integer.parseInt(id_prod)).isEmpty()) {
			mv.addObject("listSize", color_sizeService.getAllSizeById_Prod(Integer.parseInt(id_prod)));
		}
		if (!color_sizeService.getAllColorById_prod(Integer.parseInt(id_prod)).isEmpty()) {
			mv.addObject("listColor", color_sizeService.getAllColorById_prod(Integer.parseInt(id_prod)));
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
		
		return mv;
	}
}
