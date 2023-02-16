package TiShoes.Model;

import java.sql.Date;

public class Rating {
	private int id;
	private int rating_stars;
	private Date rating_date;
	private String rating_by;
	private String rating_content;
	private String rating_img;
	private String rating_video;
	Product product;
	
	public Rating() {
		// TODO Auto-generated constructor stub
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getRating_stars() {
		return rating_stars;
	}

	public void setRating_stars(int rating_stars) {
		this.rating_stars = rating_stars;
	}

	public Date getRating_date() {
		return rating_date;
	}

	public void setRating_date(Date rating_date) {
		this.rating_date = rating_date;
	}

	public String getRating_by() {
		return rating_by;
	}

	public void setRating_by(String rating_by) {
		this.rating_by = rating_by;
	}

	public String getRating_content() {
		return rating_content;
	}

	public void setRating_content(String rating_content) {
		this.rating_content = rating_content;
	}

	public String getRating_img() {
		return rating_img;
	}

	public void setRating_img(String rating_img) {
		this.rating_img = rating_img;
	}

	public String getRating_video() {
		return rating_video;
	}

	public void setRating_video(String rating_video) {
		this.rating_video = rating_video;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}
	
	
}
