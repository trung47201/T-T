package TiShoes.Repository.Admin;

import java.util.List;

import TiShoes.Model.User;

public interface aUserRepository {
	public List<User> getAllUser();
	public boolean insert(String fullname, String email, String phone_number, String address, String password,
			String avatar, int role_id);
	public boolean update(String fullname, String email, String phone_number, String address, String password,
			String avatar, int role_id);
	public boolean blockUser(int id_user);
	public boolean unblockUser(int id_user);
	public boolean existUser(String email, String phone_number);
}
