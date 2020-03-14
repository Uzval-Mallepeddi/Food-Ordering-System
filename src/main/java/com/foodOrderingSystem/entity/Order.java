package com.foodOrderingSystem.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity(name="orders")
@Table(name="orders")
public class Order {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Column(name="order_by", insertable=true, updatable=true)
	private int orderBy;
	
	@Column(name="order_at")
	private String orderAt;
	
	@Column(name="order_status")
	private String orderStatus;
	
	@Column(name="total_amount")
	private double totalAmount;
	
	@Column(name="amount_paid")
	private double amountPaid;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="order_by", insertable=false, updatable=false)
	private User userId;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getOrderBy() {
		return orderBy;
	}

	public void setOrderBy(int orderBy) {
		this.orderBy = orderBy;
	}

	public String getOrderAt() {
		return orderAt;
	}

	public void setOrderAt(String orderAt) {
		this.orderAt = orderAt;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public double getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(double totalAmount) {
		this.totalAmount = totalAmount;
	}

	public double getAmountPaid() {
		return amountPaid;
	}

	public void setAmountPaid(double amountPaid) {
		this.amountPaid = amountPaid;
	}

	@Override
	public String toString() {
		return "Order [id=" + id + ", orderBy=" + orderBy + ", orderAt=" + orderAt + ", orderStatus=" + orderStatus
				+ ", totalAmount=" + totalAmount + ", amountPaid=" + amountPaid + "]";
	}
	
}
