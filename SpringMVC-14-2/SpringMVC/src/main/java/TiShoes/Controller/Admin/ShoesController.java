package TiShoes.Controller.Admin;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import TiShoes.Service.Admin.aBSGService;
import TiShoes.Service.Admin.aGalleryService;
import TiShoes.Service.Admin.aProd_Color_SizeService;
import TiShoes.Service.Admin.aProductService;
import TiShoes.Service.User.ProductService;
import TiShoes.Service.User.UserService;

@Controller
public class ShoesController {

	private ProductService productService;
	private aProd_Color_SizeService aProd_Color_SizeService;
	private aGalleryService aGalleryService;
	private aBSGService aBSGService;
	private UserService userService;
	private aProductService aProductService;

	@RequestMapping(value = { "/admin/product" })
	public ModelAndView loadProduct(HttpServletRequest request, HttpServletResponse response) {
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
	
	@RequestMapping(value = "/admin/product/add-new-product/savefile", method = RequestMethod.POST)
	public ModelAndView upload(@RequestParam(value="filetag", required = false) MultipartFile file ,HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		ModelAndView mv = new ModelAndView("admin/shoes");
		
		aProductService = new aProductService();
		
		String title = request.getParameter("title");
		String price = request.getParameter("price");
		String discount = request.getParameter("discount");
		String style = request.getParameter("style");
		String gender = request.getParameter("gender");
		String user = request.getParameter("user");
		String brand = request.getParameter("brand");
		String color = request.getParameter("color");
		String description = request.getParameter("description");
		
		String li_size ="";
		
		for (int i=32; i<48; i++) {
			String size = request.getParameter("size"+String.valueOf(i));
			if(size != null) {
				if(i==47) {
					li_size += String.valueOf(i)+"_"+size;
				} else {
					li_size += String.valueOf(i)+"_"+size+"/";
				}
			} else {
				if(i==47) {
					li_size += String.valueOf(i)+"_0";
				} else {
					li_size += String.valueOf(i)+"_0/";
				}
			}
		}
		System.out.println(li_size);
				
		if (title != null) {
			System.out.println(title);
		}
		if (price != null) {
			System.out.println(price);
		}
		if (discount != null) {
			System.out.println(discount);
		}
		if (style != null) {
			System.out.println(style);
		}
		if (gender != null) {
			System.out.println(gender);
		}
		if (user != null) {
			System.out.println(user);
		}
		if (brand != null) {
			System.out.println(brand);
		}
		if (description != null) {
			System.out.println(description);
		}
		if (color != null) {
			System.out.println(color);
		}
		String image = saveFile(file);
		if(image != null) {
			if (title != null && price != null && discount != null && style != null && gender != null && user != null
					&& brand != null && color != null && li_size != null && description != null) {
				if(aProductService.insert(title, Double.parseDouble(price), Integer.parseInt(discount), description,
						Integer.parseInt(style), image, Integer.parseInt(brand), Integer.parseInt(user),
						Integer.parseInt(gender), Integer.parseInt(color), li_size)) {
					System.out.println("success");	
				} else {
					System.out.println("unsuccess");
				}
			}
			return new ModelAndView("redirect: /SpringMVC/admin/product/add-new-product");
		}
		
		return mv;
	}

	private String saveFile(MultipartFile file) {
		if( file != null && !file.isEmpty()) {
			try {
				
				byte[] bytes = file.getBytes();
				//String rootpath = System.getProperty("catalina.home");
				
				File dir = new File("D:\\TTTN\\SpringMVC-14-2\\SpringMVC\\src\\main\\webapp\\assets\\images\\products");
				if(!dir.exists()) {
					dir.mkdir();
				}
				
				String name = String.valueOf("ti_shoes_"+new Date().getTime()+".jpg" );
				File serverFile = new File(dir.getAbsolutePath()+"\\"+name);
				
				System.out.println("path: " + serverFile.getPath());
				
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();
				
				return name;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	@RequestMapping(value = { "/admin/product/add-new-product" })
	public ModelAndView loadNewProduct(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		ModelAndView mv = new ModelAndView("admin/shoes");

		productService = new ProductService();
		aProductService = new aProductService();
		aProd_Color_SizeService = new aProd_Color_SizeService();
		aBSGService = new aBSGService();
		userService = new UserService();

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

	@RequestMapping(value = { "/admin/color-size" })
	public ModelAndView loadColorSize(HttpServletRequest request, HttpServletResponse response) {
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

	@RequestMapping(value = { "/admin/gallery" })
	public ModelAndView loadGallery(HttpServletRequest request, HttpServletResponse response) {
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

	@RequestMapping(value = { "/admin/brand-style-gender" })
	public ModelAndView loadBSG(HttpServletRequest request, HttpServletResponse response) {
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
