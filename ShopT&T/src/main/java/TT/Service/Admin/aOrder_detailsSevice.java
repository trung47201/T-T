package TT.Service.Admin;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import TT.Model.Brand;
import TT.Model.Color;
import TT.Model.Product_color_size;
import TT.Model.Gender;
import TT.Model.Order;
import TT.Model.Order_details;
import TT.Model.Product;
import TT.Model.Role;
import TT.Model.Sizes;
import TT.Model.Status;
import TT.Model.Sub_category;
import TT.Model.User;
import TT.Model.Voucher;
import TT.Repository.Admin.aOrder_detailsRepository;
import TT.Service.User.Product_color_sizeService;
import TT.Service.User.ConnectService;
import TT.Service.User.OrderService;

public class aOrder_detailsSevice implements aOrder_detailsRepository{
	private ConnectService connectService;
	private Order_details order_details;
	private OrderService orderService;
	private Order order;
	private Voucher voucher;
	private Product product;
	private Brand brand;
	private User user;
	private Role role;
	private Sub_category sub_category;
	private Color color;
	private Sizes size;
	private Gender gender;
	private Status status;
	
	@Override
	public List<Order_details> getAllOrder_details() {
		List<Order_details> li = null;
		try {
			connectService = new ConnectService();
			li = new ArrayList<>();
			Connection con = connectService.getConnect();
			Statement stmt;
			stmt = (Statement) con.createStatement();
			ResultSet rs = stmt.executeQuery(
					"select * from order_details " + "Inner join order_ on order_.id = order_details.order_id "
							+ "Inner join status on order_.status_id = status.id "
							+ "Inner join voucher on order_.voucher_id = voucher.id "
							+ "Inner join product on product.id = order_details.prod_id "
							+ "Inner join sizes on sizes.id = order_details.size_id "
							+ "Inner join color on color.id = order_details.color_id "
							+ "Inner join brand on product.brand_id = brand.id "
							+ "Inner join sub_category on product.sub_category_id = sub_category.id "
							+ "Inner join user on product.user_id = user.id "
							+ "Inner join gender on product.gender_id = gender.id "
							+ "Inner join role on role.id = user.role_id " + "group by order_details.id");
			while (rs.next()) {
				order = new Order();
				voucher = new Voucher();
				color = new Color();
				size = new Sizes();
				product = new Product();
				brand = new Brand();
				user = new User();
				role = new Role();
				sub_category = new Sub_category();
				gender = new Gender();
				order_details = new Order_details();
				status = new Status();
				
				status.setId(rs.getInt("status_id"));
				status.setStatus_name(rs.getString("status_name"));

				voucher.setId(rs.getInt("voucher_id"));
				voucher.setCode(rs.getString("code"));
				voucher.setVcdiscount(rs.getInt("vcdiscount"));
				voucher.setLimit(rs.getInt("limit"));
				voucher.setApplyfor(rs.getInt("applyfor"));
				voucher.setStart_date(rs.getTimestamp("start_date"));
				voucher.setEnd_date(rs.getTimestamp("end_date"));
				voucher.setCreated_at(rs.getTimestamp("created_at"));
				voucher.setUpdated_at(rs.getTimestamp("updated_at"));
				voucher.setDescription(rs.getString("description"));

				order.setId(rs.getInt("order_id"));
				order.setFullname(rs.getString("fullname"));
				order.setEmail(rs.getString("email"));
				order.setPhone_number(rs.getString("phone_number"));
				order.setAddress(rs.getString("address"));
				order.setOrder_date(rs.getDate("order_date"));
				order.setUpdated_at(rs.getDate("updated_at"));
				order.setVoucher(voucher);
				order.setDiscount_at(rs.getDouble("discount_at"));
				order.setNote(rs.getString("note"));
				order.setStatus(status);
				order.setMethod(rs.getString("method"));
				order.setRequest(rs.getInt("request"));

				gender.setId(rs.getInt("gender_id"));
				gender.setGender_name(rs.getString("gender_name"));
				gender.setDescription(rs.getString("description"));

				role.setId(rs.getInt("role_id"));
				role.setRole_name(rs.getString("role_name"));

				user.setId(rs.getInt("user_id"));
				user.setFirstname(rs.getString("firstname"));user.setLastname(rs.getString("lastname"));
				user.setEmail(rs.getString("email"));
				user.setPhone_number(rs.getString("phone_number"));
				user.setAddress(rs.getString("address"));
				user.setDistrict(rs.getString("district"));
				user.setCity(rs.getString("city"));
				user.setPassword(rs.getString("password"));
				user.setAvatar(rs.getString("avatar"));
				user.setRole(role);

				brand.setId(rs.getInt("brand_id"));
				brand.setBrand_name(rs.getString("brand_name"));

				sub_category.setId(rs.getInt("sub_category_id"));
				sub_category.setSub_category_name(rs.getString("sub_category_name"));

				color.setId(rs.getInt("color_id"));
				color.setColor_name(rs.getString("color_name"));
				color.setRgb(rs.getString("rgb"));

				size.setId(rs.getInt("size_id"));
				size.setSize_number(rs.getString("size_number"));
				size.setCreated_at(rs.getDate("created_at"));
				size.setUpdated_at(rs.getDate("updated_at"));

				product.setId(rs.getInt("prod_id"));
				product.setTitle(rs.getString("title"));
				product.setPrice(rs.getDouble("price"));
				product.setDiscount(rs.getInt("discount"));
				product.setSub_category(sub_category);
				product.setThumbnail(rs.getString("thumbnail"));
				product.setDescription(rs.getString("description"));
				product.setBrand(brand);
				product.setUser(user);
				product.setCreated_at(rs.getDate("created_at"));
				product.setUpdated_at(rs.getDate("updated_at"));
				product.setPublished_at(rs.getDate("published_at"));
				product.setSold(rs.getInt("sold"));
				product.setMost_loved(rs.getInt("most_loved"));
				product.setGender(gender);

				order_details.setId(rs.getInt("id"));
				order_details.setOrder_(order);
				order_details.setPrice_at(rs.getDouble("price_at"));
				order_details.setQuantity(rs.getInt("quantity"));
				order_details.setProd(product);
				order_details.setSize(size);
				order_details.setColor(color);
				li.add(order_details);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return li;
	}

	//@Override
	public boolean insertIntoOrder_details(double price_at, int quantity, int prod_id, int size_id,
			int color_id) {
		try {
			orderService = new OrderService();
			connectService = new ConnectService();
			Connection conn = connectService.getConnect();
			String sql = "INSERT INTO `order_details`(`order_id`, `price_at`, `quantity`, `prod_id`, `size_id`, `color_id`) "
					+ "VALUES (?, ?, ?, ?, ?, ?)";
			PreparedStatement preparedStmt = (PreparedStatement) conn.prepareStatement(sql);
			preparedStmt.setInt(1, orderService.getLastOrderId());
			preparedStmt.setDouble(2, price_at);
			preparedStmt.setInt(3, quantity);
			preparedStmt.setInt(4, prod_id);
			preparedStmt.setInt(5, size_id);
			preparedStmt.setInt(6, color_id);
			preparedStmt.execute();
			conn.close();
			return true;
		} catch (Exception e) {
			System.err.println("Got an exception!");
			// printStackTrace method
			// prints line numbers + call stack
			e.printStackTrace();
			// Prints what exception has been thrown
			System.out.println(e);
		}
		return false;
	}
	
	
	public List<Order_details> getOrder_detailsByIdOrder(int id_order) {
		List<Order_details> li = new ArrayList<>();
		for (Order_details o : getAllOrder_details()) {
			if(o.getOrder_().getId() == id_order) {
				li.add(o);
				//.out.println(o.getProd().getThumbnail());
			}
			
		}
		
		return li;
	}
	
	public HashMap<Integer, List<Product_color_size>> getListColorByOrder_detail(int id_order) {
		HashMap<Integer, List<Product_color_size>> hm = new HashMap<>();
		Product_color_sizeService c = new Product_color_sizeService();
		for (Order_details o : getAllOrder_details()) {
			if(o.getOrder_().getId() == id_order) {
				hm.put(o.getProd().getId(), c.getAllColorById_prod(o.getProd().getId()));
			}
		}
		
		return hm;
	}
	
	public static void main(String[] args) {
		aOrder_detailsSevice a = new aOrder_detailsSevice();
		HashMap<Integer, List<Product_color_size>> hm = a.getListColorByOrder_detail(4);
		for (Integer i : hm.keySet()) {
			System.out.println(i +": {");
			for (Product_color_size c : hm.get(i)) {
				System.out.printf(c.getColor().getId()+",");
			}
			System.out.println("}");
		}
	}
}
