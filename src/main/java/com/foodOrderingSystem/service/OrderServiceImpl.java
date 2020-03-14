package com.foodOrderingSystem.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.foodOrderingSystem.dao.OrderDAO;
import com.foodOrderingSystem.entity.Order;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDAO orderDao;
	
	@Override
	@Transactional
	public void save(Order order) {		
		orderDao.saveOrder(order);
	}

	@Override
	@Transactional
	public List<Order> getAllOrders(int theId) {
		// TODO Auto-generated method stub
		return null;
	}

}
