package TT.Repository.Admin;

import java.util.List;

import TT.Model.Receipt;

public interface aOrderRepository {
	public List<Receipt> getAllOrder();
	public boolean addOrder();
	public boolean editOrder();
}
