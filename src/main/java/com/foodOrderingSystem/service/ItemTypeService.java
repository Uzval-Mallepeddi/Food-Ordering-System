package com.foodOrderingSystem.service;

import java.util.List;

import com.foodOrderingSystem.entity.ItemType;

public interface ItemTypeService {
	public void save(ItemType type);
	public List<ItemType> getAllItemTypes();
	public ItemType getItem(int theId);
	public void deleteItemType(int id);
}
