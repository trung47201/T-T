package TiShoes.Model;

public class Order_details {
	private int id;
	private Order_ order_;
	private Product prod;
	private double price_at;
	private int quantity;
	private Sizes size;
	private Color color;
	
	public Order_details() {
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Order_ getOrder_() {
		return order_;
	}
	public void setOrder_(Order_ order_) {
		this.order_ = order_;
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
