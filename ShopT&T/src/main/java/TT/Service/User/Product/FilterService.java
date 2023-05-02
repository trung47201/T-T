package TT.Service.User.Product;

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

import TT.Model.Brand;
import TT.Model.Category;
import TT.Model.Color;
import TT.Model.Gender;
import TT.Model.Product;
import TT.Model.Product_color_size;
import TT.Model.Rating;
import TT.Model.Role;
import TT.Model.Sizes;
import TT.Model.Sub_category;
import TT.Model.User;
import TT.Service.User.ConnectService;
import TT.Service.User.Product_color_sizeService;
import TT.Service.User.RatingService;

public class FilterService {

	private ConnectService connectService;
	private RatingService ratingService;
	private Product_color_sizeService product_color_sizeService;
	private Product product;
	private Brand brand;
	private User user;
	private Role role;
	private Sub_category sub_category;
	private Product_color_size product_color_size;
	private Color color;
	private Sizes size;
	private Gender gender;
	private Category category;

	public List<Product_color_size> getAllProductsColorSize(int id) {
		List<Product_color_size> list = null;
		try {
			list = new ArrayList<>();
			connectService = new ConnectService();
			Connection con = connectService.getConnect();
			Statement stmt;
			stmt = (Statement) con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from product_color_size "
					+ "Inner join product on product.id = product_color_size.prod_id "
					+ "Inner join sizes on sizes.id = product_color_size.size_id "
					+ "Inner join color on color.id = product_color_size.color_id "
					+ "Inner join brand on product.brand_id = brand.id "
					+ "Inner join sub_category on product.sub_category_id = sub_category.id "
					+ "Inner join category on sub_category.category_id = category.id "
					+ "Inner join user on product.user_id = user.id "
					+ "Inner join gender on product.gender_id = gender.id "
					+ "Inner join role on role.id = user.role_id " + "Where product_color_size.quantity > 0 "
					+ "AND category.id = " + id);
			while (rs.next()) {
				product_color_size = new Product_color_size();
				color = new Color();
				size = new Sizes();
				product = new Product();
				brand = new Brand();
				user = new User();
				role = new Role();
				sub_category = new Sub_category();
				gender = new Gender();
				category = new Category();

				gender.setId(rs.getInt("gender_id"));
				gender.setGender_name(rs.getString("gender_name"));
				gender.setDescription(rs.getString("description"));

				role.setId(rs.getInt("role_id"));
				role.setRole_name(rs.getString("role_name"));
				role.setDescription(rs.getString("description"));
				role.setCreated_at(rs.getDate("created_at"));
				role.setUpdated_at(rs.getDate("updated_at"));

				user.setId(rs.getInt("user_id"));
				user.setFirstname(rs.getString("firstname"));
				user.setLastname(rs.getString("lastname"));
				user.setEmail(rs.getString("email"));
				user.setPhone_number(rs.getString("phone_number"));
				user.setAddress(rs.getString("address"));
				user.setPassword(rs.getString("password"));
				user.setAvatar(rs.getString("avatar"));
				user.setRole(role);

				brand.setId(rs.getInt("brand_id"));
				brand.setBrand_name(rs.getString("brand_name"));

				category.setId(rs.getInt("category_id"));
				category.setCategory_name(rs.getString("category_name"));

				sub_category.setId(rs.getInt("sub_category_id"));
				sub_category.setSub_category_name(rs.getString("sub_category_name"));
				sub_category.setCategory(category);

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

				product_color_size.setId(rs.getInt("id"));
				product_color_size.setSize(size);
				product_color_size.setColor(color);
				product_color_size.setProd(product);
				product_color_size.setQuantity(rs.getInt("quantity"));

				list.add(product_color_size);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	// #######################################################################################3####################

	public Product getProduct(int id) {
		Product prod = new Product();
		ShoesService s = new ShoesService();
		for (Product product : s.getAllProducts()) {
			if (product.getId() == id) {
				prod = product;
			}
		}
		return prod;
	}

	// #######################################################################################3####################
	public List<Integer> getPrice(String txt, int id) {
		HashMap<Integer, Integer> hm = new HashMap<>();
		String arr[] = txt.split("_");
		double min = Double.parseDouble(arr[0]);
		double max = Double.parseDouble(arr[1]);
		List<Product_color_size> li = getAllProductsColorSize(id);
		List<Integer> list = new ArrayList<>();
		if (!arr[0].equals("") && !arr[1].equals("")) {
			for (Product_color_size c : li) {
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

	public List<Integer> getColor(String txt, int id) {
		HashMap<Integer, Integer> hm = new HashMap<>();
		String arr[] = txt.split("/");
		List<Product_color_size> li = getAllProductsColorSize(id);
		List<Integer> list = new ArrayList<>();
		for (String s : arr) {
			if (!s.equals("")) {
				for (Product_color_size c : li) {
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
	public List<Integer> getSizes(String txt, int id) {
		HashMap<Integer, Integer> hm = new HashMap<>();
		String arr[] = txt.split("/");
		List<Product_color_size> li = getAllProductsColorSize(id);
		List<Integer> list = new ArrayList<>();
		for (String s : arr) {

			if (!s.equals("")) {

				for (Product_color_size c : li) {
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
	public List<Integer> getStyleName(String txt, int id) {
		HashMap<Integer, Integer> hm = new HashMap<>();
		List<Product_color_size> li = getAllProductsColorSize(id);
		List<Integer> list = new ArrayList<>();
		if (!txt.equals("")) {
			for (Product_color_size c : li) {
				if (c.getProd().getSub_category().getId() == Integer.parseInt(txt)) {
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

	public List<Integer> getRating(String txt) {
		HashMap<Integer, Double> rating = new HashMap<>();
		product_color_sizeService = new Product_color_sizeService();
		List<Integer> liProd_id = product_color_sizeService.getAllProd_id();
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
	public List<Integer> getGender(String txt, int id) {
		HashMap<Integer, Integer> hm = new HashMap<>();
		List<Product_color_size> li = getAllProductsColorSize(id);
		List<Integer> list = new ArrayList<>();

		if (!txt.equals("") && txt.equals("men")) {
			for (Product_color_size c : li) {
				if (c.getProd().getGender().getId() == 1 || c.getProd().getGender().getId() == 3) {
					if (!hm.containsKey(c.getProd().getId())) {
						hm.put(c.getProd().getId(), 1);
					} else {
						hm.put(c.getProd().getId(), hm.get(c.getProd().getId()) + 1);
					}
				}

			}
		} else if (!txt.equals("") && txt.equals("women")) {
			for (Product_color_size c : li) {
				if (c.getProd().getGender().getId() == 2 || c.getProd().getGender().getId() == 3) {
					if (!hm.containsKey(c.getProd().getId())) {
						hm.put(c.getProd().getId(), 1);
					} else {
						hm.put(c.getProd().getId(), hm.get(c.getProd().getId()) + 1);
					}
				}

			}
		} else if (!txt.equals("") && txt.equals("kid")) {
			for (Product_color_size c : li) {
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

	public List<Product> getAllProductsColorSize(HashMap<String, String> hms, List<Product> liproduct, int id) {
		List<Product> liProd = new ArrayList<>();
		HashMap<Integer, Integer> hmt = new HashMap<>();
		for (String s : hms.keySet()) {
			if (s.equals("price")) {
				List<Integer> list = getPrice(hms.get(s), id);
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
				List<Integer> list = getColor(hms.get(s), id);
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
				List<Integer> list = getSizes(String.valueOf(hms.get(s)), id);
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
				List<Integer> list = getGender(hms.get(s), id);
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
				List<Integer> list = getStyleName(hms.get(s), id);
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
			List<Integer> list = getSortBy(hms.get("sortby"), hmt, liproduct);
			for (Integer i : list) {
				liProd.add(getProduct(i));
			}
		} else {
			if (hms.containsKey("sortby")) {
				List<Integer> list = getSortBy(hms.get("sortby"), hmt, liproduct);
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

	public List<Integer> getSortBy(String txt, HashMap<Integer, Integer> hms, List<Product> liproduct) {
		boolean check = false;
		for (Integer i : hms.keySet()) {
			if (hms.get(i) > 1) {
				check = true;
			}
		}

		List<Integer> list = new LinkedList<>();
		if (hms.isEmpty()) {
			if (txt.equals("newest")) {
				Collections.sort(liproduct, new Comparator<Product>() {
					@Override
					public int compare(Product o1, Product o2) {
						return o2.getPublished_at().compareTo(o1.getPublished_at());
					}
				});
				for (Product product : liproduct) {
					list.add(product.getId());
				}
			} else if (txt.equals("salesoff")) {
				for (Product product : liproduct) {
					if (product.getDiscount() > 0) {
						list.add(product.getId());
					}
				}
			} else if (txt.equals("toprating")) {
				HashMap<Integer, Double> hm = new HashMap<>();
				for (Product i : liproduct) {
					hm.put(i.getId(), averageRating(i.getId()));
				}
				List<Entry<Integer, Double>> sortedEntries = entriesSortedByValues(hm);
				for (Entry<Integer, Double> entry : sortedEntries) {
					if (entry.getValue() >= 1) {
						list.add(entry.getKey());
					}
				}
			} else if (txt.equals("stylename")) {
				Collections.sort(liproduct, new Comparator<Product>() {
					@Override
					public int compare(Product o1, Product o2) {
						return o1.getSub_category().getSub_category_name()
								.compareTo(o2.getSub_category().getSub_category_name());
					}
				});
				for (Product product : liproduct) {
					list.add(product.getId());
				}
			} else if (txt.equals("price:asc")) {
				List<Product> li = new LinkedList<>();
				for (Product i : liproduct) {
					if (i.getDiscount() > 0) {
						Product p = new Product();
						p.setId(i.getId());
						p.setTitle(i.getTitle());
						p.setPrice(i.getPrice() - i.getPrice() * i.getDiscount() / 100);
						p.setDiscount(i.getDiscount());
						p.setThumbnail(i.getThumbnail());
						p.setDescription(i.getDescription());
						p.setSub_category(i.getSub_category());
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
						return o1.getSub_category().getSub_category_name()
								.compareTo(o2.getSub_category().getSub_category_name());
					}
				});
				for (Product product : li) {
					System.out.println(product.getId() + "===============");
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
								p.setSub_category(getProduct(i).getSub_category());
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
							p.setSub_category(getProduct(i).getSub_category());
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

}
