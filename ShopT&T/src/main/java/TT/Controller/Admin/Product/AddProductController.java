package TT.Controller.Admin.Product;

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

import TT.Service.Admin.aBSGService;
import TT.Service.Admin.aProductService;
import TT.Service.User.SubCategoryService;
import TT.Service.User.UserService;
import TT.Service.User.Product.ShoesService;

@Controller
public class AddProductController {

	private ShoesService shoesService;
	private aBSGService aBSGService;
	private UserService userService;
	private aProductService aProductService;
	private SubCategoryService subCategoryService;

	@RequestMapping(value = { "/admin/product/add-new-shoes" })
	public ModelAndView load_new_shoes(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		ModelAndView mv = new ModelAndView("admin/product-add");

		shoesService = new ShoesService();
		aProductService = new aProductService();
		aBSGService = new aBSGService();
		userService = new UserService();
		subCategoryService = new SubCategoryService();
		
		mv.addObject("listUser", userService.getAllUser());
		mv.addObject("listBrand", aBSGService.getAllBrand());
		mv.addObject("listStyle", subCategoryService.getAllSubCategory_sort_by_category_name());
		mv.addObject("listGender", aBSGService.getAllGender());
		mv.addObject("listProduct", shoesService.getAllProducts());
		mv.addObject("newProduct", "true");
		mv.addObject("product", "false");
		mv.addObject("colorSize", "false");
		mv.addObject("gallery", "false");
		mv.addObject("bsg", "false");
		mv.addObject("shoes", "true");
		mv.addObject("clothing", "false");
		return mv;
	}
	

	@RequestMapping(value = "/admin/product/add-new-shoes/savefile", method = RequestMethod.POST)
	public ModelAndView upload(@RequestParam(value = "filetag", required = false) MultipartFile file,
			HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		ModelAndView mv = new ModelAndView("admin/product-add");

		aProductService = new aProductService();

		String title = request.getParameter("title");
		String price = request.getParameter("price");
		String discount = request.getParameter("discount");
		String style = request.getParameter("style");
		String gender = request.getParameter("gender");
		String user = request.getParameter("user");
		String brand = request.getParameter("brand");
		String description = request.getParameter("description");

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
		String image = saveFile(file);
		if (image != null) {
			if (title != null && price != null && discount != null && style != null && gender != null && user != null
					&& brand != null && description != null) {
				if (aProductService.insert(title, Double.parseDouble(price), Integer.parseInt(discount), description,
						Integer.parseInt(style), image, Integer.parseInt(brand), Integer.parseInt(user),
						Integer.parseInt(gender))) {
					System.out.println("success");
					return new ModelAndView("redirect: /ShopTandT/admin/product/add-shoes-color-size");
				} else {
					System.out.println("unsuccess");
				}
			} else {
				System.out.println("unsuccess attribute null");
				return new ModelAndView("redirect: /ShopTandT/admin/product/add-new-shoes");
			}
		} else {
			System.out.println("unsuccess image null");
			return new ModelAndView("redirect: /ShopTandT/admin/product/add-new-shoes");
		}
		return mv;
	}
	
	private String saveFile(MultipartFile file) {
		if (file != null && !file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();
				// String rootpath = System.getProperty("catalina.home");
				File dir = new File("D:\\DATN\\ShopTandT\\src\\main\\webapp\\assets\\images\\products");
				if (!dir.exists()) {
					dir.mkdir();
				}
				String name = String.valueOf("TandT_" + new Date().getTime() + ".jpg");
				File serverFile = new File(dir.getAbsolutePath() + "\\" + name);
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

}
