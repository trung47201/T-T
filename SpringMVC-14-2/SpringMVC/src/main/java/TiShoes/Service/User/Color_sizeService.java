package TiShoes.Service.User;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import TiShoes.Model.Brand;
import TiShoes.Model.Color;
import TiShoes.Model.Color_size;
import TiShoes.Model.Gender;
import TiShoes.Model.Product;
import TiShoes.Model.Role;
import TiShoes.Model.Sizes;
import TiShoes.Model.Style;
import TiShoes.Model.User;
import TiShoes.Repository.User.Color_sizeRepository;

public class Color_sizeService implements Color_sizeRepository {
	private ConnectService connectService;
	private SizeService sizeService;
	private Color color;
	private Color_size color_size;
	private Sizes size;
	private Brand brand;
	private User user;
	private Role role;
	private Product product;
	private Style style;
	private Gender gender;

	@Override
	public List<Color_size> getAllColor_sizeById_prod(int prod_id, int color_id) {
		List<Color_size> li = null;
		try {
			connectService = new ConnectService();
			li = new ArrayList<>();
			Connection con = connectService.getConnect();
			Statement stmt;
			stmt = (Statement) con.createStatement();
			ResultSet rs = stmt
					.executeQuery("select * from color_size " + "Inner join product on color_size.prod_id = product.id "
							+ "Inner join brand on product.brand_id = brand.id "
							+ "Inner join style on product.style_id = style.id "
							+ "Inner join user on product.user_id = user.id "
							+ "Inner join gender on product.gender_id = gender.id "
							+ "Inner join role on role.id = user.role_id "
							+ "Inner join sizes on sizes.id = color_size.size_id "
							+ "Inner join color on color.id = color_size.color_id " + "Where prod_id=" + prod_id
							+ " and color_id=" + color_id + " and quantity > 0 " + " group by color_size.id");
			while (rs.next()) {
				product = new Product();
				brand = new Brand();
				user = new User();
				role = new Role();
				color_size = new Color_size();
				color = new Color();
				size = new Sizes();
				style = new Style();
				gender = new Gender();

				gender.setId(rs.getInt("gender_id"));
				gender.setGender_name(rs.getString("gender_name"));
				gender.setDescription(rs.getString("description"));

				size.setId(rs.getInt("size_id"));
				size.setSize_number(rs.getInt("size_number"));
				size.setCreated_at(rs.getDate("created_at"));
				size.setUpdated_at(rs.getDate("updated_at"));

				color.setId(rs.getInt("color_id"));
				color.setColor_name(rs.getString("color_name"));
				color.setRgb(rs.getString("rgb"));

				role.setId(rs.getInt("role_id"));
				role.setRole_name(rs.getString("role_name"));
				role.setDescription(rs.getString("description"));
				role.setCreated_at(rs.getDate("created_at"));
				role.setUpdated_at(rs.getDate("updated_at"));

				brand.setId(rs.getInt("brand_id"));
				brand.setBrand_name(rs.getString("brand_name"));

				user.setId(rs.getInt("user_id"));
				user.setFullname(rs.getString("fullname"));
				user.setEmail(rs.getString("email"));
				user.setPhone_number(rs.getString("phone_number"));
				user.setAddress(rs.getString("address"));
				user.setPassword(rs.getString("password"));
				user.setAvatar(rs.getString("avatar"));
				user.setRole(role);

				style.setId(rs.getInt("style_id"));
				style.setStyle_name(rs.getString("style_name"));

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
	public List<Color_size> getAllColorById_prod(int prod_id) {
		List<Color_size> li = null;
		try {
			connectService = new ConnectService();
			li = new ArrayList<>();
			Connection con = connectService.getConnect();
			Statement stmt;
			stmt = (Statement) con.createStatement();
			ResultSet rs = stmt
					.executeQuery("select * from color_size " + "Inner join product on color_size.prod_id = product.id "
							+ "Inner join brand on product.brand_id = brand.id "
							+ "Inner join style on product.style_id = style.id "
							+ "Inner join user on product.user_id = user.id "
							+ "Inner join gender on product.gender_id = gender.id "
							+ "Inner join role on role.id = user.role_id "
							+ "Inner join sizes on sizes.id = color_size.size_id "
							+ "Inner join color on color.id = color_size.color_id " + "Where prod_id=" + prod_id
							+ " and quantity > 0 " + " group by color_id");
			while (rs.next()) {
				product = new Product();
				brand = new Brand();
				user = new User();
				role = new Role();
				color_size = new Color_size();
				color = new Color();
				size = new Sizes();
				style = new Style();
				gender = new Gender();

				gender.setId(rs.getInt("gender_id"));
				gender.setGender_name(rs.getString("gender_name"));
				gender.setDescription(rs.getString("description"));

				size.setId(rs.getInt("size_id"));
				size.setSize_number(rs.getInt("size_number"));
				size.setCreated_at(rs.getDate("created_at"));
				size.setUpdated_at(rs.getDate("updated_at"));

				color.setId(rs.getInt("color_id"));
				color.setColor_name(rs.getString("color_name"));
				color.setRgb(rs.getString("rgb"));

				role.setId(rs.getInt("role_id"));
				role.setRole_name(rs.getString("role_name"));
				role.setDescription(rs.getString("description"));
				role.setCreated_at(rs.getDate("created_at"));
				role.setUpdated_at(rs.getDate("updated_at"));

				brand.setId(rs.getInt("brand_id"));
				brand.setBrand_name(rs.getString("brand_name"));

				user.setId(rs.getInt("user_id"));
				user.setFullname(rs.getString("fullname"));
				user.setEmail(rs.getString("email"));
				user.setPhone_number(rs.getString("phone_number"));
				user.setAddress(rs.getString("address"));
				user.setPassword(rs.getString("password"));
				user.setAvatar(rs.getString("avatar"));
				user.setRole(role);

				style.setId(rs.getInt("style_id"));
				style.setStyle_name(rs.getString("style_name"));

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
	public List<Color_size> getAllColor_Size() {
		List<Color_size> li = new LinkedList<>();
		for (Color_size c : getAllProduct_Color_Size()) {
			if(c.getQuantity() > 0) {
				li.add(c);
			}
		}
		return li;
	}
	
	public List<Color_size> getAllProduct_Color_Size() {
		List<Color_size> li = null;
		try {
			connectService = new ConnectService();
			li = new ArrayList<>();
			Connection con = connectService.getConnect();
			Statement stmt;
			stmt = (Statement) con.createStatement();
			ResultSet rs = stmt
					.executeQuery("select * from color_size " + "Inner join product on color_size.prod_id = product.id "
							+ "Inner join brand on product.brand_id = brand.id "
							+ "Inner join style on product.style_id = style.id "
							+ "Inner join user on product.user_id = user.id "
							+ "Inner join gender on product.gender_id = gender.id "
							+ "Inner join role on role.id = user.role_id "
							+ "Inner join sizes on sizes.id = color_size.size_id "
							+ "Inner join color on color.id = color_size.color_id ");
			while (rs.next()) {
				product = new Product();
				brand = new Brand();
				user = new User();
				role = new Role();
				color_size = new Color_size();
				color = new Color();
				size = new Sizes();
				style = new Style();
				gender = new Gender();

				gender.setId(rs.getInt("gender_id"));
				gender.setGender_name(rs.getString("gender_name"));
				gender.setDescription(rs.getString("description"));

				size.setId(rs.getInt("size_id"));
				size.setSize_number(rs.getInt("size_number"));
				size.setCreated_at(rs.getDate("created_at"));
				size.setUpdated_at(rs.getDate("updated_at"));

				color.setId(rs.getInt("color_id"));
				color.setColor_name(rs.getString("color_name"));
				color.setRgb(rs.getString("rgb"));

				role.setId(rs.getInt("role_id"));
				role.setRole_name(rs.getString("role_name"));
				role.setDescription(rs.getString("description"));
				role.setCreated_at(rs.getDate("created_at"));
				role.setUpdated_at(rs.getDate("updated_at"));
				
				brand.setId(rs.getInt("brand_id"));
				brand.setBrand_name(rs.getString("brand_name"));

				user.setId(rs.getInt("user_id"));
				user.setFullname(rs.getString("fullname"));
				user.setEmail(rs.getString("email"));
				user.setPhone_number(rs.getString("phone_number"));
				user.setAddress(rs.getString("address"));
				user.setPassword(rs.getString("password"));
				user.setAvatar(rs.getString("avatar"));
				user.setRole(role);

				style.setId(rs.getInt("style_id"));
				style.setStyle_name(rs.getString("style_name"));

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
				color_size.setQuantity(rs.getInt("quantity"));
				li.add(color_size);
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return li;
	}

	public Color_size getByIdCS(int id_cs) {
		Color_size cs = null;
		for (Color_size i : getAllColor_Size()) {
			if(i.getId() == id_cs) {
				cs = i;
			}
		}
		return cs;
	}
	
	public User getUserByIdUser(int id_u) {
		User cs = null;
		for (Color_size i : getAllColor_Size()) {
			if (i.getProd().getUser().getId()==id_u) {
				cs = i.getProd().getUser();
			}
		}
		return cs;
	}
	
	public int firstColor_SizeById_Prod(int id_prod) {
		int id = 1;
		for (Color_size c : getAllColor_Size()) {
			if (c.getProd().getId() == id_prod) {
				id = c.getId();
				break;
			}
		}
		return id;
	}
	
	public int firstColorId(int prod) {
		int color_id = 0;
		Color_sizeService colorService = new Color_sizeService();
		List<Color_size> li = colorService.getAllColorById_prod(prod);
		for (Color_size cz : li) {
			color_id = cz.getColor().getId();
			break;
		}
		return color_id;
	}

	@Override
	public int firstSizeId(int prod, int color) {
		int size_id = 0;
		Color_sizeService colorService = new Color_sizeService();
		List<Color_size> li = colorService.getAllColor_sizeById_prod(prod, color);
		for (Color_size cz : li) {
			size_id = cz.getSize().getId();
			break;
		}
		return size_id;
	}

	@Override
	public HashMap<Integer, List<Sizes>> getHMColor_Size(int prod) {
		HashMap<Integer, List<Sizes>> hm = new HashMap<>();
		Color_sizeService colorService = new Color_sizeService();
		List<Sizes> listS = new ArrayList<>();
		List<Color_size> li = colorService.getAllColorById_prod(prod);
		for (Color_size cz : li) {
			listS = listSize(prod, cz.getColor().getId());
			hm.put(cz.getColor().getId(), listS);
		}
		return hm;
	}

	@Override
	public List<Sizes> listSize(int prod, int color) {
		List<Sizes> listS = new ArrayList<>();
		Color_sizeService colorService = new Color_sizeService();
		List<Color_size> li = colorService.getAllColor_sizeById_prod(prod, color);
		for (Color_size cz : li) {
			Sizes si = new Sizes();
			si = cz.getSize();
			listS.add(si);
		}
		return listS;
	}

	@Override
	public List<Integer> getAllProd_id() {
		List<Integer> li = null;
		try {
			connectService = new ConnectService();
			li = new ArrayList<>();
			Connection con = connectService.getConnect();
			Statement stmt;
			stmt = (Statement) con.createStatement();
			ResultSet rs = stmt
					.executeQuery("select * from color_size " + "Inner join product on color_size.prod_id = product.id "
							+ "Inner join brand on product.brand_id = brand.id "
							+ "Inner join style on product.style_id = style.id "
							+ "Inner join user on product.user_id = user.id "
							+ "Inner join gender on product.gender_id = gender.id "
							+ "Inner join role on role.id = user.role_id "
							+ "Inner join sizes on sizes.id = color_size.size_id "
							+ "Inner join color on color.id = color_size.color_id " + "Where quantity > 0 "
							+ " group by prod_id");
			while (rs.next()) {
				product = new Product();
				brand = new Brand();
				user = new User();
				role = new Role();
				color_size = new Color_size();
				color = new Color();
				size = new Sizes();
				style = new Style();
				gender = new Gender();

				gender.setId(rs.getInt("gender_id"));
				gender.setGender_name(rs.getString("gender_name"));
				gender.setDescription(rs.getString("description"));

				size.setId(rs.getInt("size_id"));
				size.setSize_number(rs.getInt("size_number"));
				size.setCreated_at(rs.getDate("created_at"));
				size.setUpdated_at(rs.getDate("updated_at"));

				color.setId(rs.getInt("color_id"));
				color.setColor_name(rs.getString("color_name"));
				color.setRgb(rs.getString("rgb"));

				role.setId(rs.getInt("role_id"));
				role.setRole_name(rs.getString("role_name"));
				role.setDescription(rs.getString("description"));
				role.setCreated_at(rs.getDate("created_at"));
				role.setUpdated_at(rs.getDate("updated_at"));
				
				brand.setId(rs.getInt("brand_id"));
				brand.setBrand_name(rs.getString("brand_name"));

				user.setId(rs.getInt("user_id"));
				user.setFullname(rs.getString("fullname"));
				user.setEmail(rs.getString("email"));
				user.setPhone_number(rs.getString("phone_number"));
				user.setAddress(rs.getString("address"));
				user.setPassword(rs.getString("password"));
				user.setAvatar(rs.getString("avatar"));
				user.setRole(role);

				style.setId(rs.getInt("style_id"));
				style.setStyle_name(rs.getString("style_name"));

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
				color_size.setQuantity(rs.getInt("quantity"));
				li.add(rs.getInt("prod_id"));
			}
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return li;
	}

	@Override
	public HashMap<Integer, HashMap<Integer, List<Sizes>>> getCS() {
		Color_sizeService cls = new Color_sizeService();
		HashMap<Integer, HashMap<Integer, List<Sizes>>> hm = new HashMap<>();
		List<Integer> li = cls.getAllProd_id();
		for (Integer i : li) {
			hm.put(i, getHMColor_Size(i));
		}
		return hm;
	}

	public HashMap<Integer, List<Color_size>> getAllSizeById_Prod(int prod) {
		HashMap<Integer, List<Color_size>> hm = new LinkedHashMap<>();
		List<Color_size> li = getAllColorById_prod(prod);

		for (Color_size color_size : li) {
			List<Color_size> list = getAllColor_sizeById_prod(prod, color_size.getColor().getId());
			hm.put(color_size.getColor().getId(), list);
		}

		return hm;
	}

	public boolean updateColor_size_Quantity(int size_id, int color_id, int prod_id, int amount) {
		try {
			connectService = new ConnectService();
			Connection conn = connectService.getConnect();
			//check id_prod
			boolean check = false;
			List<Color_size> list = getAllColor_Size();
			for (Color_size cs : list) {
				if(cs.getProd().getId()==prod_id && cs.getColor().getId()==color_id && cs.getSize().getId()==size_id) {
					check=true;
				}
				//System.out.println(cs.getProd().getId()+ "=="+cs.getColor().getId() +"="+ cs.getSize().getId());
			}
			if(check) {
				String query = "update color_size set quantity = quantity - ? where size_id = ? and color_id = ? and prod_id = ?";
				PreparedStatement preparedStmt = (PreparedStatement) conn.prepareStatement(query);
				preparedStmt.setInt(1, amount);
				preparedStmt.setInt(2, size_id);
				preparedStmt.setInt(3, color_id);
				preparedStmt.setInt(4, prod_id);
				preparedStmt.executeUpdate();
				conn.close();
				return true;
			} else {
				return false;
			}
			//System.out.println(list.size());
			// create the java mysql update preparedstatement
			
		} catch (Exception e) {
			System.err.println("Got an exception! ");
			System.err.println(e.getMessage());
		}
		return false;
	}
	
	public boolean insertIntoColor_Size(String size_quantity, int color_id, int prod_id) {
		try {
			connectService = new ConnectService();
			Connection conn = connectService.getConnect();
			HashMap<Integer, Integer> hm = getSize_Quantity(size_quantity);
			for (Integer i : hm.keySet()) {
				if (checkColor_size(i, color_id, prod_id)) {

				} else {

					String sql = "INSERT INTO `color_size`(`size_id`, `color_id`, `prod_id`, `quantity`) "
							+ "VALUES (?, ?, ?, ?)";
					PreparedStatement preparedStmt = (PreparedStatement) conn.prepareStatement(sql);
					preparedStmt.setInt(1, i);
					preparedStmt.setInt(2, color_id);
					preparedStmt.setInt(3, prod_id);
					preparedStmt.setInt(4, hm.get(i));
					preparedStmt.execute();
				}

			}

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

	public HashMap<Integer, Integer> getSize_Quantity(String txt) {
		sizeService = new SizeService();
		HashMap<Integer, Integer> hm = new LinkedHashMap<Integer, Integer>();
		String arr[] = {};
		String arr1[] = {};
		if (!txt.equals("")) {
			arr = txt.split("/");
			for (String s : arr) {
				if (!s.equals("")) {
					arr1 = s.split("_");
					if(arr1.length==1) {
						hm.put(sizeService.get_size_id_by_size_number(Integer.parseInt(arr1[0])), 0);
					} else {
						hm.put(sizeService.get_size_id_by_size_number(Integer.parseInt(arr1[0])), Integer.parseInt(arr1[1]));
					}
				}
			}
		}
		return hm;
	}

	public boolean checkColor_size(int size_id, int color_id, int prod_id) {

		for (Color_size i : getAllProduct_Color_Size()) {
			if (i.getSize().getId() == size_id && i.getColor().getId() == color_id && i.getProd().getId() == prod_id) {
				return true;
			}
		}
		return false;
	}

	public static void main(String[] args) {
		Color_sizeService cls = new Color_sizeService();
		HashMap<Integer, Integer> hm = cls.getSize_Quantity("32_123/33_150/34_300/35_400/36_500/37_500/38_400/39_400/40_300/41_200/42_100/43_50/44_50/45_50/46_50/47_50");
		for (Integer i : hm.keySet()) {
			System.out.println(i+ "=="+ hm.get(i));
			
		}
	}
}
