package TiShoes.Controller.Admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ShoesController {
	@RequestMapping(value = {"/admin/product"})
	public ModelAndView loadProduct(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView("admin/shoes");
		
		mv.addObject("product", "true");
		mv.addObject("colorSize", "false");
		mv.addObject("gallery", "false");
		mv.addObject("bsg", "false");
		return mv;
	}
	
	@RequestMapping(value = {"/admin/color-size"})
	public ModelAndView loadColorSize(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView("admin/shoes");
		
		mv.addObject("product", "false");
		mv.addObject("colorSize", "true");
		mv.addObject("gallery", "false");
		mv.addObject("bsg", "false");
		return mv;
	}
	
	@RequestMapping(value = {"/admin/gallery"})
	public ModelAndView loadGallery(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView("admin/shoes");
		
		mv.addObject("product", "false");
		mv.addObject("colorSize", "false");
		mv.addObject("gallery", "true");
		mv.addObject("bsg", "false");
		return mv;
	}
	
	@RequestMapping(value = {"/admin/brand-style-gender"})
	public ModelAndView loadBSG(HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = new ModelAndView("admin/shoes");
		
		mv.addObject("product", "false");
		mv.addObject("colorSize", "false");
		mv.addObject("gallery", "false");
		mv.addObject("bsg", "true");
		return mv;
	}
}
