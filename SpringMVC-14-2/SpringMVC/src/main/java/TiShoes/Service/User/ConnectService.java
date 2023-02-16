package TiShoes.Service.User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import TiShoes.Repository.User.ConnectRepository;

public class ConnectService implements ConnectRepository {

	@Override
	public Connection getConnect() {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/TiShoes", "root", "");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}

}
