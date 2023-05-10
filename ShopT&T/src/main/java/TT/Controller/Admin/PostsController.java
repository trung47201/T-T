package TT.Controller.Admin;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import TT.Model.Posts;
import TT.Service.Admin.aPostsService;

@Controller
public class PostsController {
	private aPostsService aPostsService;

	@RequestMapping(value = { "/admin/layout/posts" })
	public ModelAndView load_posts(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("admin/posts");
		aPostsService = new aPostsService();
		List<Posts> liPosts = aPostsService.getAllPosts();
		for (Posts p : liPosts) {
			if (p.getVideo() != null) {
				if (!p.getVideo().equals("")) {
					System.out.println(p.getVideo());
				}
			}
		}
		Collections.sort(liPosts, new Comparator<Posts>() {
			@Override
			public int compare(Posts o1, Posts o2) {
				return o2.getId() - o1.getId();
			}
		});
		mv.addObject("listPosts", liPosts);
		return mv;
	}
}
