package com.foodOrderingSystem.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.foodOrderingSystem.entity.ItemType;
import com.foodOrderingSystem.entity.User;
import com.foodOrderingSystem.service.ItemTypeService;
import com.foodOrderingSystem.service.UserService;

@Controller
public class ItemTypeController {
	
	@Autowired
    private ItemTypeService itemTypeService;
	
	@GetMapping("/itemtype/new")
	public String itemtype(Model itemTypeModel) {
		ItemType itemtype = new ItemType();
		itemTypeModel.addAttribute("itemtype", itemtype);
		return "new_item_type";
	}
	
	@GetMapping("/itemtypes")
	public String listitemtypes(Model theModel) {
		List<ItemType> itemTypes = itemTypeService.getAllItemTypes();
		theModel.addAttribute("itemTypes", itemTypes);
		return "item_types";
	}
	
	@PostMapping("/saveItemType")
	public String itemToSave(@Valid @ModelAttribute("itemtype") ItemType itemType, BindingResult theBindingResult) {
		itemTypeService.save(itemType);
		return "redirect:/itemtypes";
	}
	
	@GetMapping("/itemtype/update/{id}")
	public String updateItemType(@PathVariable int id, Model theModel) {
		ItemType item = itemTypeService.getItem(id);
		theModel.addAttribute("itemtype", item);
		return "new_item_type";
	}
	
	@GetMapping("/itemtype/view/{id}")
	public String viewItemType(@PathVariable int id, Model theModel) {
		ItemType item = itemTypeService.getItem(id);
		theModel.addAttribute("type", item.getType());
		theModel.addAttribute("description", item.getDescription());
		theModel.addAttribute("id", item.getId());
		return "itemtype";
	}
	
	@GetMapping("/itemtype/delete/{id}")
	public String deleteItemType(@PathVariable int id) {
		itemTypeService.deleteItemType(id);
		return "redirect:/itemtypes";
	}
	
}
