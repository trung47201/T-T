package TT.Controller.User;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FavoriteController {
	@RequestMapping(value = { "/favorite/{id}" })
	public ModelAndView load_home_without_id(@PathVariable String id, HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("layouts/user/re-favorite");

		HttpSession session = request.getSession();
		Cookie arr[] = request.getCookies();
		List<String> li = new ArrayList<>();
		if (arr != null) {
			for (Cookie c : arr) {
				li.add(c.getName());
			}
		}
		for (Cookie o : arr) {
			if (li.contains("favorite")) {
				if (o.getName().equals("favorite")) {
					String txt = get_favorite_txt(o.getValue(), id);
					o.setValue(txt);
					response.addCookie(o);
				}
			} else {
				Cookie addfavorite = new Cookie("favorite", id);
				addfavorite.setMaxAge(60 * 60 * 24);
				response.addCookie(addfavorite);
			}
		}
		if (arr != null) {
			for (Cookie o : arr) {
				if (o.getName().equals("favorite")) {
					session.setAttribute("favorite", o.getValue());
				}
			}
		}
		return mv;
	}

	public String get_favorite_txt(String txt, String id) {
		String rs = "";
		String a[] = txt.split("/");
		boolean c = false;
		for (String s : a) {
			if (s.equals(id) && !s.equals("")) {
				c = true;
			}
		}
		if (c) {
			for (String s : a) {
				if (!s.equals("") && !s.equals(id)) {
					rs += s + "/";
				}
			}
		} else {
			rs = id + "/" + txt;
		}
		return rs;
	}
}
