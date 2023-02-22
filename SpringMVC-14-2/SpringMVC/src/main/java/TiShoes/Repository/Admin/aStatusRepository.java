package TiShoes.Repository.Admin;

import java.util.List;

import TiShoes.Model.Status;

public interface aStatusRepository {
	public List<Status> getAllStatus();
	public Status getStatusById(int status_id);
}
