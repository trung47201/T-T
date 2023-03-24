package TT.Service.User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import TT.Model.Brand;
import TT.Model.Color;
import TT.Model.Gender;
import TT.Model.Order_;
import TT.Model.Order_details;
import TT.Model.Product;
import TT.Model.Role;
import TT.Model.Sizes;
import TT.Model.Status;
import TT.Model.Style;
import TT.Model.User;
import TT.Model.Voucher;
import TT.Repository.User.Order_detailsRepository;

public class Order_detailsService implements Order_detailsRepository {
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
				voucher.setVcdiscount(rs.getInt("vcdiscount"));
				voucher.setLimit(rs.getInt("limit"));
				voucher.setApplyfor(rs.getInt("applyfor"));
				voucher.setStart_date(rs.getTimestamp("start_date"));
				voucher.setEnd_date(rs.getTimestamp("end_date"));
				voucher.setCreated_at(rs.getTimestamp("created_at"));
				voucher.setUpdated_at(rs.getTimestamp("updated_at"));
				voucher.setDescription(rs.getString("description"));

				order_.setId(rs.getInt("order_id"));
				order_.setFullname(rs.getString("fullname"));
				order_.setEmail(rs.getString("email"));
				order_.setPhone_number(rs.getString("phone_number"));
				order_.setAddress(rs.getString("address"));
				order_.setOrder_date(rs.getDate("order_date"));
				order_.setUpdated_at(rs.getDate("updated_at"));
				order_.setVoucher(voucher);
				order_.setDiscount_at(rs.getDouble("discount_at"));
				order_.setNote(rs.getString("note"));
				order_.setStatus(status);
				order_.setMethod(rs.getString("method"));
				order_.setBill(rs.getString("bill"));
				order_.setRequest(rs.getInt("request"));

				gender.setId(rs.getInt("gender_id"));
				gender.setGender_name(rs.getString("gender_name"));
				gender.setDescription(rs.getString("description"));

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

				brand.setId(rs.getInt("brand_id"));
				brand.setBrand_name(rs.getString("brand_name"));

				style.setId(rs.getInt("style_id"));
				style.setStyle_name(rs.getString("style_name"));

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

	@Override
	public boolean insertIntoOrder_details(double price_at, int quantity, int prod_id, int size_id, int color_id, String phone_number, String email) {
		try {
			orderService = new OrderService();
			connectService = new ConnectService();
			Connection conn = connectService.getConnect();
			String sql = "INSERT INTO `order_details`(`order_id`, `price_at`, `quantity`, `prod_id`, `size_id`, `color_id`) "
					+ "VALUES (?, ?, ?, ?, ?, ?)";
			PreparedStatement preparedStmt = (PreparedStatement) conn.prepareStatement(sql);
			preparedStmt.setInt(1, orderService.get_last_order_id_by(phone_number, email));
			preparedStmt.setDouble(2, (double) Math.round(price_at*100)/100);
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

	public List<Order_details> get_all_order_details_by_order_id(int order_id) {
		List<Order_details> li = new LinkedList<>();
		for (Order_details o : getAllOrder_details()) {
			if (o.getOrder_().getId() == order_id) {
				li.add(o);
			}
		}
		return li;
	}

	public double total_order_by_id_order(int order_id) {
		List<Order_details> li = get_all_order_details_by_order_id(order_id);
		double total = 0;
		for (Order_details o : li) {
			total += o.getPrice_at() * o.getQuantity();
		}
		System.out.println(total);
		return (double) Math.round(total * 100) / 100;
	}

	public double price_when_apply_voucher_by_order_id(int order_id) {
		orderService = new OrderService();
		int discount = orderService.get_voucher_discount_by_order_id(order_id);
		double total = total_order_by_id_order(order_id);
		double rs = (double) discount * total / 100;
		return (double) Math.round(rs * 100) / 100;
	}

	

	public List<Order_details> get_all_order_details_by_user_id(int user_id) {
		orderService = new OrderService();
		List<Order_details> li = new LinkedList<>();
		for (Order_ o : orderService.get_all_order_by_user_id(user_id)) {
			for (Order_details od : get_all_order_details_by_order_id(o.getId())) {
				li.add(od);
			}
		}
		return li;
	}


	public static void main(String[] args) {
		Order_detailsService o = new Order_detailsService();
//		for (Order_details od : o.get_all_order_details_by_user_id(1)) {
//			System.out.println(od.getOrder_().getId());
//		}
		for (Order_details od : o.get_all_order_details_by_order_id(7)) {
			System.out.println(od.getOrder_().getId() +"==" + od.getPrice_at() +"="+od.getProd().getDiscount());
		}
	}
}
