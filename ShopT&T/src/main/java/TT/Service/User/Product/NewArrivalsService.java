package TT.Service.User.Product;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.LinkedList;
import java.util.List;

import com.mysql.jdbc.Statement;

import TT.Model.Brand;
import TT.Model.Color;
import TT.Model.Gender;
import TT.Model.Product;
import TT.Model.Product_color_size;
import TT.Model.Role;
import TT.Model.Sizes;
import TT.Model.Sub_category;
import TT.Model.User;
import TT.Service.User.Product_color_sizeService;
import TT.Service.User.ConnectService;
import TT.Service.User.RatingService;
import TT.Service.User.VoucherService;

public class NewArrivalsService {
	private ConnectService connectService;
	private RatingService ratingService;
	private Product_color_sizeService product_color_sizeService;
	private VoucherService voucherService;
	private Product product;
	private Brand brand;
	private User user;
	private Role role;
	private Sub_category sub_category;
	private Product_color_size product_color_size;
	private Color color;
	private Sizes size;
	private Gender gender;

	public List<Product> getNewArrivals() {
		ShoesService p = new ShoesService();
		List<Product> li = p.getAllProducts();
		Collections.sort(li, new Comparator<Product>() {
			@Override
			public int compare(Product o1, Product o2) {
				return o2.getPublished_at().compareTo(o1.getPublished_at());
			}
		});
		return li;
	}
}
