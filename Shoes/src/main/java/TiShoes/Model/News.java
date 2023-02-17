package TiShoes.Model;

import java.util.Date;

public class News {
	private int id;
	private String title;
	private Date post_date;
	private String by_name;
	private String content;
	private String image;
	
	public News() {
		// TODO Auto-generated constructor stub
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getPost_date() {
		return post_date;
	}
	public void setPost_date(Date post_date) {
		this.post_date = post_date;
	}
	
	public String getBy_name() {
		return by_name;
	}

	public void setBy_name(String by_name) {
		this.by_name = by_name;
	}

	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	
}
