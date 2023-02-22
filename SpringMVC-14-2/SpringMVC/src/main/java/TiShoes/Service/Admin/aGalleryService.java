package TiShoes.Service.Admin;

import java.util.List;

import TiShoes.Model.Gallery;
import TiShoes.Repository.Admin.aGalleryRepository;
import TiShoes.Service.User.GalleryService;

public class aGalleryService implements aGalleryRepository{

	private GalleryService galleryService;
	
	@Override
	public List<Gallery> getAllGallery() {
		galleryService = new GalleryService();
		return galleryService.getAllGallery();
	}

}
