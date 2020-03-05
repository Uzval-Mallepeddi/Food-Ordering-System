package com.foodOrderingSystem.controller;

import java.util.LinkedHashMap;
import java.util.List;

import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.foodOrderingSystem.entity.FoodItem;
import com.foodOrderingSystem.entity.ItemType;
import com.foodOrderingSystem.entity.User;
import com.foodOrderingSystem.service.FoodItemService;
import com.foodOrderingSystem.service.ItemTypeService;
import com.foodOrderingSystem.service.UserService;

@Controller
public class FoodItemController {
	
	@Autowired
	private ItemTypeService itemTypeService;
	
	@Autowired
	private FoodItemService foodItemService;
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/fooditems")
	public String getAllFoodItems(Model theModel) {
		List<FoodItem> foodItems = foodItemService.getAllFoodItems();
		theModel.addAttribute("foodItems", foodItems);
		return "food_items";
	}
	
	@ModelAttribute("itemtypes")
	public List<ItemType> allItemTypes(){
		List<ItemType> itemTypes = itemTypeService.getAllItemTypes();
		LinkedHashMap<Integer,String> itemTypeValues = new LinkedHashMap<Integer,String>();
		for(ItemType item: itemTypes) {
			itemTypeValues.put(item.getId(), item.getType());
		}
		return itemTypes;
	}
	
	@GetMapping("/fooditem/new")
	public String newFoodItem(Model foodItemModel) {
		FoodItem fooditem = new FoodItem();
		foodItemModel.addAttribute("fooditem", fooditem);
		return "new_food_item";
	}
	
	@PostMapping("/saveFoodItem")
	public String foodItemToSave(@Valid @ModelAttribute("fooditem") FoodItem foodItem, BindingResult theBindingResult) {
		foodItemService.save(foodItem);
		return "redirect:/fooditems";
	}
	
	@GetMapping("/fooditem/update/{id}/{item_availability}")
	public String updateFoodItem(@PathVariable int id, @PathVariable String item_availability, Model theModel) {
		FoodItem item = foodItemService.getFoodItem(id, item_availability);
		theModel.addAttribute("fooditem", item);
		return "new_food_item";
	}
	
	@GetMapping("/fooditem/view/{id}/{item_availability}")
	public String viewFoodItem(@PathVariable int id, @PathVariable String item_availability, Model theModel) {
		FoodItem item = foodItemService.getFoodItem(id, item_availability);
		theModel.addAttribute("fooditemname", item.getName());
		theModel.addAttribute("fooditemdesc", item.getDesc());
		theModel.addAttribute("fooditemimg", item.getImglink());
		theModel.addAttribute("fooditemprice", item.getPrice());
		theModel.addAttribute("fooditemavailable", item.getAvailability());
		theModel.addAttribute("fooditemtype", itemTypeService.getItem(item.getItemTypeId1()));
		theModel.addAttribute("fooditemid", item.getId());
		User user = userService.getUser(item.getAdded_by_id());
		String username = user.getFirstName()+" "+user.getLastName();
		theModel.addAttribute("fooditemaddedby", username);
		theModel.addAttribute("fooditemaddedat", item.getAdded_at());
		return "fooditem";
	}
	
	@GetMapping("/fooditem/delete/{id}/{item_availability}")
	public String deleteFoodItem(@PathVariable int id, @PathVariable String item_availability) {
		foodItemService.deleteFoodItem(id, item_availability);
		return "redirect:/fooditems";
	}
	
}
