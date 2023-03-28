package TT.Service.User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import com.mysql.jdbc.Statement;

import TT.Model.Color;
import TT.Model.Product;
import TT.Model.Product_color_size;
import TT.Model.Sizes;
import TT.Repository.User.CheckoutRepository;
import TT.Service.User.Product.ShoesService;

public class CheckoutService implements CheckoutRepository {
	private ConnectService connectService;
	private ShoesService shoesService;
	private VoucherService voucherService;
	private Product_color_sizeService product_color_sizeService;

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
			ResultSet rs = stmt.executeQuery("select rgb, color_name, color.id, product_color_size.prod_id from color "
					+ "Inner join product_color_size on color.id = product_color_size.color_id " + "Where prod_id=" + id_prod
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
	public List<Product_color_size> getSizeId_prod(int prod_id, int color_id) {
		List<Product_color_size> li = null;
		Product_color_size product_color_size = null;
		Sizes size = null;
		try {
			li = new ArrayList<>();
			connectService = new ConnectService();
			Connection con = connectService.getConnect();
			Statement stmt;
			stmt = (Statement) con.createStatement();
			ResultSet rs = stmt.executeQuery(
					"select product_color_size.id, product_color_size.size_id, product_color_size.prod_id, product_color_size.color_id, product_color_size.quantity, size_number, created_at, updated_at from sizes "
							+ "Inner join product_color_size on sizes.id = product_color_size.size_id " + "Where prod_id=" + prod_id
							+ " and color_id=" + color_id);
			while (rs.next()) {
				size = new Sizes();
				product_color_size = new Product_color_size();
				size.setId(rs.getInt("size_id"));
				size.setSize_number(rs.getString("size_number"));
				size.setCreated_at(rs.getDate("created_at"));
				size.setUpdated_at(rs.getDate("updated_at"));
				product_color_size.setId(rs.getInt("id"));
				product_color_size.setSize(size);

				product_color_size.setQuantity(rs.getInt("quantity"));
				li.add(product_color_size);
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
					"select product_color_size.id, product_color_size.size_id, product_color_size.prod_id, product_color_size.color_id, product_color_size.quantity, size_number, created_at, updated_at from sizes "
							+ "Inner join product_color_size on sizes.id = product_color_size.size_id " + "Where prod_id=" + prod_id);
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
			ShoesService shoesService = new ShoesService();
			Product p = shoesService.getProduct(Integer.parseInt(prod[0]));
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
			ShoesService shoesService = new ShoesService();
			Product p = shoesService.getProduct(Integer.parseInt(prod[0]));
			if (p.getDiscount() > 0) {
				t += p.getPrice() * am - p.getPrice() * am * p.getDiscount() / 100;
			} else {
				t += p.getPrice() * am;
			}
		}
		return t;
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
		shoesService = new ShoesService();
		voucherService = new VoucherService();
		Product p = shoesService.getProduct(id_prod);

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

	public double get_discount_at(int quantity, String code, int id_prod) {
		shoesService = new ShoesService();
		voucherService = new VoucherService();
		Product p = shoesService.getProduct(id_prod);

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
	
	public HashMap<Product_color_size, Integer> get_list_color_size_qty_by_string_process(String process) {
		product_color_sizeService = new Product_color_sizeService();
		HashMap<Product_color_size, Integer> hm = new LinkedHashMap<Product_color_size, Integer>();
		String arr[] = process.split("/");
		for (String s : arr) {
			if(!s.equals("")) {
				String a[] = s.split("_");
				hm.put(product_color_sizeService.getByIdCS(Integer.parseInt(a[0])), Integer.parseInt(a[1]));
			}
		}
		return hm;
	}
	
	public double get_total_by_string_process(String process) {
		double total=0;
		HashMap<Product_color_size, Integer> hm = get_list_color_size_qty_by_string_process(process);
		for (Product_color_size c : hm.keySet()) {
			if(c.getProd().getDiscount() > 0) {
				total += c.getProd().getPrice() - c.getProd().getPrice()*c.getProd().getDiscount() /100;
			} else {
				total += c.getProd().getPrice();
			}
		}
		return total;
	}
	
	public static void main(String[] args) {
		CheckoutService c = new CheckoutService();
		System.out.println(c.get_total_by_string_process("455_1/441_1"));
	}

}
