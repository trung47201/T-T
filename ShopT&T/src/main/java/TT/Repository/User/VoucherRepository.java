package TT.Repository.User;

import java.util.List;

import TT.Model.Voucher;

public interface VoucherRepository {
	public List<Voucher> getAllVoucher();
	public int getDiscountById_Voucher(int voucher_id);
	public int getVoucherIdByCode(String code);
}
