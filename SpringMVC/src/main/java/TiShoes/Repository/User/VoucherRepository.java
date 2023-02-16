package TiShoes.Repository.User;

import java.util.List;

import TiShoes.Model.Voucher;

public interface VoucherRepository {
	public List<Voucher> getAllVoucher();
	public int getDiscountById_Voucher(int voucher_id);
	public int getVoucherIdByCode(String code);
}
