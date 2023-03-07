package TiShoes.Service.User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.mysql.jdbc.Statement;

import TiShoes.Model.Color;
import TiShoes.Model.Color_size;
import TiShoes.Model.Order_;
import TiShoes.Model.Order_details;
import TiShoes.Model.Product;
import TiShoes.Model.Sizes;
import TiShoes.Repository.User.CheckoutRepository;

public class CheckoutService implements CheckoutRepository {
	private ConnectService connectService;
	private OrderService orderService;
	private Order_detailsService order_detailsService;
	private ProductService productService;
	private VoucherService voucherService;

	@Override
	public List<Color> getRgbById_prod(int id_prod) {
		List<Color> li = null;
		Color color = null;
		try {
			li = new ArrayList<>();
			connectService = new ConnectService();
			Connection con = connectService.getConnect();
			Statement stmt;
			stmt = (Statement) con.createStatement();
			ResultSet rs = stmt.executeQuery("select rgb, color_name, color.id, color_size.prod_id from color "
					+ "Inner join color_size on color.id = color_size.color_id " + "Where prod_id=" + id_prod
					+ " Group by rgb");
			while (rs.next()) {
				color = new Color();
				color.setId(rs.getInt("id"));
				color.setColor_name(rs.getString("color_name"));
				color.setRgb(rs.getString("rgb"));
				li.add(color);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return li;
	}

	@Override
	public List<Color_size> getSizeId_prod(int prod_id, int color_id) {
		List<Color_size> li = null;
		Color_size color_size = null;
		Sizes size = null;
		try {
			li = new ArrayList<>();
			connectService = new ConnectService();
			Connection con = connectService.getConnect();
			Statement stmt;
			stmt = (Statement) con.createStatement();
			ResultSet rs = stmt.executeQuery(
					"select color_size.id, color_size.size_id, color_size.prod_id, color_size.color_id, color_size.quantity, size_number, created_at, updated_at from sizes "
							+ "Inner join color_size on sizes.id = color_size.size_id " + "Where prod_id=" + prod_id
							+ " and color_id=" + color_id);
			while (rs.next()) {
				size = new Sizes();
				color_size = new Color_size();
				size.setId(rs.getInt("size_id"));
				size.setSize_number(rs.getInt("size_number"));
				size.setCreated_at(rs.getDate("created_at"));
				size.setUpdated_at(rs.getDate("updated_at"));
				color_size.setId(rs.getInt("id"));
				color_size.setSize(size);

				color_size.setQuantity(rs.getInt("quantity"));
				li.add(color_size);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return li;
	}

	@Override
	public int firstColor(int prod_id) {
		int color_id = 0;
		try {
			connectService = new ConnectService();
			Connection con = connectService.getConnect();
			Statement stmt;
			stmt = (Statement) con.createStatement();
			ResultSet rs = stmt.executeQuery(
					"select color_size.id, color_size.size_id, color_size.prod_id, color_size.color_id, color_size.quantity, size_number, created_at, updated_at from sizes "
							+ "Inner join color_size on sizes.id = color_size.size_id " + "Where prod_id=" + prod_id);
			while (rs.next()) {
				color_id = rs.getInt("color_id");
				break;
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return color_id;
	}

	@Override
	public List<Product> getListProductByString(String txt) {
		List<Product> li = new ArrayList<>();
		String arr[] = txt.split("/");
		for (int i = 0; i < arr.length; i++) {
			String prod[] = arr[i].split("_");
			ProductService productService = new ProductService();
			Product p = productService.getProduct(Integer.parseInt(prod[0]));
			li.add(p);
		}
		return li;
	}

	@Override
	public HashMap<Integer, Color> getListColorByString(String txt) {
		HashMap<Integer, Color> hm = new HashMap<>();

		String arr[] = txt.split("/");
		for (int i = 0; i < arr.length; i++) {
			String prod[] = arr[i].split("_");
			ColorService colorService = new ColorService();
			Color c = colorService.getColorById(Integer.parseInt(prod[1]));
			hm.put(Integer.parseInt(prod[0]), c);
		}
		return hm;
	}

	@Override
	public HashMap<Integer, Sizes> getListSizeByString(String txt) {
		HashMap<Integer, Sizes> hm = new HashMap<>();

		String arr[] = txt.split("/");
		for (int i = 0; i < arr.length; i++) {
			String prod[] = arr[i].split("_");
			SizeService sizeService = new SizeService();
			Sizes c = sizeService.getSizeById(Integer.parseInt(prod[2]));
			hm.put(Integer.parseInt(prod[0]), c);
		}
		return hm;
	}

	@Override
	public HashMap<Integer, Integer> getListAmountByString(String txt) {
		HashMap<Integer, Integer> hm = new HashMap<>();
		String arr[] = txt.split("/");
		for (int i = 0; i < arr.length; i++) {
			String prod[] = arr[i].split("_");
			hm.put(Integer.parseInt(prod[0]), Integer.parseInt(prod[3]));
		}
		return hm;
	}

	@Override
	public Double getTotalPaymentByString(String txt) {
		Double t = 0.0;

		String arr[] = txt.split("/");
		for (int i = 0; i < arr.length; i++) {
			String prod[] = arr[i].split("_");
			Double am = Double.parseDouble(prod[3]);
			ProductService productService = new ProductService();
			Product p = productService.getProduct(Integer.parseInt(prod[0]));
			if (p.getDiscount() > 0) {
				t += p.getPrice() * am - p.getPrice() * am * p.getDiscount() / 100;
			} else {
				t += p.getPrice() * am;
			}
		}
		return t;
	}

//	@Override
	public boolean checkout_buynow(int id_prod, int amount, int id_size, int id_color, String fullname, String email,
			String phone_number, String address, int voucher_id, String note, String method, double price_at) {

		orderService = new OrderService();
		order_detailsService = new Order_detailsService();

		if (orderService.insertIntoOrder_not_login(fullname, email, phone_number, address, voucher_id, note, method) == true
				&& order_detailsService.insertIntoOrder_details(price_at, amount, id_prod, id_size, id_color) == true) {
			return true;
		} else {
			return false;
		}
	}

	public String removeProductFromCartAfterCheckout(int id_prod, String txt) {
		String s = "";
		String a[] = txt.split("/");
		for (String str : a) {
			if (!str.equals(String.valueOf(id_prod)) && !str.equals("")) {
				s += str + "/";
			}
		}
		return s;
	}

	public double get_price_at(int quantity, String code, int id_prod) {
		productService = new ProductService();
		voucherService = new VoucherService();
		Product p = productService.getProduct(id_prod);

		double price = 0;
		double total = 0;
		int vc_discount = voucherService.get_discount_by_voucher_code(code);

		if (vc_discount > 0) {
			if (p.getDiscount() > 0) {
				price = p.getPrice() * quantity - p.getPrice() * quantity * p.getDiscount() / 100;
				total = price - price * vc_discount / 100;
			} else {
				price = p.getPrice() * quantity;
				total = price - price * vc_discount / 100;
			}
		} else {
			if (p.getDiscount() > 0) {
				price = p.getPrice() * quantity - p.getPrice() * quantity * p.getDiscount() / 100;
				total = price;
			} else {
				price = p.getPrice() * quantity;
				total = price;
			}
		}
		return total;
	}

	public boolean check_status_order_await(String phone, String email, double price_at, int quantity, int prod_id,
			int size_id, int color_id) {
		price_at = (double) Math.round(price_at*100)/100;
		orderService = new OrderService();
		order_detailsService = new Order_detailsService();
		int order_id = orderService.get_order_id_by(phone, email);
		List<Order_details> li = order_detailsService.getAllOrder_details();
		for (Order_details o : li) {
			if(o.getOrder_().getId() == order_id && o.getPrice_at()==price_at && o.getQuantity() == quantity && o.getProd().getId() == prod_id && o.getSize().getId() == size_id && o.getColor().getId() == color_id) {
				return true;
			}
		}
		return false;
	}
	
	public double get_discount_at(int quantity, String code, int id_prod) {
		productService = new ProductService();
		voucherService = new VoucherService();
		Product p = productService.getProduct(id_prod);

		double price = 0;
		double discount_at = 0;
		int vc_discount = voucherService.get_discount_by_voucher_code(code);

		if (vc_discount > 0) {
			if (p.getDiscount() > 0) {
				price = p.getPrice() * quantity - p.getPrice() * quantity * p.getDiscount() / 100;
				discount_at = price * vc_discount / 100;
			} else {
				price = p.getPrice() * quantity;
				discount_at = price * vc_discount / 100;
			}
		}
		return discount_at;
	}

	public static void main(String[] args) {
		CheckoutService c = new CheckoutService();
		System.out.println(c.get_discount_at(1, "TS666", 25));
		// System.out.println(removeProductFromCartAfterCheckout(3, "3//4/3"));
	}

}
