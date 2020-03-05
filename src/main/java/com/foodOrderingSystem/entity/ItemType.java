package com.foodOrderingSystem.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity(name="item_type")
@Table(name="item_type")
public class ItemType {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Column(name="type")
	private String type;
	
	@Column(name="description")
	private String description;
	
	@OneToMany(mappedBy="itemTypeId")
	private List<FoodItem> foodItem;
	
	public List<FoodItem> getFoodItem() {
		return foodItem;
	}

	public void setFoodItem(List<FoodItem> foodItem) {
		this.foodItem = foodItem;
	}

	public int getId() {
		return id;
	}

	@Override
	public String toString() {
		return "ItemType [id=" + id + ", type=" + type + ", description=" + description + "]";
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
