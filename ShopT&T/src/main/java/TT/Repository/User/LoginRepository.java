package TT.Repository.User;

import java.util.List;

import TT.Model.User;

public interface LoginRepository {
	public List<User> getAllUser();
	public boolean checkUserPass(String user, String pass);
	public int getIdUser(String user, String pass);
}
