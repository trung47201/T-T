package TiShoes.Repository.Admin;

import java.io.IOException;

public interface FileUploadRepository {
	public String encode(String imagePath) throws IOException;
	public byte[] decode(String base64String);
	public String saveImage(String base64String) throws IOException;
	public String get_file_name();
}
