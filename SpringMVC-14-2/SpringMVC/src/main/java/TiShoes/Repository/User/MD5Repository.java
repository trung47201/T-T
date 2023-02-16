package TiShoes.Repository.User;

public interface MD5Repository {
	public String StringToMD5(String strs);
	public String decodeHTML(String strs);
	public String encodeHTML(String strs);
	public String decode(String strs);
	public String encode(String strs);
	
}
