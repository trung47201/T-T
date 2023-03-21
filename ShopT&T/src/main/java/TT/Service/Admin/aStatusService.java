package TT.Service.Admin;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Statement;

import TT.Model.Status;
import TT.Repository.Admin.aStatusRepository;
import TT.Service.User.ConnectService;

public class aStatusService implements aStatusRepository{
	private ConnectService connectService;
	private Status status;
	
	@Override
	public List<Status> getAllStatus() {
		List<Status> li= null;
		try {
			connectService = new ConnectService();
			li = new ArrayList<>();
			Connection con = connectService.getConnect();
			Statement stmt;
			stmt = (Statement) con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from status");
			while (rs.next()) {
				status = new Status();
				status.setId(rs.getInt("id"));
				status.setStatus_name(rs.getString("status_name"));
				
				li.add(status);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return li;
	}

	@Override
	public Status getStatusById(int status_id) {
		Status st = new Status();
		for (Status s : getAllStatus()) {
			if (s.getId() == status_id) {
				st = s;
			}
		}
		return st;
	}

}
