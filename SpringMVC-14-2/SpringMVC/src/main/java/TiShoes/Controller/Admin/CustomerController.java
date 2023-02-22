package TiShoes.Controller.Admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import TiShoes.Service.Admin.aRoleService;
import TiShoes.Service.Admin.aUserService;

@Controller
public class CustomerController {

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

	@RequestMapping(value = { "/admin/customer/add-new-user" })
	public ModelAndView loadNewUser(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("admin/customer");

		aUserService = new aUserService();
		aRoleService = new aRoleService();
		aUserService = new aUserService();

		String fullname = request.getParameter("fullname");
		String email = request.getParameter("email");
		String phone_number = request.getParameter("phonenumber");
		String address = request.getParameter("address");
		String password = request.getParameter("password");
		String role_id = request.getParameter("role_id");
		String avatar = request.getParameter("avatar");
		
		if (fullname != null && email != null && phone_number != null && address != null && password != null
				&& role_id != null) {
			if (aUserService.insert(fullname, email, phone_number, address, password, avatar,
					Integer.parseInt(role_id))) {
				System.out.println("Add uesr success");
			} else {
				System.out.println("Add uesr unsuccess");
			}
		}

		mv.addObject("listRole", aRoleService.getAllRole());
		mv.addObject("listUser", aUserService.getAllUser());
		mv.addObject("addnewuser", "true");
		mv.addObject("user", "false");
		mv.addObject("role", "false");

		return mv;
	}

	@RequestMapping(value = { "/admin/role" })
	public ModelAndView loadRole(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("admin/customer");

		aRoleService = new aRoleService();
		
		String rolename = request.getParameter("rolename");
		String des = request.getParameter("description");
		String delele_role = request.getParameter("delete");
		
		if(delele_role != null) {
			System.out.println(delele_role);
		}
		
		if(rolename != null) {
			if(aRoleService.insert(rolename, des)) {
				System.out.println("add role success");
			} else {
				System.out.println("add role unsuccess");
			}
		}

		mv.addObject("listRoleId", aRoleService.getAll_role_id_in_tblUser());
		mv.addObject("listRoleName", aRoleService.getAllRoleName());
		mv.addObject("listRole", aRoleService.getAllRole());
		mv.addObject("user", "false");
		mv.addObject("role", "true");
		mv.addObject("roleedit", "false");
		mv.addObject("addnewuser", "false");

		return mv;
	}
	
	@RequestMapping(value = { "/admin/role/edit/{id}" })
	public ModelAndView loadRoleEdit(@PathVariable String id, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("admin/customer");

		aRoleService = new aRoleService();
		
		String rolename = request.getParameter("rolename");
		String des = request.getParameter("description");
		
		if(rolename != null) {
			System.out.println(id + "__" + rolename +"---" + des);
			if(aRoleService.update(Integer.parseInt(id.trim()), rolename.trim(), des)) {
				System.out.println("Success role updated ");
			} else {
				System.out.println("Unsuccess role updated");
			}
		}
		
		if(!id.equals("null") || !id.equals("")) {
			System.out.println("id_role edit: "+id);
			mv.addObject("roleEntity", aRoleService.findRoleById(Integer.parseInt(id)));
		}

		mv.addObject("listRoleName", aRoleService.getAllRoleName());
		mv.addObject("listRole", aRoleService.getAllRole());
		mv.addObject("user", "false");
		mv.addObject("role", "true");
		mv.addObject("roleedit", "true");
		mv.addObject("addnewuser", "false");

		return mv;
	}
}
