package com.foodOrderingSystem.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name="list_orders")
@Table(name="list_orders")
public class ListOrder {
	
	@Id
	@Column(name="order_id")
	private int orderId;
	
	@Column(name="item_id")
	private int itemId;
	
	@Column(name="quantity")
	private int quantity;

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getItemId() {
		return itemId;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	@Override
	public String toString() {
		return "ListOrders [orderId=" + orderId + ", itemId=" + itemId + ", quantity=" + quantity + "]";
	}
	
}
