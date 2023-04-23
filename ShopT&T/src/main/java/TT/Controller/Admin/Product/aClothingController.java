package TT.Controller.Admin.Product;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import TT.Model.Brand;
import TT.Model.Product;
import TT.Model.Sub_category;
import TT.Service.Admin.aBSGService;
import TT.Service.Admin.aProductService;
import TT.Service.User.SubCategoryService;
import TT.Service.User.UserService;
import TT.Service.User.Product.ClothingService;
import TT.Service.User.Product.ShoesService;

@Controller
public class aClothingController {
	private ClothingService clothingService;
	private ShoesService shoesService;
	private aBSGService aBSGService;
	private UserService userService;
	private SubCategoryService subCategoryService;
	private aProductService aProductService;

	@RequestMapping(value = { "/admin/product/clothing" })
	public ModelAndView loadProduct(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("admin/product");

		clothingService = new ClothingService();

		List<Product> product = clothingService.getAllProductsClothing();
		Collections.sort(product, new Comparator<Product>() {
			@Override
			public int compare(Product o1, Product o2) {
				return o2.getId() - o1.getId();
			}
		});
		mv.addObject("listProduct", product);

		mv.addObject("newProduct", "false");
		mv.addObject("product", "true");
		mv.addObject("colorSize", "false");
		mv.addObject("gallery", "false");
		mv.addObject("bsg", "false");
		mv.addObject("clothing", "true");
		mv.addObject("shoes", "false");
		return mv;
	}

	@RequestMapping(value = { "/admin/product/add-new-clothing" })
	public ModelAndView load_new_clothing(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		ModelAndView mv = new ModelAndView("admin/product-add");

		shoesService = new ShoesService();
		aBSGService = new aBSGService();
		userService = new UserService();
		subCategoryService = new SubCategoryService();

		mv.addObject("listUser", userService.getAllUser());
		List<Brand> liBrand = aBSGService.getAllBrand();
		Collections.sort(liBrand, new Comparator<Brand>() {
			@Override
			public int compare(Brand o1, Brand o2) {
				return o2.getId() - o1.getId();
			}
		});
		mv.addObject("listBrand", liBrand);

		List<Sub_category> rs = new LinkedList<>();
		List<Sub_category> liSub = subCategoryService.getAllSubCategory_sort_by_category_name();
		for (Sub_category sub : liSub) {
			if (sub.getCategory().getId() == 1) {
				rs.add(sub);
			}
		}
		mv.addObject("listStyle", rs);
		mv.addObject("listGender", aBSGService.getAllGender());

		mv.addObject("listProduct", shoesService.getAllProducts());

		mv.addObject("newProduct", "true");
		mv.addObject("product", "false");
		mv.addObject("colorSize", "false");
		mv.addObject("gallery", "false");
		mv.addObject("bsg", "false");

		mv.addObject("shoes", "false");
		mv.addObject("clothing", "true");
		return mv;
	}

	@RequestMapping(value = "/admin/product/add-new-clothing/savefile", method = RequestMethod.POST)
	public ModelAndView shoes(@RequestParam(value = "filetag", required = false) MultipartFile file,
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
					return new ModelAndView("redirect: /ShopTandT/admin/product/add-clothing-color-size");
				} else {
					System.out.println("unsuccess");
				}
			} else {
				System.out.println("unsuccess attribute null");
				return new ModelAndView("redirect: /ShopTandT/admin/product/add-new-clothing");
			}
		} else {
			System.out.println("unsuccess image null");
			return new ModelAndView("redirect: /ShopTandT/admin/product/add-new-clothing");
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
