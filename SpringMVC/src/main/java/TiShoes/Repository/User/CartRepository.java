package TiShoes.Repository.User;

import java.util.HashMap;

import TiShoes.Model.Product;

public interface CartRepository {
	public HashMap<String, Integer> getListProdCard(String str);
	public String PlusProdCard(String id_prod, String list_prod);
	public String MinusProdCard(String id_prod, String list_prod);
	public String DelProdCard(String id_prod, String list_prod);
	public double TotalProdCard(Product p, String amount);
}
