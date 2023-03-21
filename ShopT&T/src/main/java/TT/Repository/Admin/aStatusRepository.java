package TT.Repository.Admin;

import java.util.List;

import TT.Model.Status;

public interface aStatusRepository {
	public List<Status> getAllStatus();
	public Status getStatusById(int status_id);
}
