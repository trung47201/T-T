package TiShoes.Model;

public class Feedback {
	
	private int id;
	private String customer_name;
	private String customer_contact;
	private String note;
	private Color color;
	
	
	public Feedback() {
		// TODO Auto-generated constructor stub
	}	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCustomer_name() {
		return customer_name;
	}
	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}
	public String getCustomer_contact() {
		return customer_contact;
	}
	public void setCustomer_contact(String customer_contact) {
		this.customer_contact = customer_contact;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public Color getColor() {
		return color;
	}
	public void setColor(Color color) {
		this.color = color;
	}
	
	
}
