package TT.Service.Shipper;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter; 
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;

public class QRCodeService {
	
	
	public String create_qr_code (String order_id) {
		try {
            String qrCodeData = order_id;
            String name = String.valueOf("qrcode"+order_id+".jpg" );
            String filePath = "D:\\DATN\\ShopTandT\\src\\main\\webapp\\assets\\images\\qrcode\\"+name;
            String charset = "UTF-8"; // or "ISO-8859-1"
            Map < EncodeHintType, ErrorCorrectionLevel > hintMap = new HashMap < EncodeHintType, ErrorCorrectionLevel > ();
            hintMap.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.L);
            BitMatrix matrix = new MultiFormatWriter().encode(
                new String(qrCodeData.getBytes(charset), charset),
                BarcodeFormat.QR_CODE, 200, 200, hintMap);
            MatrixToImageWriter.writeToFile(matrix, filePath.substring(filePath
                .lastIndexOf('.') + 1), new File(filePath));
            System.out.println("QR Code image "+name+" created successfully!");
            return name;
        } catch (Exception e) {
            System.err.println(e);
        }
		return "";
	}
	
	public String create_bar_code (String order_id) {
		try {
            String qrCodeData = order_id;
            String name = String.valueOf("barcode"+order_id+".jpg" );
            String filePath = "D:\\DATN\\ShopTandT\\src\\main\\webapp\\assets\\images\\barcode\\"+name;
            String charset = "UTF-8"; // or "ISO-8859-1"
            Map < EncodeHintType, ErrorCorrectionLevel > hintMap = new HashMap < EncodeHintType, ErrorCorrectionLevel > ();
            hintMap.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.L);
            BitMatrix matrix = new MultiFormatWriter().encode(
                new String(qrCodeData.getBytes(charset), charset),
                BarcodeFormat.CODE_128, 300, 80, hintMap);
            MatrixToImageWriter.writeToFile(matrix, filePath.substring(filePath
                .lastIndexOf('.') + 1), new File(filePath));
            System.out.println("BAR Code image "+name+" created successfully!");
            return name;
        } catch (Exception e) {
            System.err.println(e);
        }
		return "";
	}
}
