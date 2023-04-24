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
import TT.Model.Receipt;
import TT.Model.Receipt_details;
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
import TT.Service.User.ReceiptService;

public class aReceipt_detailsSevice implements aOrder_detailsRepository {
	private ConnectService connectService;
	private Receipt_details receipt_details;
	private ReceiptService receiptService;
	private Receipt receipt;
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
	public List<Receipt_details> getAllOrder_details() {
		List<Receipt_details> li = null;
		try {
			connectService = new ConnectService();
			li = new ArrayList<>();
			Connection con = connectService.getConnect();
			Statement stmt;
			stmt = (Statement) con.createStatement();
			ResultSet rs = stmt.executeQuery(
					"select * from receipt_details " + "Inner join receipt on receipt.id = receipt_details.receipt_id "
							+ "Inner join status on receipt.status_id = status.id "
							+ "Inner join voucher on receipt.voucher_id = voucher.id "
							+ "Inner join product on product.id = receipt_details.prod_id "
							+ "Inner join sizes on sizes.id = receipt_details.size_id "
							+ "Inner join color on color.id = receipt_details.color_id "
							+ "Inner join brand on product.brand_id = brand.id "
							+ "Inner join sub_category on product.sub_category_id = sub_category.id "
							+ "Inner join user on product.user_id = user.id "
							+ "Inner join gender on product.gender_id = gender.id "
							+ "Inner join role on role.id = user.role_id " + "group by receipt_details.id");
			while (rs.next()) {
				receipt = new Receipt();
				voucher = new Voucher();
				color = new Color();
				size = new Sizes();
				product = new Product();
				brand = new Brand();
				user = new User();
				role = new Role();
				sub_category = new Sub_category();
				gender = new Gender();
				receipt_details = new Receipt_details();
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

				receipt.setId(rs.getInt("receipt_id"));
				receipt.setFullname(rs.getString("fullname"));
				receipt.setEmail(rs.getString("email"));
				receipt.setPhone_number(rs.getString("phone_number"));
				receipt.setAddress(rs.getString("address"));
				receipt.setOrder_date(rs.getDate("order_date"));
				receipt.setUpdated_at(rs.getDate("updated_at"));
				receipt.setVoucher(voucher);
				receipt.setDiscount_at(rs.getDouble("discount_at"));
				receipt.setNote(rs.getString("note"));
				receipt.setStatus(status);
				receipt.setMethod(rs.getString("method"));
				receipt.setRequest(rs.getInt("request"));

				gender.setId(rs.getInt("gender_id"));
				gender.setGender_name(rs.getString("gender_name"));
				gender.setDescription(rs.getString("description"));

				role.setId(rs.getInt("role_id"));
				role.setRole_name(rs.getString("role_name"));

				user.setId(rs.getInt("user_id"));
				user.setFirstname(rs.getString("firstname"));
				user.setLastname(rs.getString("lastname"));
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

				receipt_details.setId(rs.getInt("id"));
				receipt_details.setReceipt(receipt);
				receipt_details.setPrice_at(rs.getDouble("price_at"));
				receipt_details.setQuantity(rs.getInt("quantity"));
				receipt_details.setProd(product);
				receipt_details.setSize(size);
				receipt_details.setColor(color);
				li.add(receipt_details);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return li;
	}

	// @Override
	public boolean insertIntoOrder_details(double price_at, int quantity, int prod_id, int size_id, int color_id) {
		try {
			receiptService = new ReceiptService();
			connectService = new ConnectService();
			Connection conn = connectService.getConnect();
			String sql = "INSERT INTO `order_details`(`order_id`, `price_at`, `quantity`, `prod_id`, `size_id`, `color_id`) "
					+ "VALUES (?, ?, ?, ?, ?, ?)";
			PreparedStatement preparedStmt = (PreparedStatement) conn.prepareStatement(sql);
			preparedStmt.setInt(1, receiptService.getLastOrderId());
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

	public List<Receipt_details> getOrder_detailsByIdOrder(int id_order) {
		List<Receipt_details> li = new ArrayList<>();
		for (Receipt_details o : getAllOrder_details()) {
			if (o.getReceipt().getId() == id_order) {
				li.add(o);
				// .out.println(o.getProd().getThumbnail());
			}
		}
		return li;
	}

	public HashMap<Integer, List<Product_color_size>> getListColorByOrder_detail(int id_order) {
		HashMap<Integer, List<Product_color_size>> hm = new HashMap<>();
		Product_color_sizeService c = new Product_color_sizeService();
		for (Receipt_details o : getAllOrder_details()) {
			if (o.getReceipt().getId() == id_order) {
				hm.put(o.getProd().getId(), c.getAllColorById_prod(o.getProd().getId()));
			}
		}

		return hm;
	}

	public int get_qty_product_by_order_id(int id_order) {
		int qty = 0;
		List<Receipt_details> li = getOrder_detailsByIdOrder(id_order);
		for (Receipt_details r : li) {
			qty += r.getQuantity();
		}
		return qty;
	}
	
	public double get_revenue_order_by_order_id(int id_order) {
		aReceiptService aReceiptService = new aReceiptService();
		double qty = 0;
		List<Receipt_details> li = getOrder_detailsByIdOrder(id_order);
		for (Receipt_details r : li) {
			qty += r.getPrice_at();
		}
		return qty-aReceiptService.get_discount_by_order_id(id_order);
	}

	public static void main(String[] args) {
		aReceipt_detailsSevice a = new aReceipt_detailsSevice();
		System.out.println(a.get_qty_product_by_order_id(187));
	}
}
