package TiShoes.Repository.Admin;

import java.util.List;

import TiShoes.Model.Order_;

public interface aOrderRepository {
	public List<Order_> getAllOrder();
	public boolean addOrder();
	public boolean editOrder();
}
