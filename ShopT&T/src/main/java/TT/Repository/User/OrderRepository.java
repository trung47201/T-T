package TT.Repository.User;

import java.util.List;

import TT.Model.Receipt;

public interface OrderRepository {
	public List<Receipt> getAllOrder();
	public boolean insertIntoOrder(String fullname, String email, String phone_number, String address, int voucher_id,
			String note, String method, double discount_at);
}
