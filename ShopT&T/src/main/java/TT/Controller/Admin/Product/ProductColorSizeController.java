package TT.Controller.Admin.Product;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import TT.Model.Product;
import TT.Service.Admin.aProd_Color_SizeService;
import TT.Service.User.ColorService;
import TT.Service.User.Product_color_sizeService;
import TT.Service.User.Product.ShoesService;

@Controller
public class ProductColorSizeController {
	private ShoesService shoesService;
	private aProd_Color_SizeService aProd_Color_SizeService;
	private ColorService colorService;
	private Product_color_sizeService product_color_sizeService;

	@RequestMapping(value = { "/admin/product/add-product-color-size" })
	public ModelAndView load_color_size(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("admin/product-color-size-add");

		shoesService = new ShoesService();
		aProd_Color_SizeService = new aProd_Color_SizeService();
		product_color_sizeService = new Product_color_sizeService();

		String product = request.getParameter("product");
		String color = request.getParameter("color");
		String li_size = "";
		for (int i = 32; i < 48; i++) {
			String size = request.getParameter("size" + String.valueOf(i));
			if (size != null) {
				if (!size.equals("")) {
					li_size += String.valueOf(i) + "_" + size + "/";
				} else {
					li_size += String.valueOf(i) + "_0/";
				}
			}
		}
		String sizeXS = request.getParameter("sizeXS");
		String sizeS = request.getParameter("sizeS");
		String sizeM = request.getParameter("sizeM");
		String sizeL = request.getParameter("sizeL");
		String sizeXL = request.getParameter("sizeXL");
		String size2XL = request.getParameter("size2XL");
		String size3XL = request.getParameter("size3XL");

		if (sizeXS != null) {
			if (!sizeXS.equals("")) {
				li_size += "XS_" + sizeXS + "/";
			} else {
				li_size += "XS_0/";
			}
		}
		if (sizeS != null) {
			if (!sizeS.equals("")) {
				li_size += "S_" + sizeS + "/";
			} else {
				li_size += "S_0/";
			}
		}
		if (sizeM != null) {
			if (!sizeM.equals("")) {
				li_size += "M_" + sizeM + "/";
			} else {
				li_size += "M_0/";
			}
		}
		if (sizeL != null) {
			if (!sizeL.equals("")) {
				li_size += "L_" + sizeL + "/";
			} else {
				li_size += "L_0/";
			}
		}
		if (sizeXL != null) {
			if (!sizeXL.equals("")) {
				li_size += "XL_" + sizeXL + "/";
			} else {
				li_size += "XL_0/";
			}
		}
		if (size2XL != null) {
			if (!size2XL.equals("")) {
				li_size += "2XL_" + size2XL + "/";
			} else {
				li_size += "2XL_0/";
			}
		}
		if (size3XL != null) {
			if (!size3XL.equals("")) {
				li_size += "3XL_" + size3XL + "/";
			} else {
				li_size += "3XL_0/";
			}
		}

		System.out.println(product + "==" + color + "===" + li_size);

		if (product != null && color != null && !li_size.equals("")) {
			if (product_color_sizeService.insertIntoColor_Size(li_size, Integer.parseInt(color),
					Integer.parseInt(product))) {
				System.out.println("add color size success");
				mv.addObject("addsuccess", "true");
			} else {
				System.out.println("add color size unsuccess");
				mv.addObject("unsuccess", "false");
			}
		}

		List<Product> liproduct = shoesService.getAllProducts();
		Collections.sort(liproduct, new Comparator<Product>() {
			@Override
			public int compare(Product o1, Product o2) {
				return o2.getId() - o1.getId();
			}
		});
		mv.addObject("listProduct", liproduct);

		mv.addObject("listColor", aProd_Color_SizeService.getAllColor());

		mv.addObject("shoes", "false");
		mv.addObject("clothing", "false");
		return mv;
	}

	@RequestMapping(value = { "/admin/product/add-shoes-color-size" })
	public ModelAndView load_color_size_shoes(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("admin/product-color-size-add");

		shoesService = new ShoesService();
		aProd_Color_SizeService = new aProd_Color_SizeService();
		product_color_sizeService = new Product_color_sizeService();

		String product = request.getParameter("product");
		String color = request.getParameter("color");
		String li_size = "";
		for (int i = 32; i < 48; i++) {
			String size = request.getParameter("size" + String.valueOf(i));
			if (size != null) {
				if (!size.equals("")) {
					li_size += String.valueOf(i) + "_" + size + "/";
				} else {
					li_size += String.valueOf(i) + "_0/";
				}
			}
		}

		System.out.println(product + "==" + color + "===" + li_size);

		if (product != null && color != null && !li_size.equals("")) {
			if (product_color_sizeService.insertIntoColor_Size(li_size, Integer.parseInt(color),
					Integer.parseInt(product))) {
				System.out.println("add shoes color size success");
				return new ModelAndView("redirect: /ShopTandT/admin/gallery/add");
			} else {
				mv.addObject("unsuccess", "false");
			}
		}

		List<Product> liproduct = shoesService.getAllProducts();
		Collections.sort(liproduct, new Comparator<Product>() {
			@Override
			public int compare(Product o1, Product o2) {
				return o2.getId() - o1.getId();
			}
		});
		mv.addObject("listProduct", liproduct);
		mv.addObject("listColor", aProd_Color_SizeService.getAllColor());

		mv.addObject("shoes", "true");
		mv.addObject("clothing", "false");
		return mv;
	}

	@RequestMapping(value = { "/admin/product/add-clothing-color-size" })
	public ModelAndView load_color_size_clothing(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("admin/product-color-size-add");

		shoesService = new ShoesService();
		aProd_Color_SizeService = new aProd_Color_SizeService();
		product_color_sizeService = new Product_color_sizeService();

		String product = request.getParameter("product");
		String color = request.getParameter("color");
		String li_size = "";

		String sizeXS = request.getParameter("sizeXS");
		String sizeS = request.getParameter("sizeS");
		String sizeM = request.getParameter("sizeM");
		String sizeL = request.getParameter("sizeL");
		String sizeXL = request.getParameter("sizeXL");
		String size2XL = request.getParameter("size2XL");
		String size3XL = request.getParameter("size3XL");

		if (sizeXS != null) {
			if (!sizeXS.equals("")) {
				li_size += "XS_" + sizeXS + "/";
			} else {
				li_size += "XS_0/";
			}
		}
		if (sizeS != null) {
			if (!sizeS.equals("")) {
				li_size += "S_" + sizeS + "/";
			} else {
				li_size += "S_0/";
			}
		}
		if (sizeM != null) {
			if (!sizeM.equals("")) {
				li_size += "M_" + sizeM + "/";
			} else {
				li_size += "M_0/";
			}
		}
		if (sizeL != null) {
			if (!sizeL.equals("")) {
				li_size += "L_" + sizeL + "/";
			} else {
				li_size += "L_0/";
			}
		}
		if (sizeXL != null) {
			if (!sizeXL.equals("")) {
				li_size += "XL_" + sizeXL + "/";
			} else {
				li_size += "XL_0/";
			}
		}
		if (size2XL != null) {
			if (!size2XL.equals("")) {
				li_size += "2XL_" + size2XL + "/";
			} else {
				li_size += "2XL_0/";
			}
		}
		if (size3XL != null) {
			if (!size3XL.equals("")) {
				li_size += "3XL_" + size3XL + "/";
			} else {
				li_size += "3XL_0/";
			}
		}

		System.out.println(product + "==" + color + "===" + li_size);

		if (product != null && color != null && !li_size.equals("")) {
			if (product_color_sizeService.insertIntoColor_Size(li_size, Integer.parseInt(color),
					Integer.parseInt(product))) {
				System.out.println("add cloothing color size success");
				return new ModelAndView("redirect: /ShopTandT/admin/gallery/add");
			} else {
				mv.addObject("unsuccess", "false");
			}
		}

		List<Product> liproduct = shoesService.getAllProducts();
		Collections.sort(liproduct, new Comparator<Product>() {
			@Override
			public int compare(Product o1, Product o2) {
				return o2.getId() - o1.getId();
			}
		});
		mv.addObject("listProduct", liproduct);
		mv.addObject("listColor", aProd_Color_SizeService.getAllColor());

		mv.addObject("shoes", "false");
		mv.addObject("clothing", "true");
		return mv;
	}

	@RequestMapping(value = { "/admin/color-size/add-color" })
	public ModelAndView add_color(HttpServletRequest request, HttpServletResponse response) {
		colorService = new ColorService();

		String name = request.getParameter("colorname");
		String rgb = request.getParameter("colorrgb");

		System.out.println(name + "==" + rgb);
		if (name != null && rgb != null) {
			if (colorService.insert(name, rgb)) {
				System.out.println("add color success!");
				return new ModelAndView("redirect: /ShopTandT/admin/color-size");
			}
			return new ModelAndView("redirect: /ShopTandT/admin/color-size");
		}

		return null;
	}
}
