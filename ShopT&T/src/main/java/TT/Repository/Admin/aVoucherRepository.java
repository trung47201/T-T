package TT.Repository.Admin;

import java.sql.Timestamp;
import java.util.List;

import TT.Model.Voucher;

public interface aVoucherRepository {
	public List<Voucher> getAllVoucher();

	public boolean insert(String code, int discount, int limit, Timestamp start_date, Timestamp end_date, String description, int applyfor);

	public boolean update(int id, int discount, int limit,  Timestamp start_date, Timestamp end_date, String description, int applyfor);
	
	public boolean exists_voucher_code(String code);
}
