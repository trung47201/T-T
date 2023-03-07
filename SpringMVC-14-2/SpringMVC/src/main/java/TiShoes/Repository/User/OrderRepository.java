package TiShoes.Repository.User;

import java.util.List;

import TiShoes.Model.Order_;

public interface OrderRepository {
	public List<Order_> getAllOrder();
	public boolean insertIntoOrder(String fullname, String email, String phone_number, String address, int voucher_id,
			String note, String method, double discount_at);
}
