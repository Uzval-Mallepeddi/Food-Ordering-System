package com.foodOrderingSystem.dao;

import java.util.List;

import com.foodOrderingSystem.entity.FoodItem;

public interface FoodItemDAO {
	public void saveFoodItem(FoodItem type);
	public List<FoodItem> getAll();
	public FoodItem getFoodItem(int theId, String item_availability);
	public void delete(int id, String item_availability);
}
