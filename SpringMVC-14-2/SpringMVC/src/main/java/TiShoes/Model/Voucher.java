package TiShoes.Model;

import java.sql.Timestamp;
import java.util.Date;

public class Voucher {
	
	private int id;
	private String code;
	private int vcdiscount;
	private int limit;
	private int applyfor;
	private Timestamp start_date;
	private Timestamp end_date;
	private Timestamp created_at;
	private Timestamp updated_at;
	private String description;
	public Voucher() {
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public int getVcdiscount() {
		return vcdiscount;
	}
	public void setVcdiscount(int vcdiscount) {
		this.vcdiscount = vcdiscount;
	}
	public int getLimit() {
		return limit;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}
	public int getApplyfor() {
		return applyfor;
	}
	public void setApplyfor(int applyfor) {
		this.applyfor = applyfor;
	}
	public Timestamp getStart_date() {
		return start_date;
	}
	public void setStart_date(Timestamp start_date) {
		this.start_date = start_date;
	}
	public Timestamp getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Timestamp end_date) {
		this.end_date = end_date;
	}
	public Timestamp getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Timestamp created_at) {
		this.created_at = created_at;
	}
	public Timestamp getUpdated_at() {
		return updated_at;
	}
	public void setUpdated_at(Timestamp updated_at) {
		this.updated_at = updated_at;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	
	
}
