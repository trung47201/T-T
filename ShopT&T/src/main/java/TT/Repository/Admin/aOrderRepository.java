package TT.Repository.Admin;

import java.util.List;

import TT.Model.Order;

public interface aOrderRepository {
	public List<Order> getAllOrder();
	public boolean addOrder();
	public boolean editOrder();
}
