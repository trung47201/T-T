package TT.Controller.Admin;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
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

import TT.Model.User;
import TT.Service.Admin.aRoleService;
import TT.Service.Admin.aStatisticsService;
import TT.Service.Admin.aUserService;

@Controller
public class UserController {

	private aRoleService aRoleService;
	private aUserService aUserService;
private aStatisticsService statisticsService;
	@RequestMapping(value = { "/admin/customer" })
	public ModelAndView loadCustomer(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("admin/customer");

		aUserService = new aUserService();
		
		String user_id_block = request.getParameter("block");
		String user_id_unblock = request.getParameter("unblock");
		
		if(user_id_block != null) {
			if(aUserService.blockUser(Integer.parseInt(user_id_block))) {
				System.out.println("success block");
				mv.addObject("block", "true");
			} else {
				System.out.println("unsuccess block");
			}
		}
		if(user_id_unblock != null) {
			if(aUserService.unblockUser(Integer.parseInt(user_id_unblock))) {
				System.out.println("success unblock");
				mv.addObject("unblock", "true");
			} else {
				System.out.println("unsuccess unblock");
			}
		}
		
		List<User> liUser = aUserService.getAllUser();
		Collections.sort(liUser, new Comparator<User>() {
			@Override
			public int compare(User o1, User o2) {
				return o2.getId() - o1.getId();
			}
		});
		mv.addObject("listUser", liUser);
		mv.addObject("user", "true");
		mv.addObject("role", "false");
		mv.addObject("addnewuser", "false");
		return mv;
	}
	
	
	
	
	@RequestMapping(value = "/admin/customer/add-new-user/savefile", method = RequestMethod.POST)
	public ModelAndView upload(@RequestParam(value="filetag", required = false) MultipartFile file ,HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		aUserService = new aUserService();
		statisticsService = new aStatisticsService();
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String email = request.getParameter("email");
		String phone_number = request.getParameter("phonenumber");
		String address = request.getParameter("address");
		String password = request.getParameter("password");
		String role_id = request.getParameter("role");
		String district = request.getParameter("district");
		String city = request.getParameter("city");
		String redirect = request.getParameter("redirect");
		//String avatar = request.getParameter("avatar");
		
		String image = saveFile(file);
		if(image != null) {
			if (firstname != null && lastname != null && email != null && phone_number != null && address != null && password != null
					&& role_id != null && district != null && city != null) {
				if (aUserService.insert(firstname, lastname, email, phone_number, address, district, city, password, image,
						Integer.parseInt(role_id))) {
					System.out.println("Add uesr success");
					if (statisticsService.check_date_of_today_exist()) { // exists
						if (statisticsService.update_user_num_in_statistics_DB()) {
							System.out.println("Update user num in statistics DB success!");
						} else {
							System.out.println("Update user num in statistics DB unsuccess!");
						}
					} else { // not exists
						statisticsService.insert_new_statistics();
						if (statisticsService.update_user_num_in_statistics_DB()) {
							System.out.println("Update user num in statistics DB success!");
						} else {
							System.out.println("Update user num in statistics DB unsuccess!");
						}
					}
					if(redirect!= null) {
						return new ModelAndView("redirect: /ShopTandT/admin/customer");
					} else {
						return new ModelAndView("redirect: /ShopTandT/admin/customer/add-new-user");
					}
				} else {
					System.out.println("Add uesr unsuccess");
					return new ModelAndView("redirect: /ShopTandT/admin/customer/add-new-user");
				}
			} else{
				System.out.println("Add uesr unsuccess element null");
				return new ModelAndView("redirect: /ShopTandT/admin/customer/add-new-user");
			}
		} else {
			if (firstname != null && lastname != null && email != null && phone_number != null && address != null && password != null
					&& role_id != null && district != null && city != null) {
				if (aUserService.insert(firstname, lastname, email, phone_number, address, district, city, password, "avt-default.jpg",
						Integer.parseInt(role_id))) {
					System.out.println("Add uesr success");
					if (statisticsService.check_date_of_today_exist()) { // exists
						if (statisticsService.update_user_num_in_statistics_DB()) {
							System.out.println("Update user num in statistics DB success!");
						} else {
							System.out.println("Update user num in statistics DB unsuccess!");
						}
					} else { // not exists
						statisticsService.insert_new_statistics();
						if (statisticsService.update_user_num_in_statistics_DB()) {
							System.out.println("Update user num in statistics DB success!");
						} else {
							System.out.println("Update user num in statistics DB unsuccess!");
						}
					}
					if(redirect!= null) {
						return new ModelAndView("redirect: /ShopTandT/admin/customer");
					} else {
						return new ModelAndView("redirect: /ShopTandT/admin/customer/add-new-user");
					}
				} else {
					System.out.println("Add uesr unsuccess");
					return new ModelAndView("redirect: /ShopTandT/admin/customer/add-new-user");
				}
			} else{
				System.out.println("Add uesr unsuccess element null");
				return new ModelAndView("redirect: /ShopTandT/admin/customer/add-new-user");
			}
		}
	}
	
	private String saveFile(MultipartFile file) {
		if( file != null && !file.isEmpty()) {
			try {
				
				byte[] bytes = file.getBytes();
				//String rootpath = System.getProperty("catalina.home");
				
				File dir = new File("D:\\DATN\\ShopTandT\\src\\main\\webapp\\assets\\images\\users");
				if(!dir.exists()) {
					dir.mkdir();
				}
				
				String name = String.valueOf("TandT_"+new Date().getTime()+".jpg" );
				File serverFile = new File(dir.getAbsolutePath()+"\\"+name);
				
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
	
	@RequestMapping(value = {"/admin/customer/add-new-user"} )
	public ModelAndView loadNewUser(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		ModelAndView mv = new ModelAndView("admin/customer");

		aUserService = new aUserService();
		aRoleService = new aRoleService();
		aUserService = new aUserService();

		mv.addObject("listRole", aRoleService.getAllRole());
		mv.addObject("listUser", aUserService.getAllUser());
		mv.addObject("addnewuser", "true");
		mv.addObject("user", "false");
		mv.addObject("role", "false");

		return mv;
	}
}
