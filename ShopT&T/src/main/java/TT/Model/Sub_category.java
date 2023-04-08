package TT.Model;

public class Sub_category {
	private int id;
	private String sub_category_name;
	private Category category;
	
	public Sub_category() {
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSub_category_name() {
		return sub_category_name;
	}

	public void setSub_category_name(String sub_category_name) {
		this.sub_category_name = sub_category_name;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}
	
}
