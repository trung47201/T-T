package TiShoes.Controller.Admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import TiShoes.Service.Admin.aBSGService;
import TiShoes.Service.Admin.aGalleryService;
import TiShoes.Service.Admin.aProd_Color_SizeService;
import TiShoes.Service.User.ProductService;
import TiShoes.Service.User.UserService;

@Controller
public class ShoesController {
	
	private ProductService productService;
	private aProd_Color_SizeService aProd_Color_SizeService;
	private aGalleryService aGalleryService;
	private aBSGService aBSGService;
	private UserService userService;
	
	@RequestMapping(value = {"/admin/product"})
	public ModelAndView loadProduct(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView("admin/shoes");
		
		productService = new ProductService();
		
		mv.addObject("listProduct", productService.getAllProducts());
		
		mv.addObject("newProduct", "false");
		mv.addObject("product", "true");
		mv.addObject("colorSize", "false");
		mv.addObject("gallery", "false");
		mv.addObject("bsg", "false");
		
		return mv;
	}
	@RequestMapping(value = {"/admin/product/add-new-product"})
	public ModelAndView loadNewProduct(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		ModelAndView mv = new ModelAndView("admin/shoes");
		
		productService = new ProductService();
		aProd_Color_SizeService = new aProd_Color_SizeService();
		aBSGService = new aBSGService();
		
		userService = new UserService();
				
		String text = request.getParameter("filetag");
		if (text != null) {
			System.out.println(text);
		}
		mv.addObject("listUser", userService.getAllUser());
		mv.addObject("listBrand", aBSGService.getAllBrand());
		mv.addObject("listStyle", aBSGService.getAllStyle());
		mv.addObject("listGender", aBSGService.getAllGender());
		mv.addObject("listColor", aProd_Color_SizeService.getAllColor());
		mv.addObject("listSize", aProd_Color_SizeService.getAllSize());
		
		mv.addObject("listProduct", productService.getAllProducts());

		mv.addObject("newProduct", "true");
		mv.addObject("product", "false");
		mv.addObject("colorSize", "false");
		mv.addObject("gallery", "false");
		mv.addObject("bsg", "false");
		
		return mv;
	}
	
	@RequestMapping(value = {"/admin/color-size"})
	public ModelAndView loadColorSize(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView("admin/shoes");
		
		aProd_Color_SizeService = new aProd_Color_SizeService();
		
		mv.addObject("listPCS", aProd_Color_SizeService.getAllPCS());
		mv.addObject("listColor", aProd_Color_SizeService.getAllColor());
		mv.addObject("listSize", aProd_Color_SizeService.getAllSize());
		
		mv.addObject("newProduct", "false");
		mv.addObject("product", "false");
		mv.addObject("colorSize", "true");
		mv.addObject("gallery", "false");
		mv.addObject("bsg", "false");
		return mv;
	}
	
	@RequestMapping(value = {"/admin/gallery"})
	public ModelAndView loadGallery(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView("admin/shoes");
		
		aGalleryService = new aGalleryService();
		
		mv.addObject("listGallery", aGalleryService.getAllGallery());
		
		mv.addObject("newProduct", "false");
		mv.addObject("product", "false");
		mv.addObject("colorSize", "false");
		mv.addObject("gallery", "true");
		mv.addObject("bsg", "false");
		return mv;
	}
	
	@RequestMapping(value = {"/admin/brand-style-gender"})
	public ModelAndView loadBSG(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView("admin/shoes");
		
		aBSGService = new aBSGService();
		
		mv.addObject("listBrand", aBSGService.getAllBrand());
		mv.addObject("listStyle", aBSGService.getAllStyle());
		mv.addObject("listGender", aBSGService.getAllGender());
		
		mv.addObject("newProduct", "false");
		mv.addObject("product", "false");
		mv.addObject("colorSize", "false");
		mv.addObject("gallery", "false");
		mv.addObject("bsg", "true");
		return mv;
	}
}
