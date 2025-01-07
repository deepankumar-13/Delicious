package com.Delicious.Interface;

import java.util.List;

import com.Delicious.Model.Menu;

public interface MenuDAO {
	List<Menu> fetchMenuByRestaurant(int restaurant_id);
	public Menu fetchMenuByMenuID(int itemId);
}
