package TiShoes.Model;

import java.sql.Date;

public class Cart {
	private int id;
	private Color_size color_size;
	private int Quantity;
	private User user;
	private Date created_at;
	private Date updated_at;
	
	public Cart() {
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public int getQuantity() {
		return Quantity;
	}
	public void setQuantity(int quantity) {
		Quantity = quantity;
	}
	public Color_size getColor_size() {
		return color_size;
	}
	public void setColor_size(Color_size color_size) {
		this.color_size = color_size;
	}


	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
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
