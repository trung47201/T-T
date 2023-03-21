package TT.Repository.Admin;

import java.util.List;

import TT.Model.Order_;

public interface aOrderRepository {
	public List<Order_> getAllOrder();
	public boolean addOrder();
	public boolean editOrder();
}
