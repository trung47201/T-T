package TT.Repository.User;

import java.util.List;

import TT.Model.Color;

public interface ColorRepository {
	public List<Color> getAllColor();
	public Color getColorById(int color_id);
}
