package TT.Controller.User;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import TT.Model.Product;
import TT.Service.User.PostsService;
import TT.Service.User.Product.ProductService;

@Controller
public class SearchController {
	private PostsService postsService;
	private ProductService productService;

	@RequestMapping(value = { "/search" })
	public ModelAndView search(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("user/re-search");
		postsService = new PostsService();

		mv.addObject("hmPosts", postsService.listPost());
		return mv;
	}

	@RequestMapping(value = { "/products" })
	public ModelAndView product(HttpServletRequest request, HttpServletResponse response) {
		String search = request.getParameter("search");
		if (search != null) {
			String s = search.replaceAll("\\s+", "-");
			return new ModelAndView("redirect: /ShopTandT/products/" + s);
		}
		return null;
	}

	@RequestMapping(value = { "/products/{id}" })
	public ModelAndView product2(@PathVariable String id, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("user/re-products");
		postsService = new PostsService();
		productService = new ProductService();

		String s = id.replaceAll("-", " ");
		HashMap<Integer, List<Product>> hmP = productService.get_product_page(productService.get_product_search(s));
		
		mv.addObject("listhmp", hmP);
		mv.addObject("title", "RESULT");
		mv.addObject("hmPosts", postsService.listPost());
		return mv;
	}
}
