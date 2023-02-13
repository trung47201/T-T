package TiShoes.Controller.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import TiShoes.Service.User.Color_sizeService;
import TiShoes.Service.User.GalleryService;
import TiShoes.Service.User.ProductService;

@Controller
public class ProductDetailsController {
	private ProductService productService;
	private GalleryService galleryService;
	private Color_sizeService color_sizeService;
	
	@RequestMapping(value = { "product-details" })
	public ModelAndView loadProducts(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("user/product_details");
		
		productService = new ProductService();
		galleryService = new GalleryService();
		color_sizeService = new Color_sizeService();
		
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
		
		mv.addObject("averageRating", productService.averageRating(Integer.parseInt(id_prod)));
		mv.addObject("product", productService.getProduct(Integer.parseInt(id_prod)));
		
		return mv;
	}
}
