package com.foodOrderingSystem.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.foodOrderingSystem.dao.FoodItemDAO;
import com.foodOrderingSystem.entity.FoodItem;

@Service
public class FoodItemServiceImpl implements FoodItemService {

	@Autowired
	public FoodItemDAO foodItemDAO;
	
	@Override
	@Transactional
	public void save(FoodItem type) {
		foodItemDAO.saveFoodItem(type);
	}

	@Override
	@Transactional
	public List<FoodItem> getAllFoodItems() {
		List<FoodItem> allFoodItems = foodItemDAO.getAll();
		return allFoodItems;
	}

	@Override
	@Transactional
	public FoodItem getFoodItem(int theId, String item_availability) {
		FoodItem type = foodItemDAO.getFoodItem(theId, item_availability);
		return type;
	}

	@Override
	@Transactional
	public void deleteFoodItem(int id, String item_availability) {
		foodItemDAO.delete(id, item_availability);
	}
}
