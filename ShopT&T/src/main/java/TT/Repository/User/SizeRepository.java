package TT.Repository.User;

import java.util.List;

import TT.Model.Sizes;

public interface SizeRepository {
	public List<Sizes> getAllSize();
	public Sizes getSizeById(int size_id);
}
