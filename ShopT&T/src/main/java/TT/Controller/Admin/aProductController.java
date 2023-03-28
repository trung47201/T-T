package TT.Controller.Admin;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import TT.Service.Admin.aProductService;
import TT.Service.User.BrandService;
import TT.Service.User.GenderService;
import TT.Service.User.SubCategoryService;
import TT.Service.User.Product.ShoesService;

@Controller
public class aProductController {

	private ShoesService shoesService;
	private SubCategoryService subCategoryService;
	private BrandService brandService;
	private GenderService genderService;
	private aProductService aProductService;

	@RequestMapping(value = { "/admin/product/edit/{id}" })
	public ModelAndView edit_product(@PathVariable String id, HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("admin/product-edit");

		shoesService = new ShoesService();
		subCategoryService = new SubCategoryService();
		brandService = new BrandService();
		genderService = new GenderService();

		mv.addObject("style", subCategoryService.getAllSubCategory());
		mv.addObject("brand", brandService.getAllBrand());
		mv.addObject("gender", genderService.getAllGender());
		mv.addObject("product", shoesService.getProduct(Integer.parseInt(id)));
		mv.addObject("des", shoesService.getProduct(Integer.parseInt(id)).getDescription().trim());

		mv.addObject("productedit", "true");
		mv.addObject("id", id);
		return mv;
	}

	@RequestMapping(value = "/admin/product/edit/saveproduct/{id}", method = RequestMethod.POST)
	public ModelAndView upload(@RequestParam(value = "filetag", required = false) MultipartFile file,
			@PathVariable String id, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		aProductService = new aProductService();

		String title = request.getParameter("title");
		String price = request.getParameter("price");
		String discount = request.getParameter("discount");
		String style = request.getParameter("style");
		String gender = request.getParameter("gender");
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
		if (brand != null) {
			System.out.println(brand);
		}
		if (description != null) {
			System.out.println(description);
		}
		String image = saveFile(file);
		if (image != null) {
			if (title != null && price != null && discount != null && style != null && gender != null && brand != null
					&& description != null) {
				if (aProductService.update(Integer.parseInt(id), title, Double.parseDouble(price),
						Integer.parseInt(discount), description, Integer.parseInt(style), image,
						Integer.parseInt(brand), Integer.parseInt(gender))) {
					System.out.println("save product success aProductController (100)");
				} else {
					System.out.println("save product unsuccess aProductController (100)");
				}
			}
			return new ModelAndView("redirect: /ShopTandT/admin/product");
		} else {
			if (title != null && price != null && discount != null && style != null && gender != null && brand != null
					&& description != null) {
				if (aProductService.update(Integer.parseInt(id), title, Double.parseDouble(price),
						Integer.parseInt(discount), description, Integer.parseInt(style), "",
						Integer.parseInt(brand), Integer.parseInt(gender))) {
					System.out.println("save product success aProductController (100)");
				} else {
					System.out.println("save product unsuccess aProductController (100)");
				}
			}
			return new ModelAndView("redirect: /ShopTandT/admin/product");
		}
	}

	private String saveFile(MultipartFile file) {
		if (file != null && !file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();
				// String rootpath = System.getProperty("catalina.home");
				File dir = new File("D:\\TTTN\\ShopTandT-14-2\\ShopTandT\\src\\main\\webapp\\assets\\images\\products");
				if (!dir.exists()) {
					dir.mkdir();
				}
				String name = String.valueOf("ti_shoes_" + new Date().getTime() + ".jpg");
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
