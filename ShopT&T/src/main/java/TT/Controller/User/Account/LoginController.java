package TT.Controller.User.Account;

import java.util.HashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import TT.Model.Product_color_size;
import TT.Model.User;
import TT.Service.User.CartService;
import TT.Service.User.LoginService;
import TT.Service.User.PostsService;
import TT.Service.User.Product_color_sizeService;

@Controller
public class LoginController {
	private PostsService postsService;
	private LoginService loginService;
	private Product_color_sizeService product_color_sizeService;
	private CartService cartService;

	@RequestMapping(value = { "account/login" })
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("user/login");

		cartService = new CartService();
		postsService = new PostsService();
		loginService = new LoginService();
		product_color_sizeService = new Product_color_sizeService();

		HttpSession session = request.getSession();
		String username = request.getParameter("email");
		String password = request.getParameter("password");

		String msg = "";

		if (username != null && password != null) {
			if (loginService.checkUserPass(username, password)) {
				if (loginService.checkStatucBlock(username, password)) {
					msg = "block";
					mv.addObject("message", msg);
					System.out.println("login false: block");
				} else {
					System.out.println("login true");
					User u = loginService.get_user_by_username_password(username, password);
					session.setAttribute("userid", u.getId());
					session.setAttribute("avatar", u.getAvatar());
					session.setAttribute("fullname", u.getLastname().trim() + " " + u.getFirstname().trim());
					session.setAttribute("login", "start");
					System.out.println("login start");
					Cookie arr[] = request.getCookies();
					HashMap<Product_color_size, Integer> hm = null;
					for (Cookie o : arr) {
						if (o.getName().equals("addtocart")) {
							hm = product_color_sizeService.get_list_color_size_by_string(o.getValue());
						}
					}
					if (hm != null) {
						for (Product_color_size p : hm.keySet()) {
							cartService.insertIntoCartDB(hm.get(p), p.getId(), u.getId());
							for (Cookie o : arr) {
								if (o.getName().equals("addtocart")) {
									String cook = cartService.delete_prod_in_cart_not_login(String.valueOf(p.getId()),
											o.getValue());
									o.setValue(cook);
									o.setPath("/");
									o.setMaxAge(0);
									response.addCookie(o);
								}
							}
						}
					}
					if (session.getAttribute("cartlogin") != null) {
						return new ModelAndView("redirect: /ShopTandT/cart/" + u.getId());
					} else if (session.getAttribute("buynowlogin") != null) {
						String id_prod = String.valueOf(session.getAttribute("buynowlogin"));
						return new ModelAndView("redirect: /ShopTandT/cart/checkout/" + u.getId()+"_"+id_prod);
					} else {
						return new ModelAndView("redirect: /ShopTandT/");
					}
				}
			} else {
				msg = "false";
				mv.addObject("message", msg);
				System.out.println("login false: incorrect");
			}
		}

		mv.addObject("hmPosts", postsService.listPost());
		return mv;
	}
}
