package TiShoes.Service.User;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import TiShoes.Model.Product;
import TiShoes.Repository.User.CartRepository;

public class CartService implements CartRepository {

	private ProductService productService;

	@Override
	public HashMap<String, Integer> getListProdCard(String str) {
		String arr[] = str.split("/");
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		for (int i = 0; i < arr.length; i++) {
			if(!arr[i].equals("")) {
				if (!map.containsKey(arr[i])) {
					map.put(arr[i], 1);
				} else {
					map.put(arr[i], map.get(arr[i]) + 1);
				}
			}
		}
		return map;
	}

	@Override
	public String PlusProdCard(String id_prod, String list_prod) {
		String newListProd = "";
		String arr1[] = id_prod.split("_");
		newListProd = list_prod + "/" + arr1[0].toString();		
		return newListProd;
	}
	
	public String getTextHM(String s, int num) {
		String str="";
		for (int i=0; i<num; i++) {
			str += s+"/";
		}
		return str;
	}

	@Override
	public String MinusProdCard(String id_prod, String list_prod) {
		String newListProd = "";
		String arr1[] = id_prod.split("_");
		HashMap<String, Integer> map = getListProdCard(list_prod);
		for (String i : map.keySet()) {
			if (i.equals(arr1[0])) {
				if (map.get(i)-1==0) {
					map.remove(i);
				}else {
					map.put(i, map.get(i)-1);
				}
			}
		}
		for (String i : map.keySet()) {
			newListProd += getTextHM(i, map.get(i));
		}
		return newListProd;
	}

	@Override
	public String DelProdCard(String id_prod, String list_prod) {
		String newListProd = "";
		String arr[] = list_prod.split("/");
		String arr1[] = id_prod.split("_");
		for (int i = 0; i < arr.length; i++) {
			if (!arr[i].equals(arr1[0])) {
				newListProd += arr[i]+"/";
			} 
		}
		return newListProd;
	}

	@Override
	public double TotalProdCard(Product p, String amount) {
		double total = 0;
		if (p.getDiscount() > 0) {
			total = p.getPrice() * Double.parseDouble(amount)
					- p.getPrice() * Double.parseDouble(amount) * p.getDiscount() / 100;
		} else if (p.getDiscount() <= 0) {
			total = p.getPrice() * Double.parseDouble(amount);
		}
		return total;
	}

	public double totalProd(String prod) {
		productService = new ProductService();

		String arr[] = prod.split("/");
		double total = 0;
		for (int i = 0; i < arr.length; i++) {
			String arr2[] = arr[i].split("_");
			Product p = productService.getProduct(Integer.parseInt(arr2[0]));
			if (p.getDiscount() > 0) {
				total += p.getPrice() * Integer.parseInt(arr2[1])
						- p.getPrice() * Integer.parseInt(arr2[1]) * p.getDiscount() / 100;
			} else {
				total += p.getPrice() * Integer.parseInt(arr2[1]);
			}

		}
		return total;
	}

	public List<Integer> listProd_id(String prod) {
		productService = new ProductService();
		List<Integer> li = new ArrayList<>();
		String arr[] = prod.split("/");
		for (int i = 0; i < arr.length; i++) {
			String arr2[] = arr[i].split("_");
			li.add(Integer.parseInt(arr2[0]));
		}
		return li;
	}

	public HashMap<Integer, Integer> getProd_Color_Size(String sColor) {
		String arr[] = sColor.split("/");
		HashMap<Integer, Integer> map = new HashMap<>();
		for (int i = 0; i < arr.length; i++) {
			String arr1[] = arr[i].split("_");
			map.put(Integer.parseInt(arr1[1]), Integer.parseInt(arr1[0]));
		}
		return map;
	}
	
	public HashMap<String, Integer>  getProd_Color_Sizes(String sSize) {
		String arr[] = sSize.split("/");
		HashMap<String, Integer> map = new HashMap<>();
		for (int i = 0; i < arr.length; i++) {
			String arr1[] = arr[i].split("_");
			map.put(arr1[1]+"_"+arr1[2], Integer.parseInt(arr1[0]));
		}
		return map;
	}

	public String getTxt(String color, String value) {
		String s1[] = value.split("/");
		String c[] = color.split("_");
		String rs = "";
		for (String s : s1) {
			String v[] = s.split("_");
			if (v[1].equals(c[1])) {
				rs = value.replace(s, color);
			}
		}
		if (rs.isEmpty()) {
			if(!value.contains(color)) {
				rs = value + "/" + color;
				return rs;
			} else {
				return value;
			}
		} else {
			return rs;
		}
	}
	
	public String getTxt_size(String size, String value) {
		String s1[] = value.split("/");
		String s[] = size.split("_");
		String rs = "";
		for (String str : s1) {
			String v[] = str.split("_");
			if (v[2].equals(s[2])) {
				rs = value.replace(str, size);
			}
		}
		if (rs.isEmpty()) {
			if(!value.contains(size)) {
				rs = value + "/" + size;
				return rs;
			} else {
				return value;
			}
		} else {
			return rs;
		}
	}

	public static void main(String[] args) {
		CartService c = new CartService();
		
		System.out.println(c.MinusProdCard("1_2", "15/1/14/1/2/1"));
		
	}
}
