package TiShoes.Service.Admin;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import TiShoes.Model.Brand;
import TiShoes.Model.Color;
import TiShoes.Model.Color_size;
import TiShoes.Model.Gender;
import TiShoes.Model.Order_;
import TiShoes.Model.Order_details;
import TiShoes.Model.Product;
import TiShoes.Model.Role;
import TiShoes.Model.Sizes;
import TiShoes.Model.Status;
import TiShoes.Model.Style;
import TiShoes.Model.User;
import TiShoes.Model.Voucher;
import TiShoes.Repository.Admin.aOrder_detailsRepository;
import TiShoes.Service.User.Color_sizeService;
import TiShoes.Service.User.ConnectService;
import TiShoes.Service.User.OrderService;

public class aOrder_detailsSevice implements aOrder_detailsRepository{
	private ConnectService connectService;
	private Order_details order_details;
	private OrderService orderService;
	private Order_ order_;
	private Voucher voucher;
	private Product product;
	private Brand brand;
	private User user;
	private Role role;
	private Style style;
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
							+ "Inner join style on product.style_id = style.id "
							+ "Inner join user on product.user_id = user.id "
							+ "Inner join gender on product.gender_id = gender.id "
							+ "Inner join role on role.id = user.role_id " + "group by order_details.id");
			while (rs.next()) {
				order_ = new Order_();
				voucher = new Voucher();
				color = new Color();
				size = new Sizes();
				product = new Product();
				brand = new Brand();
				user = new User();
				role = new Role();
				style = new Style();
				gender = new Gender();
				order_details = new Order_details();
				status = new Status();
				
				status.setId(rs.getInt("status_id"));
				status.setStatus_name(rs.getString("status_name"));

				voucher.setId(rs.getInt("voucher_id"));
				voucher.setCode(rs.getString("code"));
				voucher.setDiscount(rs.getInt("discount"));
				voucher.setLimit(rs.getInt("limit"));
				voucher.setStart_date(rs.getDate("start_date"));
				voucher.setEnd_date(rs.getDate("end_date"));
				voucher.setCreated_at(rs.getDate("created_at"));
				voucher.setUpdated_at(rs.getDate("updated_at"));
				voucher.setDescription(rs.getString("description"));

				order_.setId(rs.getInt("order_id"));
				order_.setFullname(rs.getString("fullname"));
				order_.setEmail(rs.getString("email"));
				order_.setPhone_number(rs.getString("phone_number"));
				order_.setAddress(rs.getString("address"));
				order_.setOrder_date(rs.getDate("order_date"));
				order_.setUpdated_at(rs.getDate("updated_at"));
				order_.setVoucher(voucher);
				order_.setNote(rs.getString("note"));
				order_.setStatus(status);
				order_.setMethod(rs.getString("method"));

				gender.setId(rs.getInt("gender_id"));
				gender.setGender_name(rs.getString("gender_name"));
				gender.setDescription(rs.getString("description"));

				role.setId(rs.getInt("role_id"));
				role.setRole_name(rs.getString("role_name"));

				user.setId(rs.getInt("user_id"));
				user.setFullname(rs.getString("fullname"));
				user.setEmail(rs.getString("email"));
				user.setPhone_number(rs.getString("phone_number"));
				user.setAddress(rs.getString("address"));
				user.setPassword(rs.getString("password"));
				user.setAvatar(rs.getString("avatar"));
				user.setRole(role);

				brand.setId(rs.getInt("brand_id"));
				brand.setBrand_name(rs.getString("brand_name"));

				style.setId(rs.getInt("style_id"));
				style.setStyle_name(rs.getString("style_name"));

				color.setId(rs.getInt("color_id"));
				color.setColor_name(rs.getString("color_name"));
				color.setRgb(rs.getString("rgb"));

				size.setId(rs.getInt("size_id"));
				size.setSize_number(rs.getInt("size_number"));
				size.setCreated_at(rs.getDate("created_at"));
				size.setUpdated_at(rs.getDate("updated_at"));

				product.setId(rs.getInt("prod_id"));
				product.setTitle(rs.getString("title"));
				product.setPrice(rs.getDouble("price"));
				product.setDiscount(rs.getInt("discount"));
				product.setStyle(style);
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
				order_details.setOrder_(order_);
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
	
	public HashMap<Integer, List<Color_size>> getListColorByOrder_detail(int id_order) {
		HashMap<Integer, List<Color_size>> hm = new HashMap<>();
		Color_sizeService c = new Color_sizeService();
		for (Order_details o : getAllOrder_details()) {
			if(o.getOrder_().getId() == id_order) {
				hm.put(o.getProd().getId(), c.getAllColorById_prod(o.getProd().getId()));
			}
		}
		
		return hm;
	}
	
	public static void main(String[] args) {
		aOrder_detailsSevice a = new aOrder_detailsSevice();
		HashMap<Integer, List<Color_size>> hm = a.getListColorByOrder_detail(4);
		for (Integer i : hm.keySet()) {
			System.out.println(i +": {");
			for (Color_size c : hm.get(i)) {
				System.out.printf(c.getColor().getId()+",");
			}
			System.out.println("}");
		}
	}
}
