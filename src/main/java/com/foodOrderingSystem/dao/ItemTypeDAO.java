package com.foodOrderingSystem.dao;

import java.util.List;

import com.foodOrderingSystem.entity.ItemType;

public interface ItemTypeDAO {
	public void saveItemType(ItemType type);
	public List<ItemType> getAll();
	public ItemType getItem(int theId);
	public void delete(int id);
}
