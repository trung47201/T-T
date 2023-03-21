package TT.Service.Admin;

import java.util.List;

import TT.Model.Gallery;
import TT.Repository.Admin.aGalleryRepository;
import TT.Service.User.GalleryService;

public class aGalleryService implements aGalleryRepository{

	private GalleryService galleryService;
	
	@Override
	public List<Gallery> getAllGallery() {
		galleryService = new GalleryService();
		return galleryService.getAllGallery();
	}

}
