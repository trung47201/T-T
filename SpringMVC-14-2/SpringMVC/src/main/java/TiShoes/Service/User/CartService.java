package TiShoes.Service.User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import TiShoes.Model.Cart;
import TiShoes.Model.Color_size;
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
				cart.setQuantity(rs.getInt("quantity"));
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
				str +=   s+"/";
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
	
	public String Minus_Prod_Card(String id_prod, String list_prod) {
		color_sizeService = new Color_sizeService();
		String newListProd = "";
		HashMap<Color_size, Integer> map = color_sizeService.get_list_color_size_by_string(list_prod);
		for (Color_size i : map.keySet()) {
			if (String.valueOf(i.getId()).equals(id_prod)) {
				if (map.get(i) - 1 == 0) {
					map.remove(i);
				} else {
					map.put(i, map.get(i) - 1);
				}
			}
		}
		for (Color_size i : map.keySet()) {
			newListProd += getTextHM(String.valueOf(i.getId()), map.get(i));
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
	
	public String delete_prod_in_cart_not_login(String id_prod, String list_prod) { //string list_prod format = {csid}/{csid}/{csid}...
		String newListProd = "";
		String arr[] = list_prod.split("/");
		for (int i = 0; i < arr.length; i++) {
			if (!arr[i].equals(id_prod) && !arr[i].equals("")) {
				if(i==0) {
					newListProd += arr[i];
				} else {
					newListProd += "/" + arr[i];
				}
			}
		}
		return newListProd;
	}
	
	public String change_color_in_cart_not_login(String color, String list_prod) { 
		//string list_prod format = {csid}/{csid}/{csid}...
		// color format = {color id}_{prod id}_{cs id}
		color_sizeService = new Color_sizeService();
		String newListProd = "";
		String arr[] = color.split("_");
		if(arr.length > 2) {
			int csid = color_sizeService.get_Color_size_id_by_prodid_color_id(Integer.parseInt(arr[1]), Integer.parseInt(arr[0]));
			String a[] = list_prod.split("/");
			for (String s : a) {
				if(!s.equals("") && !s.equals(arr[2])) {
					newListProd += s +"/";
				} else if(!s.equals("") && s.equals(arr[2])) {
					newListProd += csid +"/";
				}
			}
		}
		return newListProd;
	}
	
	public String change_size_in_cart_not_login(String size, String list_prod) { 
		// string list_prod format = {csid}/{csid}/{csid}...
		// size format = {size id}_{color id}_{prod id}_{cs id}
		color_sizeService = new Color_sizeService();
		String newListProd = "";
		String arr[] = size.split("_");
		if(arr.length > 3) {
			int csid = color_sizeService.get_Color_size_id(Integer.parseInt(arr[0]), Integer.parseInt(arr[1]), Integer.parseInt(arr[2]));
			String a[] = list_prod.split("/");
			for (String s : a) {
				if(!s.equals("") && !s.equals(arr[3])) {
					newListProd += s +"/";
				} else if(!s.equals("") && s.equals(arr[3])) {
					newListProd += csid +"/";
				}
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
				if (arr1.length > 1) {
					map.put(Integer.parseInt(arr1[1]), Integer.parseInt(arr1[0]));
				} else {
					if (!arr1[0].equals("")) {
						map.put(1, Integer.parseInt(arr1[0]));
					}
				}
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
				if (arr1.length > 2) {
					map.put(arr1[1] + "_" + arr1[2], Integer.parseInt(arr1[0]));
				}

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

	public boolean plus_product_in_cart_by_cart_id(int id) {
		try {
			connectService = new ConnectService();
			Connection conn = connectService.getConnect();
			String query = "UPDATE `cart` SET `quantity`= `quantity` + 1 WHERE id = ?";
			PreparedStatement preparedStmt = (PreparedStatement) conn.prepareStatement(query);
			preparedStmt.setInt(1, id);
			preparedStmt.executeUpdate();
			conn.close();
			return true;
		} catch (Exception e) {
			System.err.println("Got an exception!");
			e.printStackTrace();
			System.out.println(e);
		}
		return false;
	}

	public boolean minus_product_in_cart_by_cart_id(int id) {
		try {
			connectService = new ConnectService();
			Connection conn = connectService.getConnect();
			if (get_quantity_by_cart_id(id) > 1) {
				String query = "UPDATE `cart` SET `quantity`= `quantity` - 1 WHERE id = ?";
				PreparedStatement preparedStmt = (PreparedStatement) conn.prepareStatement(query);
				preparedStmt.setInt(1, id);
				preparedStmt.executeUpdate();
				conn.close();
				return true;
			} else {
				if (delete_cart_by_cart_id(id)) {
					return true;
				}
			}

		} catch (Exception e) {
			System.err.println("Got an exception!");
			e.printStackTrace();
			System.out.println(e);
		}
		return false;
	}

	public boolean delete_cart_by_cart_id(int id) {
		try {
			connectService = new ConnectService();
			Connection conn = connectService.getConnect();

			String query = "DELETE FROM `cart` WHERE id = ?";
			PreparedStatement preparedStmt = (PreparedStatement) conn.prepareStatement(query);
			preparedStmt.setInt(1, id);
			preparedStmt.executeUpdate();
			conn.close();
			return true;

		} catch (Exception e) {
			System.err.println("Got an exception!");
			e.printStackTrace();
			System.out.println(e);
		}
		return false;
	}

	public int get_quantity_by_cart_id(int id) {
		int rs = 0;
		List<Cart> li = getAllCart();
		for (Cart cart : li) {
			if (cart.getId() == id) {
				rs = cart.getQuantity();
			}
		}
		return rs;
	}

	public boolean update_color_in_cart_by_string(String s) { // string = "{colorid}_{prodid}_{cartid}"
		try {
			connectService = new ConnectService();
			Connection conn = connectService.getConnect();
			color_sizeService = new Color_sizeService();
			String arr[] = s.split("_");
			int size_id = 0;
			int color_id = 0;
			int prod_id = 0;
			int cart_id = 0;
			int color_size_id = 0;
			if (arr.length > 1) {
				color_id = Integer.parseInt(arr[0]);
				prod_id = Integer.parseInt(arr[1]);
				cart_id = Integer.parseInt(arr[2]);
				size_id = color_sizeService.firstSizeId(prod_id, color_id);
				color_size_id = color_sizeService.get_Color_size_id(size_id, color_id, prod_id);
			}

			String query = "UPDATE `cart` SET `color_size_id`= ? WHERE id = ?";
			PreparedStatement preparedStmt = (PreparedStatement) conn.prepareStatement(query);
			preparedStmt.setInt(1,color_size_id);
			preparedStmt.setInt(2, cart_id);
			preparedStmt.executeUpdate();
			conn.close();
			return true;
		} catch (Exception e) {
			System.err.println("Got an exception!");
			e.printStackTrace();
			System.out.println(e);
		}
		return false;
	}
	
	public boolean update_size_in_cart_by_string(String s) { // string = "{sizeid}_{colorid}_{prodid}_{cartid}"
		try {
			connectService = new ConnectService();
			Connection conn = connectService.getConnect();
			color_sizeService = new Color_sizeService();
			String arr[] = s.split("_");
			int size_id = 0;
			int color_id = 0;
			int prod_id = 0;
			int cart_id = 0;
			int color_size_id = 0;
			if (arr.length > 2) {
				size_id = Integer.parseInt(arr[0]);
				color_id = Integer.parseInt(arr[1]);
				prod_id = Integer.parseInt(arr[2]);
				cart_id = Integer.parseInt(arr[3]);
				color_size_id = color_sizeService.get_Color_size_id(size_id, color_id, prod_id);
			}
			String query = "UPDATE `cart` SET `color_size_id`= ? WHERE id = ?";
			PreparedStatement preparedStmt = (PreparedStatement) conn.prepareStatement(query);
			preparedStmt.setInt(1,color_size_id);
			preparedStmt.setInt(2, cart_id);
			preparedStmt.executeUpdate();
			conn.close();
			return true;
		} catch (Exception e) {
			System.err.println("Got an exception!");
			e.printStackTrace();
			System.out.println(e);
		}
		return false;
	}
	
	public Cart get_cart_by_cart_id(int id) {
		List<Cart> liAll = getAllCart();
		for (Cart c : liAll) {
			if(c.getId() == id) {
				return c;
			}
		}
		return null;
	}
	
	public List<Cart> get_all_cart_by_string(String id) { // string = {cartid}_{cartid}_{cartid} ...
		List<Cart> li = new LinkedList<>();
		String arr[] = id.split("_");
		if(arr.length > 0) {
			for (String s : arr) {
				if(s != null && !s.equals("")) {
					li.add(get_cart_by_cart_id(Integer.parseInt(s)));
				}
			}
		}
		return li;
	}

	public static void main(String[] args) {
		CartService c = new CartService();
//		c.insertIntoCartDB(1, 1, 3);
		
		
		System.out.println(c.change_size_in_cart_not_login("15_2_6_73", "455/441/157/157/73/73/73/73/"));
		
	}
}
