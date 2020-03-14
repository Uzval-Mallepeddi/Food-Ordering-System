package com.foodOrderingSystem.service;

import java.util.List;

import com.foodOrderingSystem.entity.Order;

public interface OrderService {
	public void save(Order order);
	public List<Order> getAllOrders(int theId);
}
