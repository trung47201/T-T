package TT.Model;

public class Receipt_details {
	private int id;
	private Receipt receipt;
	private Product prod;
	private double price_at;
	private int quantity;
	private Sizes size;
	private Color color;
	
	public Receipt_details() {
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Receipt getReceipt() {
		return receipt;
	}
	public void setReceipt(Receipt receipt) {
		this.receipt = receipt;
	}
	public Product getProd() {
		return prod;
	}
	public void setProd(Product prod) {
		this.prod = prod;
	}
	public double getPrice_at() {
		return price_at;
	}
	public void setPrice_at(double price_at) {
		this.price_at = price_at;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Sizes getSize() {
		return size;
	}
	public void setSize(Sizes size) {
		this.size = size;
	}
	public Color getColor() {
		return color;
	}
	public void setColor(Color color) {
		this.color = color;
	}
	
}
