package TT.Controller.Admin;

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
import TT.Model.Posts;
import TT.Model.Sub_category;
import TT.Service.Admin.aBSGService;
import TT.Service.Admin.aPostsService;
import TT.Service.Admin.aProductService;
import TT.Service.User.SubCategoryService;
import TT.Service.User.UserService;
import TT.Service.User.Product.ShoesService;

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

	@RequestMapping(value = { "/admin/layout/posts/add" })
	public ModelAndView load_new_clothing(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		ModelAndView mv = new ModelAndView("admin/posts-add");

		return mv;
	}

	@RequestMapping(value = "/admin/layout/add-new-posts/savefile", method = RequestMethod.POST)
	public ModelAndView shoes(@RequestParam(value = "filetag", required = false) MultipartFile file,
			HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String content = request.getParameter("content");
		String url = request.getParameter("url");
		String type = request.getParameter("type");

		if (content != null) {
			System.out.println(content);
		}
		if (url != null) {
			System.out.println(url);
		}
		if (type != null) {
			System.out.println(type);
		}
		String image = saveFile(file);
		if (image != null) {
			if (content != null && url != null && type != null) {

			} else {
				System.out.println("unsuccess attribute null");
				return new ModelAndView("redirect: /ShopTandT/admin/layout/posts/add");
			}
		} else {
			System.out.println("unsuccess image null");
			return new ModelAndView("redirect: /ShopTandT/admin/layout/posts/add");
		}
		return null;
	}

	private String saveFile(MultipartFile file) {
		if (file != null && !file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();
				// String rootpath = System.getProperty("catalina.home");
				File dir = new File("D:\\DATN\\ShopTandT\\src\\main\\webapp\\assets\\images\\posts");
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
