package TiShoes.Repository.User;

import java.util.List;

import TiShoes.Model.Sizes;

public interface SizeRepository {
	public List<Sizes> getAllSize();
	public Sizes getSizeById(int size_id);
}
