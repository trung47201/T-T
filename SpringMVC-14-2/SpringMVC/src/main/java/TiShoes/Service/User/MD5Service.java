package TiShoes.Service.User;


import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.net.URLDecoder;
import java.net.URLEncoder;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import static org.springframework.web.util.HtmlUtils.htmlUnescape;
import static org.springframework.web.util.HtmlUtils.htmlEscape;
import TiShoes.Repository.User.MD5Repository;

public class MD5Service implements MD5Repository{

	@Override
	public String StringToMD5(String strs) {
		String md5 ="";
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
		    md.update(strs.getBytes(), 0 , strs.length());
		    md5 = new BigInteger(1, md.digest()).toString(16);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return md5;
	}
	
	@Override
	public String decode(String strs) {
		String decode="";
		try {
			decode = URLDecoder.decode(strs, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return decode;
	}

	@Override
	public String encode(String strs) {
		String encode="";
		try {
			encode = URLEncoder.encode(strs, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return encode;
	}
	
	@Override
	public String decodeHTML(String strs) {
		String result = htmlUnescape(strs);
		return result;
	}
	
	@Override
	public String encodeHTML(String strs) {
		String result = htmlEscape(strs);
		return result;
	}
	
	public String decodeText(String encoded) {
		String decoded ="";
		try {
			decoded = new String(encoded.getBytes("ISO-8859-1"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 return decoded;
	}
	
	public static void main(String[] args) {
		MD5Service m = new MD5Service();
		System.out.println(m.decodeHTML("Đông Xuân-Sóc Sơn- Hà Nội"));
	}
}
