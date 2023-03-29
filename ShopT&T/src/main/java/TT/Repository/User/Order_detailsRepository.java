package TT.Repository.User;

import java.util.List;

import TT.Model.Receipt_details;

public interface Order_detailsRepository {
	public List<Receipt_details> getAllOrder_details();
	public boolean insertIntoOrder_details(double price_at, int quantity, int prod_id, int size_id,
			int color_id, String phone_number, String email);
}
