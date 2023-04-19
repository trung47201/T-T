package TT.Controller.Admin.Product;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
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

import TT.Model.Gallery;
import TT.Model.Product;
import TT.Service.Admin.aGalleryService;
import TT.Service.Admin.aProd_Color_SizeService;
import TT.Service.User.Product.ShoesService;

@Controller
public class aGalleryController {

	private ShoesService shoesService;
	private aProd_Color_SizeService aProd_Color_SizeService;
	private aGalleryService aGalleryService;

	@RequestMapping(value = { "/admin/gallery" })
	public ModelAndView loadGallery(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("admin/product");

		aGalleryService = new aGalleryService();

		List<Gallery> li = aGalleryService.getAllGallery();

		Collections.sort(li, new Comparator<Gallery>() {
			@Override
			public int compare(Gallery o1, Gallery o2) {
				return o2.getId() - o1.getId();
			}
		});

		mv.addObject("listGallery", li);

		mv.addObject("newProduct", "false");
		mv.addObject("product", "false");
		mv.addObject("colorSize", "false");
		mv.addObject("gallery", "true");
		mv.addObject("bsg", "false");
		return mv;
	}

	@RequestMapping(value = { "/admin/gallery/add" })
	public ModelAndView loadLogin(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("admin/gallery");

		shoesService = new ShoesService();
		aProd_Color_SizeService = new aProd_Color_SizeService();
		String con = request.getParameter("continue");
		HttpSession session = request.getSession();
		if (con != null) {
			session.setAttribute("addgallery", "false");
			System.out.println("continue");
		}
		List<Product> product = shoesService.getAllProducts();
		Collections.sort(product, new Comparator<Product>() {
			@Override
			public int compare(Product o1, Product o2) {
				return o2.getId() - o1.getId();
			}
		});
		mv.addObject("listProduct", product);
		mv.addObject("listColor", aProd_Color_SizeService.getAllColor());

		return mv;
	}

	@RequestMapping(value = "/admin/gallery/add/savefile", method = RequestMethod.POST)
	public ModelAndView upload(@RequestParam(value = "filetag", required = false) MultipartFile file,
			HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		ModelAndView mv = new ModelAndView("admin/gallery");
		aGalleryService = new aGalleryService();

		HttpSession session = request.getSession();
		String prodid = request.getParameter("product");
		String colorid = request.getParameter("color");

		String image = saveFile(file);
		if (image != null) {
			if (prodid != null && colorid != null) {
				if (aGalleryService.insert(Integer.parseInt(prodid), Integer.parseInt(colorid), image)) {
					System.out.println("success");
					session.setAttribute("addgallery", "true");
					return new ModelAndView("redirect: /ShopTandT/admin/gallery/add");
				} else {
					System.out.println("unsuccess");
				}
			} else {
				System.out.println("unsuccess attribute null");
				return new ModelAndView("redirect: /ShopTandT/admin/gallery/add");
			}
		} else {
			System.out.println("unsuccess image null");
			return new ModelAndView("redirect: /ShopTandT/admin/gallery/add");
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
