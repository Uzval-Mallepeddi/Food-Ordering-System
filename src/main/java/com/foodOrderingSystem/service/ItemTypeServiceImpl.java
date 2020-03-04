package com.foodOrderingSystem.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.foodOrderingSystem.dao.ItemTypeDAO;
import com.foodOrderingSystem.entity.ItemType;

@Service
public class ItemTypeServiceImpl implements ItemTypeService {

	@Autowired
	private ItemTypeDAO itemTypeDAO;
	
	@Override
	@Transactional
	public void save(ItemType itemType) {
		itemTypeDAO.saveItemType(itemType);
	}
	
	@Override
	@Transactional
	public List<ItemType> getAllItemTypes() {
		List<ItemType> allItemTypes = itemTypeDAO.getAll();
		return allItemTypes;
	}

	@Override
	@Transactional
	public ItemType getItem(int theId) {
		ItemType type = itemTypeDAO.getItem(theId);
		return type;
	}
	
	@Override
	@Transactional
	public void deleteItemType(int id) {
		itemTypeDAO.delete(id);
	}
}
