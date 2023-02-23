package TiShoes.Service.Admin;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import com.mysql.jdbc.PreparedStatement;

import TiShoes.Model.Role;
import TiShoes.Model.User;
import TiShoes.Repository.Admin.aRoleRepository;
import TiShoes.Service.User.ConnectService;
import TiShoes.Service.User.RoleService;

public class aRoleService implements aRoleRepository{
	private ConnectService connectService;
	private aUserService aUserService;
	private RoleService roleService;
	
	@Override
	public List<Role> getAllRole() {
		roleService = new RoleService();
		return roleService.getAllRole();
	}

	@Override
	public boolean insert(String role_name, String des) {
		try {
			java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
			connectService = new ConnectService();
			Connection conn = connectService.getConnect();
	
			if (!existsRoleName(role_name)) {
				String sql = "INSERT INTO `role`(`role_name`, `description`, `created_at`, `updated_at`) "
						+ "VALUES (?, ?, ?, ?)";
				PreparedStatement preparedStmt = (PreparedStatement) conn.prepareStatement(sql);
				preparedStmt.setString(1, role_name);
				preparedStmt.setString(2, des);
				preparedStmt.setTimestamp(3, date);
				preparedStmt.setTimestamp(4, date);
				preparedStmt.execute();
				conn.close();
			
				return true;
			}
		} catch (Exception e) {
			System.err.println("Got an exception!");
			// printStackTrace method
			// prints line numbers + call stack
			e.printStackTrace();
			// Prints what exception has been thrown
			System.out.println(e);
		}
		return false;
	}

	@Override
	public boolean update(int role_id, String role_name, String des) {
		try {
			if(des != null) {
				des = des.trim();
			}
			connectService = new ConnectService();
			Connection conn = connectService.getConnect();
			if(exists_Role_Name_When_Update(role_name, role_id)) {
				String sql = "UPDATE `role` SET `description`= ? WHERE id = ? ";
				PreparedStatement preparedStmt = (PreparedStatement) conn.prepareStatement(sql);
				preparedStmt.setString(1, des);
				preparedStmt.setInt(2, role_id);
				preparedStmt.execute();
				conn.close();
				System.out.println("th1");
				return true;
			} else {
				if (!existsRoleName(role_name)) {
					String sql = "UPDATE `role` SET `role_name`= ?, `description`= ? WHERE id = ? ";
					PreparedStatement preparedStmt = (PreparedStatement) conn.prepareStatement(sql);
					preparedStmt.setString(1, role_name);
					preparedStmt.setString(2, des);
					preparedStmt.setInt(3, role_id);
					preparedStmt.execute();
					conn.close();
					System.out.println("th2");
					return true;
				} else {
					System.out.println("th2 da ton tai");
				}
			}
		} catch (Exception e) {
			System.err.println("Got an exception!");
			// printStackTrace method
			// prints line numbers + call stack
			e.printStackTrace();
			// Prints what exception has been thrown
			System.out.println(e);
		}
		return false;
	}

	@Override
	public boolean delete(int role_id) {
		try {
			connectService = new ConnectService();
			Connection conn = connectService.getConnect();
	
			if (!exists_Role_Id_In_tblUser(role_id)) {
				String sql = "DELETE FROM `role` WHERE id = ?";
				PreparedStatement preparedStmt = (PreparedStatement) conn.prepareStatement(sql);
				preparedStmt.setInt(1, role_id);
				preparedStmt.execute();
				conn.close();
			
				return true;
			}
		} catch (Exception e) {
			System.err.println("Got an exception!");
			// printStackTrace method
			// prints line numbers + call stack
			e.printStackTrace();
			// Prints what exception has been thrown
			System.out.println(e);
		}
		return false;
	}

	@Override
	public boolean existsRoleName(String role_name) {
		for (Role r : getAllRole()) {
			if(r.getRole_name().trim().equals(role_name.trim())) {
				return true;
			}
		}
		return false;
	}
	
	@Override
	public boolean exists_Role_Name_When_Update(String role_name, int role_id) {
		for (Role r : getAllRole()) {
			if(r.getRole_name().trim().equals(role_name.trim()) && r.getId()==role_id) {
				return true;
			}
		}
		return false;
	}
	
	@Override
	public boolean exists_Role_Id_In_tblUser(int role_id) {
		aUserService = new aUserService();
		for (User u : aUserService.getAllUser()) {
			if(u.getRole().getId()== role_id) {
				return true;
			}
		}
		return false;
	}
	
	@Override
	public List<String> getAllRoleName() {
		List<String> li = new ArrayList<>();
		for (Role r : getAllRole()) {
			li.add(r.getRole_name());
		}
		return li;
	}
	
	@Override
	public Role findRoleById(int role_id) {
		Role role = null;
		for (Role r : getAllRole()) {
			if(r.getId() == role_id) {
				role = r;
			}
		}
		return role;
	}
	
	@Override
	public List<String> getAll_role_id_in_tblUser() {
		aUserService = new aUserService();
		List<String> li = new ArrayList<>();
		for (User u : aUserService.getAllUser()) {
			if(!li.contains(String.valueOf(u.getRole().getId()))) {
				li.add(String.valueOf(u.getRole().getId()));
			}
		}
		return li;
	}
	
	@Override
	public List<Role> findRoleByString(String txt) {
		List<Role> li = new LinkedList<>();
		for (Role r : getAllRole()) {
			String arrA[] = r.getRole_name().split("\\s+");
			String arrB[] = r.getDescription().split("\\s+");
			for (String s : arrA) {
				if(s.equals(txt)) {
					if(!li.contains(r)) {
						li.add(r);
					}
				}
			}
			for (String s : arrB) {
				if(s.equals(txt)) {
					if(!li.contains(r)) {
						li.add(r);
					}
				}
			}
		}
		return li;
	}
}
