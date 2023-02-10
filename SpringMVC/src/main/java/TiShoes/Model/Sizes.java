package TiShoes.Model;

import java.util.Date;

public class Sizes {
	private int id;
	private int size_number;
	private Date created_at;
	private Date updated_at;
	public Sizes() {
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getSize_number() {
		return size_number;
	}
	public void setSize_number(int size_number) {
		this.size_number = size_number;
	}
	public Date getCreated_at() {
		return created_at;
	}
	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}
	public Date getUpdated_at() {
		return updated_at;
	}
	public void setUpdated_at(Date updated_at) {
		this.updated_at = updated_at;
	}
	
	
}
