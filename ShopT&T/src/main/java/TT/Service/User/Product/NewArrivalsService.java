package TT.Service.User.Product;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import TT.Model.Product;

public class NewArrivalsService {
	public List<Product> getNewArrivals() {
		ShoesService p = new ShoesService();
		List<Product> li = p.getAllProducts();
		Collections.sort(li, new Comparator<Product>() {
			@Override
			public int compare(Product o1, Product o2) {
				return o2.getId() - o1.getId();
			}
		});
		return li;
	}
}
