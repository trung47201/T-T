package TiShoes.Controller.Admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import TiShoes.Service.Admin.aRoleService;

@Controller
public class RoleController {
	private aRoleService aRoleService;
	
	@RequestMapping(value = { "/admin/role" })
	public ModelAndView loadRole(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("admin/customer");

		aRoleService = new aRoleService();
		
		String rolename = request.getParameter("rolename");
		String des = request.getParameter("description");
		String delele_role = request.getParameter("delete");
		String txt_search = request.getParameter("search_role");
		
		if(delele_role != null) {
			aRoleService.delete(Integer.parseInt(delele_role));
		}
		
		if(rolename != null) {
			if(aRoleService.insert(rolename, des)) {
				System.out.println("add role success");
			} else {
				System.out.println("add role unsuccess");
			}
		}

		if(txt_search != null) {
			System.out.println(txt_search);
			mv.addObject("listRole", aRoleService.findRoleByString(txt_search.trim()));
		} else {
			mv.addObject("listRole", aRoleService.getAllRole());
		}
		
		mv.addObject("listRoleId", aRoleService.getAll_role_id_in_tblUser());
		mv.addObject("listRoleName", aRoleService.getAllRoleName());
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
