package TiShoes.Repository.User;

import java.util.List;

import TiShoes.Model.Color;

public interface ColorRepository {
	public List<Color> getAllColor();
	public Color getColorById(int color_id);
}
