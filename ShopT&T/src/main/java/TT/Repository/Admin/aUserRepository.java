package TT.Repository.Admin;

import java.util.List;

import TT.Model.User;

public interface aUserRepository {
	public List<User> getAllUser();
	public boolean insert(String firstname, String lastname, String email, String phone_number, String address, String district, String city, String password,
			String avatar, int role_id);
	public boolean update(String firstname, String lastname, String email, String phone_number, String address, String district, String city, String password,
			String avatar, int role_id);
	public boolean blockUser(int id_user);
	public boolean unblockUser(int id_user);
	public boolean existUser(String email, String phone_number);
}
