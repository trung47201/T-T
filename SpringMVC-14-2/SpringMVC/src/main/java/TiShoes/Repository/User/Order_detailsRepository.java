package TiShoes.Repository.User;

import java.util.List;

import TiShoes.Model.Order_details;

public interface Order_detailsRepository {
	public List<Order_details> getAllOrder_details();
	public boolean insertIntoOrder_details(double price_at, int quantity, int prod_id, int size_id,
			int color_id, String phone_number, String email);
}
