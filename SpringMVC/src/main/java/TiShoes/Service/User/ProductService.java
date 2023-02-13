package TiShoes.Service.User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import com.mysql.jdbc.Statement;

import TiShoes.Model.Brand;
import TiShoes.Model.Color;
import TiShoes.Model.Color_size;
import TiShoes.Model.Gender;
import TiShoes.Model.Product;
import TiShoes.Model.Rating;
import TiShoes.Model.Role;
import TiShoes.Model.Sizes;
import TiShoes.Model.Style;
import TiShoes.Model.User;
import TiShoes.Repository.User.ProductRepository;

public class ProductService implements ProductRepository {
	private ConnectService connectService;
	private RatingService ratingService;
	private Color_sizeService color_sizeService;
	private Product product;
	private Brand brand;
	private User user;
	private Role role;
	private Style style;
	private Color_size color_size;
	private Color color;
	private Sizes size;
	private Gender gender;

	@Override
	public List<Color_size> getAllProductsColorSize() {
		List<Color_size> list = null;
		try {
			list = new ArrayList<>();
			connectService = new ConnectService();
			Connection con = connectService.getConnect();
			Statement stmt;
			stmt = (Statement) con.createStatement();
			ResultSet rs = stmt
					.executeQuery("select * from color_size " + "Inner join product on product.id = color_size.prod_id "
							+ "Inner join sizes on sizes.id = color_size.size_id "
							+ "Inner join color on color.id = color_size.color_id "
							+ "Inner join brand on product.brand_id = brand.id "
							+ "Inner join style on product.style_id = style.id "
							+ "Inner join user on product.user_id = user.id "
							+ "Inner join gender on product.gender_id = gender.id "
							+ "Inner join role on role.id = user.role_id " + "Where color_size.quantity > 0 " + "");
			while (rs.next()) {
				color_size = new Color_size();
				color = new Color();
				size = new Sizes();
				product = new Product();
				brand = new Brand();
				user = new User();
				role = new Role();
				style = new Style();
				gender = new Gender();

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

				color_size.setId(rs.getInt("id"));
				color_size.setSize(size);
				color_size.setColor(color);
				color_size.setProd(product);
				color_size.setrQuantity(rs.getInt("quantity"));

				list.add(color_size);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Product> getAllProducts() {
		List<Product> li = null;
		try {
			li = new ArrayList<>();
			connectService = new ConnectService();
			Connection con = connectService.getConnect();
			Statement stmt;
			stmt = (Statement) con.createStatement();
			ResultSet rs = stmt
					.executeQuery("select * from product " + "Inner join brand on product.brand_id = brand.id "
							+ "Inner join style on product.style_id = style.id "
							+ "Inner join user on product.user_id = user.id "
							+ "Inner join gender on product.gender_id = gender.id "
							+ "Inner join role on role.id = user.role_id group by product.id");
			while (rs.next()) {
				product = new Product();
				brand = new Brand();
				user = new User();
				role = new Role();
				style = new Style();
				gender = new Gender();

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
				user.setRole(role);

				brand.setId(rs.getInt("brand_id"));
				brand.setBrand_name(rs.getString("brand_name"));

				style.setId(rs.getInt("style_id"));
				style.setStyle_name(rs.getString("style_name"));

				product.setId(rs.getInt("id"));
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

				li.add(product);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return li;
	}

	@Override
	public List<Product> getNewArrivals() {
		ProductService p = new ProductService();
		List<Product> li = p.getAllProducts();
		List<Product> listNewArrivals = new LinkedList<>();
		Collections.sort(li, new Comparator<Product>() {
			@Override
			public int compare(Product o1, Product o2) {
				return o2.getPublished_at().compareTo(o1.getPublished_at());
			}
		});
		int count = 0;
		for (Product product : li) {
			count++;
			if (count > 4) {
				break;
			} else {
				listNewArrivals.add(product);
			}
		}
		return listNewArrivals;
	}

	@Override
	public List<Product> getMostLovedProducts() {
		ProductService p = new ProductService();
		List<Product> li = p.getAllProducts();
		List<Product> listMostLovedProducts = new LinkedList<>();
		Collections.sort(li, new Comparator<Product>() {
			@Override
			public int compare(Product o1, Product o2) {
				return o2.getMost_loved() - o1.getMost_loved();
			}
		});
		int count = 0;
		for (Product product : li) {
			count++;
			if (count > 20) {
				break;
			} else {
				listMostLovedProducts.add(product);
			}
		}
		return listMostLovedProducts;
	}

	@Override
	public Product getProduct(int id) {
		Product prod = new Product();
		ProductService p = new ProductService();
		List<Product> li = p.getAllProducts();
		for (Product product : li) {
			if (product.getId() == id) {
				prod = product;
			}
		}
		return prod;
	}

	@Override
	public HashMap<Integer, String> getSizeCheckedByString(String txt) {
		HashMap<Integer, String> li = new HashMap<>();
		String arr[] = txt.split("/");
		for (String str : arr) {
			if (!str.equals("")) {
				li.put(Integer.parseInt(str), str);
			}
		}
		return li;
	}

	@Override
	public HashMap<Integer, String> getColorCheckedByString(String txt) {
		HashMap<Integer, String> li = new HashMap<>();
		String arr[] = txt.split("/");
		for (String str : arr) {
			if (!str.equals("")) {
				li.put(Integer.parseInt(str), str);
			}
		}
		return li;
	}

	@Override
	public List<Integer> getSizeIdByString(String txt) {
		List<Integer> li = new ArrayList<>();
		String arr[] = txt.split("/");
		for (String s : arr) {
			if (!s.equals("")) {
				li.add(Integer.parseInt(s));
			}
		}
		return li;
	}

//#######################################################################################3#########################
	@Override
	public List<Integer> getSortBy(String txt, HashMap<Integer, Integer> hms) {
		boolean check = false;
		for (Integer i : hms.keySet()) {
			if (hms.get(i) > 1) {
				check = true;
			}
		}

		List<Integer> list = new LinkedList<>();
		if (hms.isEmpty()) {
			if (txt.equals("newest")) {
				List<Product> li = getAllProducts();
				Collections.sort(li, new Comparator<Product>() {
					@Override
					public int compare(Product o1, Product o2) {
						return o2.getPublished_at().compareTo(o1.getPublished_at());
					}
				});
				for (Product product : li) {
					list.add(product.getId());
				}
			} else if (txt.equals("salesoff")) {
				List<Product> li = getAllProducts();
				for (Product product : li) {
					if (product.getDiscount() > 0) {
						list.add(product.getId());
					}
				}
			} else if (txt.equals("toprating")) {
				HashMap<Integer, Double> hm = new HashMap<>();
				for (Product i : getAllProducts()) {
					hm.put(i.getId(), averageRating(i.getId()));
				}
				List<Entry<Integer, Double>> sortedEntries = entriesSortedByValues(hm);
				for (Entry<Integer, Double> entry : sortedEntries) {
					if (entry.getValue() >= 1) {
						list.add(entry.getKey());
					}
				}
			} else if (txt.equals("stylename")) {
				List<Product> li = getAllProducts();
				Collections.sort(li, new Comparator<Product>() {
					@Override
					public int compare(Product o1, Product o2) {
						return o1.getStyle().getStyle_name().compareTo(o2.getStyle().getStyle_name());
					}
				});
				for (Product product : li) {
					list.add(product.getId());
				}
			} else if (txt.equals("price:asc")) {
				List<Product> li = new LinkedList<>();
				for (Product i : getAllProducts()) {
					if (i.getDiscount() > 0) {
						Product p = new Product();
						p.setId(i.getId());
						p.setTitle(i.getTitle());
						p.setPrice(i.getPrice() - i.getPrice() * i.getDiscount() / 100);
						p.setDiscount(i.getDiscount());
						p.setThumbnail(i.getThumbnail());
						p.setDescription(i.getDescription());
						p.setStyle(i.getStyle());
						p.setUser(i.getUser());
						p.setBrand(i.getBrand());
						p.setCreated_at(i.getCreated_at());
						p.setUpdated_at(i.getUpdated_at());
						p.setPublished_at(i.getPublished_at());
						p.setMost_loved(i.getMost_loved());
						p.setSold(i.getSold());
						p.setGender(i.getGender());
						li.add(p);
					} else {
						li.add(i);
					}
				}
				Collections.sort(li, new Comparator<Product>() {
					@Override
					public int compare(Product o1, Product o2) {
						return Double.compare(o1.getPrice(), o2.getPrice());
					}
				});
				for (Product product : li) {
					list.add(product.getId());
				}
			}
		} else {
			// hm size > 1
			if (txt.equals("newest")) {
				List<Product> li = new LinkedList<>();
				for (Integer i : hms.keySet()) {
					if (check == true) {
						if (hms.get(i) > 1) {
							li.add(getProduct(i));
						}
					} else {
						li.add(getProduct(i));
					}
				}
				Collections.sort(li, new Comparator<Product>() {
					@Override
					public int compare(Product o1, Product o2) {
						return o2.getPublished_at().compareTo(o1.getPublished_at());
					}
				});
				for (Product product : li) {
					list.add(product.getId());
				}
			} else if (txt.equals("toprating")) {
				System.out.println("o ady");
				HashMap<Integer, Double> hm = new HashMap<>();
				for (Integer i : hms.keySet()) {
					if (check == true) {
						if (hms.get(i) > 1) {
							hm.put(i, averageRating(i));
						}
					} else {
						hm.put(i, averageRating(i));
					}
				}
				List<Entry<Integer, Double>> sortedEntries = entriesSortedByValues(hm);
				for (Entry<Integer, Double> entry : sortedEntries) {
					if (entry.getValue() >= 1) {
						list.add(entry.getKey());
					}
				}
			} else if (txt.equals("salesoff")) {
				for (Integer i : hms.keySet()) {
					if (getProduct(i).getDiscount() > 0) {
						if (check == true) {
							if (hms.get(i) > 1) {
								list.add(i);
							}
						} else {
							list.add(i);
						}

					}
				}
			} else if (txt.equals("stylename")) {
				List<Product> li = new LinkedList<>();
				for (Integer i : hms.keySet()) {
					if (check == true) {
						if (hms.get(i) > 1) {
							li.add(getProduct(i));
						}
					} else {
						li.add(getProduct(i));
					}
				}
				Collections.sort(li, new Comparator<Product>() {
					@Override
					public int compare(Product o1, Product o2) {
						return o1.getStyle().getStyle_name().compareTo(o2.getStyle().getStyle_name());
					}
				});
				for (Product product : li) {
					list.add(product.getId());
				}
			} else if (txt.equals("price:asc")) {
				List<Product> li = new LinkedList<>();
				for (Integer i : hms.keySet()) {
					if (check == true) {
						if (hms.get(i) > 1) {
							if (getProduct(i).getDiscount() > 0) {
								Product p = new Product();
								p.setId(getProduct(i).getId());
								p.setTitle(getProduct(i).getTitle());
								p.setPrice(getProduct(i).getPrice()
										- getProduct(i).getPrice() * getProduct(i).getDiscount() / 100);
								p.setDiscount(getProduct(i).getDiscount());
								p.setThumbnail(getProduct(i).getThumbnail());
								p.setDescription(getProduct(i).getDescription());
								p.setStyle(getProduct(i).getStyle());
								p.setUser(getProduct(i).getUser());
								p.setBrand(getProduct(i).getBrand());
								p.setCreated_at(getProduct(i).getCreated_at());
								p.setUpdated_at(getProduct(i).getUpdated_at());
								p.setPublished_at(getProduct(i).getPublished_at());
								p.setMost_loved(getProduct(i).getMost_loved());
								p.setSold(getProduct(i).getSold());
								p.setGender(getProduct(i).getGender());
								li.add(p);
							} else {
								li.add(getProduct(i));
							}
						}
					} else {
						if (getProduct(i).getDiscount() > 0) {
							Product p = new Product();
							p.setId(getProduct(i).getId());
							p.setTitle(getProduct(i).getTitle());
							p.setPrice(getProduct(i).getPrice()
									- getProduct(i).getPrice() * getProduct(i).getDiscount() / 100);
							p.setDiscount(getProduct(i).getDiscount());
							p.setThumbnail(getProduct(i).getThumbnail());
							p.setDescription(getProduct(i).getDescription());
							p.setStyle(getProduct(i).getStyle());
							p.setUser(getProduct(i).getUser());
							p.setBrand(getProduct(i).getBrand());
							p.setCreated_at(getProduct(i).getCreated_at());
							p.setUpdated_at(getProduct(i).getUpdated_at());
							p.setPublished_at(getProduct(i).getPublished_at());
							p.setMost_loved(getProduct(i).getMost_loved());
							p.setSold(getProduct(i).getSold());
							p.setGender(getProduct(i).getGender());
							li.add(p);
						} else {
							li.add(getProduct(i));
						}
					}

				}
				Collections.sort(li, new Comparator<Product>() {
					@Override
					public int compare(Product o1, Product o2) {
						return Double.compare(o1.getPrice(), o2.getPrice());
					}
				});
				for (Product product : li) {
					list.add(product.getId());
				}

			}
		}
		return list;
	}

	// #######################################################################################3#########################
	@Override
	public List<Integer> getPrice(String txt) {
		HashMap<Integer, Integer> hm = new HashMap<>();
		String arr[] = txt.split("_");
		double min = Double.parseDouble(arr[0]);
		double max = Double.parseDouble(arr[1]);
		List<Color_size> li = getAllProductsColorSize();
		List<Integer> list = new ArrayList<>();
		if (!arr[0].equals("") && !arr[1].equals("")) {
			for (Color_size c : li) {
				if (c.getProd().getDiscount() > 0) {
					if ((c.getProd().getPrice() - c.getProd().getPrice() * c.getProd().getDiscount() / 100) <= max
							&& (c.getProd().getPrice()
									- c.getProd().getPrice() * c.getProd().getDiscount() / 100) >= min) {
						if (!hm.containsKey(c.getProd().getId())) {
							hm.put(c.getProd().getId(), 1);
						} else {
							hm.put(c.getProd().getId(), hm.get(c.getProd().getId()) + 1);
						}
					}
				} else {
					if (c.getProd().getPrice() <= max && c.getProd().getPrice() >= min) {
						if (!hm.containsKey(c.getProd().getId())) {
							hm.put(c.getProd().getId(), 1);
						} else {
							hm.put(c.getProd().getId(), hm.get(c.getProd().getId()) + 1);
						}
					}
				}
			}
		}
		if (!hm.isEmpty()) {
			for (Integer i : hm.keySet()) {
				list.add(i);
			}
		}
		return list;
	}

	// #######################################################################################3####################
	@Override
	public List<Integer> getColor(String txt) {
		HashMap<Integer, Integer> hm = new HashMap<>();
		String arr[] = txt.split("/");
		List<Color_size> li = getAllProductsColorSize();
		List<Integer> list = new ArrayList<>();
		for (String s : arr) {
			if (!s.equals("")) {
				for (Color_size c : li) {
					if (c.getColor().getId() == Integer.parseInt(s)) {
						if (!hm.containsKey(c.getProd().getId())) {
							hm.put(c.getProd().getId(), 1);
						} else {
							hm.put(c.getProd().getId(), hm.get(c.getProd().getId()) + 1);
						}
					}

				}
			}
		}
		if (!hm.isEmpty()) {
			for (Integer i : hm.keySet()) {
				list.add(i);
			}
		}
		return list;
	}

	// #######################################################################################3####################
	@Override
	public List<Integer> getSizes(String txt) {
		HashMap<Integer, Integer> hm = new HashMap<>();
		String arr[] = txt.split("/");
		List<Color_size> li = getAllProductsColorSize();
		List<Integer> list = new ArrayList<>();
		for (String s : arr) {

			if (!s.equals("")) {

				for (Color_size c : li) {
					int inter = Integer.parseInt(s);
					if (c.getSize().getId() == inter) {
						if (!hm.containsKey(c.getProd().getId())) {
							hm.put(c.getProd().getId(), 1);
						} else {

							hm.put(c.getProd().getId(), hm.get(c.getProd().getId()) + 1);
						}
					}

				}
			}
		}
		if (!hm.isEmpty()) {
			for (Integer i : hm.keySet()) {
				list.add(i);
			}
		}
		return list;
	}

	// #######################################################################################3####################
	@Override
	public List<Integer> getStyleName(String txt) {
		HashMap<Integer, Integer> hm = new HashMap<>();
		List<Color_size> li = getAllProductsColorSize();
		List<Integer> list = new ArrayList<>();
		if (!txt.equals("")) {
			for (Color_size c : li) {
				if (c.getProd().getStyle().getId() == Integer.parseInt(txt)) {
					if (!hm.containsKey(c.getProd().getId())) {
						hm.put(c.getProd().getId(), 1);
					} else {
						hm.put(c.getProd().getId(), hm.get(c.getProd().getId()) + 1);
					}
				}

			}
		}

		if (!hm.isEmpty()) {
			for (Integer i : hm.keySet()) {
				list.add(i);
			}
		}
		return list;
	}

	// #######################################################################################3####################
	@Override
	public Double averageRating(int id_prod) {
		ratingService = new RatingService();
		List<Rating> li = ratingService.getAllRating();
		int count = 0;
		double average = 0.0;
		for (Rating r : li) {
			if (r.getProduct().getId() == id_prod) {
				average += r.getRating_stars();
				count++;
			}
		}
		return (double) Math.round(average / count * 10) / 10;
	}

	@Override
	public List<Integer> getRating(String txt) {
		HashMap<Integer, Double> rating = new HashMap<>();
		color_sizeService = new Color_sizeService();
		List<Integer> liProd_id = color_sizeService.getAllProd_id();
		for (Integer i : liProd_id) {
			rating.put(i, averageRating(i));
		}
		HashMap<Integer, Integer> hm = new HashMap<>();
		List<Integer> list = new LinkedList<>();
		if (!txt.equals("") && txt.equals("fivestars")) {
			for (Integer i : rating.keySet()) {
				if (rating.get(i) >= 5) {
					if (!hm.containsKey(i)) {
						hm.put(i, 1);
					} else {
						hm.put(i, hm.get(i) + 1);
					}
				}
			}
		} else if (!txt.equals("") && txt.equals("fourstars")) {
			for (Integer i : rating.keySet()) {
				if (rating.get(i) >= 4) {
					if (!hm.containsKey(i)) {
						hm.put(i, 1);
					} else {
						hm.put(i, hm.get(i) + 1);
					}
				}
			}
		} else if (!txt.equals("") && txt.equals("threestars")) {
			for (Integer i : rating.keySet()) {
				if (rating.get(i) >= 5) {
					if (!hm.containsKey(i)) {
						hm.put(i, 1);
					} else {
						hm.put(i, hm.get(i) + 1);
					}
				}
			}
		} else if (!txt.equals("") && txt.equals("twostars")) {
			for (Integer i : rating.keySet()) {
				if (rating.get(i) >= 5) {
					if (!hm.containsKey(i)) {
						hm.put(i, 1);
					} else {
						hm.put(i, hm.get(i) + 1);
					}
				}
			}
		} else if (!txt.equals("") && txt.equals("onestar")) {
			for (Integer i : rating.keySet()) {
				if (rating.get(i) >= 5) {
					if (!hm.containsKey(i)) {
						hm.put(i, 1);
					} else {
						hm.put(i, hm.get(i) + 1);
					}
				}
			}
		}

		if (!hm.isEmpty()) {
			for (Integer i : hm.keySet()) {
				list.add(i);
			}
		}
		return list;
	}

	// #######################################################################################3####################
	@Override
	public List<Integer> getGender(String txt) {
		HashMap<Integer, Integer> hm = new HashMap<>();
		List<Color_size> li = getAllProductsColorSize();
		List<Integer> list = new ArrayList<>();

		if (!txt.equals("") && txt.equals("men")) {
			for (Color_size c : li) {
				if (c.getProd().getGender().getId() == 1 || c.getProd().getGender().getId() == 3) {
					if (!hm.containsKey(c.getProd().getId())) {
						hm.put(c.getProd().getId(), 1);
					} else {
						hm.put(c.getProd().getId(), hm.get(c.getProd().getId()) + 1);
					}
				}

			}
		} else if (!txt.equals("") && txt.equals("women")) {
			for (Color_size c : li) {
				if (c.getProd().getGender().getId() == 2 || c.getProd().getGender().getId() == 3) {
					if (!hm.containsKey(c.getProd().getId())) {
						hm.put(c.getProd().getId(), 1);
					} else {
						hm.put(c.getProd().getId(), hm.get(c.getProd().getId()) + 1);
					}
				}

			}
		} else if (!txt.equals("") && txt.equals("kid")) {
			for (Color_size c : li) {
				if (c.getProd().getGender().getId() == 4) {
					if (!hm.containsKey(c.getProd().getId())) {
						hm.put(c.getProd().getId(), 1);
					} else {
						hm.put(c.getProd().getId(), hm.get(c.getProd().getId()) + 1);
					}
				}

			}
		}

		if (!hm.isEmpty()) {
			for (Integer i : hm.keySet()) {
				list.add(i);
			}
		}
		return list;
	}

	// #######################################################################################3####################
	@Override
	public List<Product> getAllProductsColorSize(HashMap<String, String> hms) {
		List<Product> liProd = new ArrayList<>();
		HashMap<Integer, Integer> hmt = new HashMap<>();
		for (String s : hms.keySet()) {
			if (s.equals("price")) {
				List<Integer> list = getPrice(hms.get(s));
				if (!list.isEmpty()) {
					for (Integer pro : list) {
						if (!hmt.containsKey(pro)) {
							hmt.put(pro, 1);
						} else {
							hmt.put(pro, hmt.get(pro) + 1);
						}
					}
				}
			} else if (s.equals("color")) {
				List<Integer> list = getColor(hms.get(s));
				if (!list.isEmpty()) {
					for (Integer pro : list) {
						if (!hmt.containsKey(pro)) {
							hmt.put(pro, 1);
						} else {
							hmt.put(pro, hmt.get(pro) + 1);
						}
					}
				}
			} else if (s.equals("size")) {
				List<Integer> list = getSizes(String.valueOf(hms.get(s)));
				if (!list.isEmpty()) {
					for (Integer pro : list) {
						if (!hmt.containsKey(pro)) {
							hmt.put(pro, 1);
						} else {
							hmt.put(pro, hmt.get(pro) + 1);
						}
					}
				}
			} else if (s.equals("gender")) {
				List<Integer> list = getGender(hms.get(s));
				if (!list.isEmpty()) {
					for (Integer pro : list) {
						if (!hmt.containsKey(pro)) {
							hmt.put(pro, 1);
						} else {
							hmt.put(pro, hmt.get(pro) + 1);
						}
					}
				}
			} else if (s.equals("rate")) {
				List<Integer> list = getRating(hms.get(s));
				if (!list.isEmpty()) {
					for (Integer pro : list) {
						if (!hmt.containsKey(pro)) {
							hmt.put(pro, 1);
						} else {
							hmt.put(pro, hmt.get(pro) + 1);
						}
					}
				}
			} else if (s.equals("stylename")) {
				List<Integer> list = getStyleName(hms.get(s));
				if (!list.isEmpty()) {
					for (Integer pro : list) {
						if (!hmt.containsKey(pro)) {
							hmt.put(pro, 1);
						} else {
							hmt.put(pro, hmt.get(pro) + 1);
						}
					}
				}
			}
		}

		if (hms.size() > 1 && !hms.containsKey("sortby")) {
			List<Entry<Integer, Integer>> sortedEntries = entriesSortedByValues(hmt);
			for (Entry<Integer, Integer> entry : sortedEntries) {
				if (entry.getValue() > 1) {
					liProd.add(getProduct(entry.getKey()));
				}
			}
		} else if (hms.size() > 1 && hms.containsKey("sortby")) {
			List<Integer> list = getSortBy(hms.get("sortby"), hmt);
			for (Integer i : list) {
				liProd.add(getProduct(i));
			}
		} else {
			if (hms.containsKey("sortby")) {

				List<Integer> list = getSortBy(hms.get("sortby"), hmt);
				for (Integer i : list) {
					liProd.add(getProduct(i));
				}
			} else {
				List<Entry<Integer, Integer>> sortedEntries = entriesSortedByValues(hmt);
				for (Entry<Integer, Integer> entry : sortedEntries) {
					if (entry.getValue() >= 1) {
						liProd.add(getProduct(entry.getKey()));
					}
				}
			}
		}
		return liProd;
	}

	@Override
	public <K, V extends Comparable<? super V>> List<Entry<K, V>> entriesSortedByValues(Map<K, V> map) {
		List<Entry<K, V>> sortedEntries = new ArrayList<Entry<K, V>>(map.entrySet());
		Collections.sort(sortedEntries, new Comparator<Entry<K, V>>() {
			@Override
			public int compare(Entry<K, V> e1, Entry<K, V> e2) {
				return e2.getValue().compareTo(e1.getValue());
			}
		});
		return sortedEntries;
	}

	public static void main(String[] args) {
		ProductService p = new ProductService();
		HashMap<String, String> hms = new HashMap<>();
		// hms.put("size", "5");
		// hms.put("color", "1");
		// hms.put("price", "50_100");
		hms.put("rate", "fourstars");
		// hms.put("sortby", "price:asc");
		hms.put("sortby", "toprating");
		// hms.put("gender", "men");
		List<Product> li = p.getAllProductsColorSize(hms);

		for (Product product : li) {
			System.out.println(product.getId() + "==" + product.getPrice());
		}
		System.out.println("size: " + li.size());

	}
}
