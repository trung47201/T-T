package TiShoes.Service.User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Statement;

import TiShoes.Model.Sizes;
import TiShoes.Repository.User.SizeRepository;

public class SizeService implements SizeRepository {
	private ConnectService connectService;
	private Sizes size;

	@Override
	public List<Sizes> getAllSize() {
		List<Sizes> li = null;
		try {
			connectService = new ConnectService();
			li = new ArrayList<>();
			Connection con = connectService.getConnect();
			Statement stmt;
			stmt = (Statement) con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from sizes");
			while (rs.next()) {
				size = new Sizes();
				size.setId(rs.getInt("id"));
				size.setSize_number(rs.getInt("size_number"));
				size.setCreated_at(rs.getDate("created_at"));
				size.setUpdated_at(rs.getDate("updated_at"));
				li.add(size);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return li;
	}

	@Override
	public Sizes getSizeById(int size_id) {
		SizeService ss = new SizeService();
		List<Sizes> li = ss.getAllSize();
		Sizes s = new Sizes();
		;
		for (Sizes sizes : li) {
			if (sizes.getId() == size_id) {
				s = sizes;
			}
		}
		return s;
	}

	public int get_size_id_by_size_number(int size_number) {
		int id = 0;
		for (Sizes sizes : getAllSize()) {
			if (sizes.getSize_number() == size_number) {
				id = sizes.getId();			}
		}
		return id;
	}
}
