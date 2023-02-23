package TiShoes.Repository.Admin;

import java.util.List;

import TiShoes.Model.Role;

public interface aRoleRepository {
	public List<Role> getAllRole();
	public boolean insert(String role_name,String des);
	public boolean update(int role_id, String role_name,String des);
	public boolean delete(int role_id);
	public boolean existsRoleName(String role_name);
	public List<String> getAllRoleName();
	public Role findRoleById(int role_id);
	public boolean exists_Role_Name_When_Update(String role_name, int role_id);
	public boolean exists_Role_Id_In_tblUser(int role_id);
	public List<String> getAll_role_id_in_tblUser();
	public List<Role> findRoleByString(String txt);
}
