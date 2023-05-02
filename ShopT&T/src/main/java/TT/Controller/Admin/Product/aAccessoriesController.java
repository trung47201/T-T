package TT.Controller.Admin.Product;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import TT.Service.Admin.aGalleryService;
import TT.Service.Admin.aProd_Color_SizeService;
import TT.Service.Admin.aProductService;
import TT.Service.User.ColorService;
import TT.Service.User.Product_color_sizeService;
import TT.Service.User.SubCategoryService;
import TT.Service.User.UserService;
import TT.Service.User.Product.AccessoriesService;
import TT.Service.User.Product.GiftsService;
import TT.Service.User.Product.HandbagsService;
import TT.Service.User.Product.ShoesService;

@Controller
public class aAccessoriesController {
	private AccessoriesService accessoriesService;
	private ShoesService shoesService;
	private aGalleryService aGalleryService;
	private aProd_Color_SizeService aProd_Color_SizeService;
	private aBSGService aBSGService;
	private UserService userService;
	private SubCategoryService subCategoryService;
	private aProductService aProductService;
	private Product_color_sizeService product_color_sizeService;
	private ColorService colorService;

	@RequestMapping(value = { "/admin/product/accessories" })
	public ModelAndView loadProduct(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("admin/product/accessories");
		accessoriesService = new AccessoriesService();

		String handbagsgallery = request.getParameter("accessoriesgallery");
		String cancel = request.getParameter("cancel");

		HttpSession session = request.getSession();
		if (handbagsgallery != null && session.getAttribute("accessories") != null) {
			session.setAttribute("accessories", "cancel");

		}
		if (cancel != null) {
			session.setAttribute("addaccessories", "cancel");
		}
		List<Product> product = accessoriesService.getAllProductsAccessories();
		Collections.sort(product, new Comparator<Product>() {
			@Override
			public int compare(Product o1, Product o2) {
				return o2.getId() - o1.getId();
			}
		});
		mv.addObject("listProduct", product);
		mv.addObject("accessories", "true");
		return mv;
	}

	@RequestMapping(value = { "/admin/product/accessories/add" })
	public ModelAndView load_new_handbags(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		ModelAndView mv = new ModelAndView("admin/product-add");
		shoesService = new ShoesService();
		aBSGService = new aBSGService();
		userService = new UserService();
		subCategoryService = new SubCategoryService();
		List<Brand> brand = aBSGService.getAllBrand();
		Collections.sort(brand, new Comparator<Brand>() {
			@Override
			public int compare(Brand o1, Brand o2) {
				return o2.getId() - o1.getId();
			}
		});
		mv.addObject("listUser", userService.getAllUser());
		mv.addObject("listBrand", brand);

		List<Sub_category> rs = new LinkedList<>();
		List<Sub_category> liSub = subCategoryService.getAllSubCategory_sort_by_category_name();
		for (Sub_category sub : liSub) {
			if (sub.getCategory().getId() == 6) {
				rs.add(sub);
			}
		}
		Collections.sort(rs, new Comparator<Sub_category>() {
			@Override
			public int compare(Sub_category o1, Sub_category o2) {
				return o2.getId() - o1.getId();
			}
		});
		mv.addObject("listStyle", rs);
		mv.addObject("listGender", aBSGService.getAllGender());
		mv.addObject("listProduct", shoesService.getAllProducts());
		mv.addObject("newProduct", "true");
		mv.addObject("product", "false");
		mv.addObject("colorSize", "false");
		mv.addObject("gallery", "false");
		mv.addObject("bsg", "false");
		mv.addObject("shoes", "false");
		mv.addObject("clothing", "false");
		mv.addObject("handbags", "false");
		mv.addObject("gifts", "false");
		mv.addObject("accessories", "true");
		return mv;
	}

	@RequestMapping(value = "/admin/product/add-new-accessories/savefile", method = RequestMethod.POST)
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
					return new ModelAndView("redirect: /ShopTandT/admin/product/add-accessories-color");
				} else {
					System.out.println("unsuccess");
				}
			} else {
				System.out.println("unsuccess attribute null");
				return new ModelAndView("redirect: /ShopTandT/admin/product/accessories/add");
			}
		} else {
			System.out.println("unsuccess image null");
			return new ModelAndView("redirect: /ShopTandT/admin/product/accessories/add");
		}
		return mv;
	}

	@RequestMapping(value = { "/admin/product/add-accessories-color" })
	public ModelAndView load_color_size_shoes(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("admin/product/accessories-add-color");

		shoesService = new ShoesService();
		aProd_Color_SizeService = new aProd_Color_SizeService();
		product_color_sizeService = new Product_color_sizeService();
		colorService = new ColorService();

		int l = colorService.get_last_id_color();
		String product = request.getParameter("product");
		String redirect = String.valueOf(request.getParameter("redirect"));
		String li_color = "";
		for (int i = 1; i <= l; i++) {
			String color = request.getParameter("color" + String.valueOf(i));
			if (color != null) {
				if (!color.equals("")) {
					li_color += String.valueOf(i) + "_" + color + "/";
				}
			}
		}

		if (product != null && !li_color.equals("")) {
			if (product_color_sizeService.insertIntoColor_Size_not_size(li_color, Integer.parseInt(product))) {
				System.out.println(li_color + "=================================" + product);
				if (!redirect.equals("false")) {
					return new ModelAndView("redirect: /ShopTandT/admin/product/accessories/add-gallery");
				} else {
					return new ModelAndView("redirect: /ShopTandT/admin/product/add-accessories-color");
				}
			} else {
				return new ModelAndView("redirect: /ShopTandT/admin/product/add-accessories-color");
			}
		}

		List<Product> liproduct = shoesService.getAllProducts();
		Collections.sort(liproduct, new Comparator<Product>() {
			@Override
			public int compare(Product o1, Product o2) {
				return o2.getId() - o1.getId();
			}
		});
		String productid = request.getParameter("productid");
		String qty = request.getParameter("qty");
		if (productid != null && qty != null) {
			if (product_color_sizeService.insertIntoColor_Size_not_size("1_" + qty, Integer.parseInt(productid))) {
				System.out.println("1_" + qty + "=================================" + productid);
				if (!redirect.equals("false")) {
					return new ModelAndView("redirect: /ShopTandT/admin/product/accessories/add-gallery");
				} else {
					return new ModelAndView("redirect: /ShopTandT/admin/product/add-accessories-color");
				}
			} else {
				return new ModelAndView("redirect: /ShopTandT/admin/product/add-accessories-color");
			}
		}

		mv.addObject("listProduct", liproduct);
		mv.addObject("accessoriescolorsize", "true");
		mv.addObject("listColor", aProd_Color_SizeService.getAllColor());
		return mv;
	}

	@RequestMapping(value = { "/admin/product/accessories/add-gallery" })
	public ModelAndView load_new_handbags_gallery(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		ModelAndView mv = new ModelAndView("admin/product/accessories-add-gallery");
		shoesService = new ShoesService();
		aProd_Color_SizeService = new aProd_Color_SizeService();

		HttpSession session = request.getSession();
		String con = request.getParameter("continue");
		if (con != null && session.getAttribute("addaccessories") != null) {
			session.setAttribute("addaccessories", "continue");
		}
		List<Product> liproduct = shoesService.getAllProducts();
		Collections.sort(liproduct, new Comparator<Product>() {
			@Override
			public int compare(Product o1, Product o2) {
				return o2.getId() - o1.getId();
			}
		});
		mv.addObject("listProduct", liproduct);
		return mv;
	}

	@RequestMapping(value = "/admin/product/accessories-gallery/savefile", method = RequestMethod.POST)
	public ModelAndView shoes(@RequestParam(value = "filetag", required = false) MultipartFile[] file,
			HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		aGalleryService = new aGalleryService();
		HttpSession session = request.getSession();
		String prodid = request.getParameter("product");
		boolean check = false;
		try {
			List<MultipartFile> files = Arrays.asList(file);
			for (MultipartFile m : files) {
				String image = saveFile(m);
				if (image != null) {
					if (prodid != null) {
						if (aGalleryService.insert(Integer.parseInt(prodid), image)) {
							check = true;
							System.out.println("success");
						} else {
							System.out.println("unsuccess");
						}
					} else {
						System.out.println("unsuccess attribute null");
					}
				} else {
					System.out.println("unsuccess image null");
				}
			}
		} catch (Exception e) {
			String msg = "Fail to upload files!";
			System.out.println(msg);
			e.printStackTrace();
		}
		if (check) {
			session.setAttribute("addaccessories", "true");
			return new ModelAndView("redirect: /ShopTandT/admin/product/accessories/add-gallery");
		} else {
			return new ModelAndView("redirect: /ShopTandT/admin/product/accessories/add-gallery");
		}
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
