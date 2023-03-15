package TiShoes.Controller.Admin;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import TiShoes.Service.Admin.aRoleService;
import TiShoes.Service.Admin.aUserService;

@Controller
public class UserController {

	private aRoleService aRoleService;
	private aUserService aUserService;

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
		
		mv.addObject("listUser", aUserService.getAllUser());
		mv.addObject("user", "true");
		mv.addObject("role", "false");
		mv.addObject("addnewuser", "false");
		return mv;
	}
	
	
	
	
	@RequestMapping(value = "/admin/customer/add-new-user/savefile", method = RequestMethod.POST)
	public ModelAndView upload(@RequestParam(value="filetag", required = false) MultipartFile file ,HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		ModelAndView mv = new ModelAndView("admin/customer");
		
		aUserService = new aUserService();
		
		String fullname = request.getParameter("fullname");
		String email = request.getParameter("email");
		String phone_number = request.getParameter("phonenumber");
		String address = request.getParameter("address");
		String password = request.getParameter("password");
		String role_id = request.getParameter("role");
		//String avatar = request.getParameter("avatar");
		
		if(fullname != null) {
			System.out.println(fullname);
		}
		if(email != null) {
			System.out.println(email);
		}
		if(phone_number != null) {
			System.out.println(phone_number);
		}
		if(address != null) {
			System.out.println(address);
		}
		if(password != null) {
			System.out.println(password);
		}
		if(role_id != null) {
			System.out.println(role_id);
		}
		
		String image = saveFile(file);
		if(image != null) {
			if (fullname != null && email != null && phone_number != null && address != null && password != null
					&& role_id != null) {
				if (aUserService.insert(fullname, email, phone_number, address, password, image,
						Integer.parseInt(role_id))) {
					System.out.println("Add uesr success");
				} else {
					System.out.println("Add uesr unsuccess");
				}
			}
			return new ModelAndView("redirect: /SpringMVC/admin/customer/add-new-user");
		}
		
		
		return mv;
	}
	
	private String saveFile(MultipartFile file) {
		if( file != null && !file.isEmpty()) {
			try {
				
				byte[] bytes = file.getBytes();
				//String rootpath = System.getProperty("catalina.home");
				
				File dir = new File("D:\\TTTN\\SpringMVC-14-2\\SpringMVC\\src\\main\\webapp\\assets\\images\\users");
				if(!dir.exists()) {
					dir.mkdir();
				}
				
				String name = String.valueOf("ti_shoes_"+new Date().getTime()+".jpg" );
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
