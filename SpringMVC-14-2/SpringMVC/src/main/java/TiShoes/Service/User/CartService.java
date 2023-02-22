package TiShoes.Service.User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import TiShoes.Model.Cart;
import TiShoes.Model.Product;
import TiShoes.Model.Role;
import TiShoes.Model.User;
import TiShoes.Repository.User.CartRepository;

public class CartService implements CartRepository {

	private ProductService productService;
	private ConnectService connectService;
	private Color_sizeService color_sizeService;
	private Cart cart;
	private User user;
	private Role role;

	public List<Cart> getAllCart() {
		List<Cart> li = null;
		try {
			color_sizeService = new Color_sizeService();
			connectService = new ConnectService();
			li = new ArrayList<>();
			Connection con = connectService.getConnect();
			Statement stmt;
			stmt = (Statement) con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from cart " + "Inner join user on cart.user_id = user.id "
					+ "Inner join role on role.id = user.role_id " + "group by cart.id");
			while (rs.next()) {
				cart = new Cart();
				user = new User();
				role = new Role();

				role.setId(rs.getInt("role_id"));
				role.setRole_name(rs.getString("role_name"));
				role.setDescription(rs.getString("description"));
				role.setCreated_at(rs.getDate("created_at"));
				role.setUpdated_at(rs.getDate("updated_at"));
				
				user.setId(rs.getInt("user_id"));
				user.setFullname(rs.getString("fullname"));
				user.setEmail(rs.getString("email"));
				user.setPhone_number(rs.getString("phone_number"));
				user.setAddress(rs.getString("address"));
				user.setPassword(rs.getString("password"));
				user.setAvatar(rs.getString("avatar"));
				user.setRole(role);

				cart.setId(rs.getInt("id"));
				cart.setpQuantity(rs.getInt("quantity"));
				cart.setColor_size(color_sizeService.getByIdCS(rs.getInt("color_size_id")));
				cart.setUser(user);
				cart.setCreated_at(rs.getDate("created_at"));
				cart.setUpdated_at(rs.getDate("updated_at"));
				li.add(cart);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return li;
	}

	@Override
	public HashMap<String, Integer> getListProdCard(String str) {
		String arr[] = str.split("/");
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		for (int i = 0; i < arr.length; i++) {
			if (!arr[i].equals("")) {
				if (!map.containsKey(arr[i])) {
					map.put(arr[i], 1);
				} else {
					map.put(arr[i], map.get(arr[i]) + 1);
				}
			}
		}
		return map;
	}

	@Override
	public String PlusProdCard(String id_prod, String list_prod) {
		String newListProd = "";
		String arr1[] = id_prod.split("_");
		newListProd = list_prod + "/" + arr1[0].toString();
		return newListProd;
	}

	public String getTextHM(String s, int num) {
		String str = "";
		for (int i = 0; i < num; i++) {
			str += s + "/";
		}
		return str;
	}

	@Override
	public String MinusProdCard(String id_prod, String list_prod) {
		String newListProd = "";
		String arr1[] = id_prod.split("_");
		HashMap<String, Integer> map = getListProdCard(list_prod);
		for (String i : map.keySet()) {
			if (i.equals(arr1[0])) {
				if (map.get(i) - 1 == 0) {
					map.remove(i);
				} else {
					map.put(i, map.get(i) - 1);
				}
			}
		}
		for (String i : map.keySet()) {
			newListProd += getTextHM(i, map.get(i));
		}
		return newListProd;
	}

	@Override
	public String DelProdCard(String id_prod, String list_prod) {
		String newListProd = "";
		String arr[] = list_prod.split("/");
		String arr1[] = id_prod.split("_");
		for (int i = 0; i < arr.length; i++) {
			if (!arr[i].equals(arr1[0]) && !arr[i].equals("")) {
				newListProd += arr[i] + "/";
			}
		}
		return newListProd;
	}

	@Override
	public double TotalProdCard(Product p, String amount) {
		double total = 0;
		if (p.getDiscount() > 0) {
			total = p.getPrice() * Double.parseDouble(amount)
					- p.getPrice() * Double.parseDouble(amount) * p.getDiscount() / 100;
		} else if (p.getDiscount() <= 0) {
			total = p.getPrice() * Double.parseDouble(amount);
		}
		return total;
	}

	public double totalProd(String prod) {
		productService = new ProductService();

		String arr[] = prod.split("/");
		double total = 0;
		for (int i = 0; i < arr.length; i++) {
			String arr2[] = arr[i].split("_");
			Product p = productService.getProduct(Integer.parseInt(arr2[0]));
			if (p.getDiscount() > 0) {
				total += p.getPrice() * Integer.parseInt(arr2[1])
						- p.getPrice() * Integer.parseInt(arr2[1]) * p.getDiscount() / 100;
			} else {
				total += p.getPrice() * Integer.parseInt(arr2[1]);
			}

		}
		return total;
	}

	public List<Integer> listProd_id(String prod) {
		productService = new ProductService();
		List<Integer> li = new ArrayList<>();
		String arr[] = prod.split("/");
		for (int i = 0; i < arr.length; i++) {
			String arr2[] = arr[i].split("_");
			li.add(Integer.parseInt(arr2[0]));
		}
		return li;
	}

	public HashMap<Integer, Integer> getProd_Color_Size(String sColor) {
		String arr[] = sColor.split("/");
		HashMap<Integer, Integer> map = new HashMap<>();
		for (int i = 0; i < arr.length; i++) {
			if (!arr[i].equals("null")) {
				String arr1[] = arr[i].split("_");
				map.put(Integer.parseInt(arr1[1]), Integer.parseInt(arr1[0]));
			}
		}
		return map;
	}

	public HashMap<String, Integer> getProd_Color_Sizes(String sSize) {
		String arr[] = sSize.split("/");
		HashMap<String, Integer> map = new HashMap<>();
		for (int i = 0; i < arr.length; i++) {
			if (!arr[i].equals("null")) {
				String arr1[] = arr[i].split("_");
				map.put(arr1[1] + "_" + arr1[2], Integer.parseInt(arr1[0]));
			}
		}
		return map;
	}

	public String getTxt(String color, String value) {
		String s1[] = value.split("/");
		String c[] = color.split("_");
		String rs = "";
		for (String s : s1) {
			String v[] = s.split("_");
			if (v[1].equals(c[1])) {
				rs = value.replace(s, color);
			}
		}
		if (rs.isEmpty()) {
			if (!value.contains(color)) {
				rs = value + "/" + color;
				return rs;
			} else {
				return value;
			}
		} else {
			return rs;
		}
	}

	public String getTxt_size(String size, String value) {
		String s1[] = value.split("/");
		String s[] = size.split("_");
		String rs = "";
		for (String str : s1) {
			String v[] = str.split("_");
			if (v[2].equals(s[2])) {
				rs = value.replace(str, size);
			}
		}
		if (rs.isEmpty()) {
			if (!value.contains(size)) {
				rs = value + "/" + size;
				return rs;
			} else {
				return value;
			}
		} else {
			return rs;
		}
	}

	public boolean insertIntoCartDB(int quantity, int color_size_id, int user_id) {
		try {
			java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
			connectService = new ConnectService();
			Connection conn = connectService.getConnect();
			boolean check = false;
			for (Cart c : getAllCart()) {
				if (c.getColor_size().getId() == color_size_id && c.getUser().getId() == user_id) {
					check = true;
				}
			}

			if (check) {
				String query = "update cart set quantity = quantity + 1 where color_size_id = ? and user_id = ?";
				PreparedStatement preparedStmt = (PreparedStatement) conn.prepareStatement(query);
				preparedStmt.setInt(1, color_size_id);
				preparedStmt.setInt(2, user_id);
				preparedStmt.executeUpdate();
				conn.close();
				return true;
			} else {
				String sql = "INSERT INTO `cart`(`quantity`, `color_size_id`, `user_id`, `created_at`, `updated_at`) "
						+ "VALUES (?, ?, ?, ?, ?)";
				PreparedStatement preparedStmt = (PreparedStatement) conn.prepareStatement(sql);
				preparedStmt.setInt(1, quantity);
				preparedStmt.setInt(2, color_size_id);
				preparedStmt.setInt(3, user_id);
				preparedStmt.setTimestamp(4, date);
				preparedStmt.setTimestamp(5, date);
				preparedStmt.execute();
				conn.close();
				return true;
			}

		} catch (Exception e) {
			System.err.println("Got an exception!");
			e.printStackTrace();
			System.out.println(e);
		}
		return false;
	}

	public static void main(String[] args) {
//		CartService c = new CartService();
//		c.insertIntoCartDB(1, 1, 3);
	}
}
