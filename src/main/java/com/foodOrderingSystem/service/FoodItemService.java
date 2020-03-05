package com.foodOrderingSystem.service;

import java.util.List;

import com.foodOrderingSystem.entity.FoodItem;

public interface FoodItemService {
	public void save(FoodItem type);
	public List<FoodItem> getAllFoodItems();
	public FoodItem getFoodItem(int theId, String item_availability);
	public void deleteFoodItem(int id, String item_availability);
}
