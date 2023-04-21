package TT.Controller.Admin;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import TT.Model.Category;
import TT.Model.Sub_category;
import TT.Service.User.CategoryService;
import TT.Service.User.SubCategoryService;

@Controller
public class aCategoryController {
	private SubCategoryService subCategoryService;
	private CategoryService categoryService;

	@RequestMapping(value = { "/admin/content/category" })
	public ModelAndView category(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("admin/category");
		subCategoryService = new SubCategoryService();
		categoryService = new CategoryService();

		List<Category> category = categoryService.getAllCategory();
		Collections.sort(category, new Comparator<Category>() {
			@Override
			public int compare(Category o1, Category o2) {
				return o2.getId() - o1.getId();
			}
		});
		List<Sub_category> subcategory = subCategoryService.getAllSubCategory();
		Collections.sort(subcategory, new Comparator<Sub_category>() {
			@Override
			public int compare(Sub_category o1, Sub_category o2) {
				return o2.getId() - o1.getId();
			}
		});
		mv.addObject("listCategory", category);
		mv.addObject("listSubCategory", subcategory);
		return mv;
	}

	@RequestMapping(value = { "/admin/content/category/add" })
	public ModelAndView category_add(HttpServletRequest request, HttpServletResponse response) {
		String category = request.getParameter("category");
		categoryService = new CategoryService();
		if (category != null) {
			if (categoryService.insert(category)) {
				System.out.println("add category success: " + category);
				return new ModelAndView("redirect: /ShopTandT/admin/content/category");
			} else {

			}
		}
		return null;
	}

	@RequestMapping(value = { "/admin/content/subcategory/add" })
	public ModelAndView subcategory_add(HttpServletRequest request, HttpServletResponse response) {
		String subcategory = request.getParameter("subcategory");
		String id = request.getParameter("categoryid");
		subCategoryService = new SubCategoryService();
		if (subcategory != null) {
			if (subCategoryService.insert(subcategory, Integer.parseInt(id))) {
				System.out.println("add subcategory success: " + subcategory);
				return new ModelAndView("redirect: /ShopTandT/admin/content/category");
			} else {

			}
		}
		return null;
	}
}
