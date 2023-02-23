package TiShoes.Service.Admin;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Base64;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class FileUploadService{

	final static String name_of_ti_shoes = "ti_shoes_products_";
	final static String file_imgafe_name_of_ti_shoes = "ti_shoes_products_.png";
	
	public static void main(String[] args) throws FileNotFoundException, IOException {
		
	}

	public String saveFile(MultipartFile file) {
		if( file != null && !file.isEmpty()) {
			try {
				
				byte[] bytes = file.getBytes();
				//String rootpath = System.getProperty("catalina.home");
				
				File dir = new File("D:\\TTTN\\SpringMVC-14-2\\SpringMVC\\src\\main\\webapp\\assets\\images\\products");
				if(!dir.exists()) {
					dir.mkdir();
				}
				
				String name = String.valueOf("ti_shoes_"+new Date().getTime()+".jpg" );
				File serverFile = new File(dir.getAbsolutePath()+"\\"+name);
				
				System.out.println("path: " + serverFile.getPath());
				
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();
				
				return name;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	public static String saveImage(String base64String) throws IOException {
		String name_img = "";
		String filePath = "src\\main\\webapp\\assets\\images\\products\\" + file_imgafe_name_of_ti_shoes;
		File f = new File(filePath);
		if (f.exists() && !f.isDirectory()) {
			name_img = get_file_name();
			filePath = "src\\main\\webapp\\assets\\images\\products\\" + name_img;
			File file = new File(filePath);
			try (FileOutputStream stream = new FileOutputStream(file)) {
				stream.write(decode(base64String));
				System.out.println("Success save img with new name!");
			}
			
		} else {
			try (FileOutputStream stream = new FileOutputStream(f)) {
				stream.write(decode(base64String));
				System.out.println("Success save img!");
			}
		}
		return name_img;
	}

	public static String get_file_name() {
		File folder = new File("src\\main\\webapp\\assets\\images\\products");
		File[] listOfFiles = folder.listFiles();

		String last_flie_name = "";
		for (int i = 0; i < listOfFiles.length; i++) {
			if (listOfFiles[i].isFile()) {
				if (listOfFiles[i].getName().contains(name_of_ti_shoes)) {
					last_flie_name = listOfFiles[i].getName();
					System.out.println("last" + last_flie_name);
				}

			} else if (listOfFiles[i].isDirectory()) {
				System.out.println("Directory " + listOfFiles[i].getName());
			}
		}
		String digits = last_flie_name.replaceAll("\\D+", "");
		int number_img = 0;
		if (digits.equals("")) {
			number_img = 1;
		} else {
			number_img = Integer.parseInt(digits) + 1;
		}

		return name_of_ti_shoes + String.valueOf(number_img) + ".png";
	}

	public static String encode(String imagePath) throws IOException {
		byte[] data = Files.readAllBytes(Paths.get(imagePath));
		return Base64.getEncoder().encodeToString(data);
	}

	public static byte[] decode(String base64String) {
		return Base64.getDecoder().decode(base64String);
	}

}
