package TT.Model;

public class Product_color_size {
	private int id;
	private Sizes size;
	private Color color;
	private Product prod;
	private int Quantity;
	public Product_color_size() {
		// TODO Auto-generated constructor stub
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public Product getProd() {
		return prod;
	}
	public void setProd(Product prod) {
		this.prod = prod;
	}
	public int getQuantity() {
		return Quantity;
	}
	public void setQuantity(int Quantity) {
		this.Quantity = Quantity;
	}
	
}
