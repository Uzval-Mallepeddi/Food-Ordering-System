package com.foodOrderingSystem.entity;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

@Entity(name="food_item")
@Table(name="food_item")
@JsonIgnoreProperties(ignoreUnknown = true)
public class FoodItem {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Column(name="name")
	private String name;
	
	@Column(name="description")
	private String desc;
	
	@Column(name="img_link")
	private String imglink;
	
	@Column(name="price")
	private double price;
	
	@Column(name="item_availability")
	private String availability;
	
	@Column(name="added_at")
	private String added_at;
	
	@Column(name="item_type_id", insertable=true, updatable=true)
	private int itemTypeId1;
	
	@Column(name="added_by", insertable=true, updatable=true)
	private int added_by_id;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="item_type_id", insertable=false, updatable=false)	
	private ItemType itemTypeId;

	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="added_by", insertable=false, updatable=false)
	private User userId;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	public int getItemTypeId1() {
		return itemTypeId1;
	}

	public void setItemTypeId1(int itemTypeId1) {
		this.itemTypeId1 = itemTypeId1;
	}
	
	public int getAdded_by_id() {
		return added_by_id;
	}

	public void setAdded_by_id(int added_by_id) {
		this.added_by_id = added_by_id;
	}


	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}

	public String getImglink() {
		return imglink;
	}

	public void setImglink(String imglink) {
		this.imglink = imglink;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getAvailability() {
		return availability;
	}

	public void setAvailability(String availability) {
		this.availability = availability;
	}

	public String getAdded_at() {
		return added_at;
	}

	public void setAdded_at(String added_at) {
		this.added_at = added_at;
	}

	public ItemType getItemTypeId() {
		return itemTypeId;
	}

	public void setItemTypeId(ItemType itemTypeId) {
		this.itemTypeId = itemTypeId;
	}

	public User getUserId() {
		return userId;
	}

	public void setUserId(User userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "FoodItem [id=" + id + ", name=" + name + ", desc=" + desc + ", imglink=" + imglink + ", price=" + price
				+ ", availability=" + availability + ", added_at=" + added_at + ", itemTypeId1=" + itemTypeId1
				+ ", added_by_id=" + added_by_id + "]";
	}
}
