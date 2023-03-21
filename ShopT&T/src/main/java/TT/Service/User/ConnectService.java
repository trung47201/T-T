package TT.Service.User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import TT.Repository.User.ConnectRepository;

public class ConnectService implements ConnectRepository {

	@Override
	public Connection getConnect() {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/t&t", "root", "");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}

}
