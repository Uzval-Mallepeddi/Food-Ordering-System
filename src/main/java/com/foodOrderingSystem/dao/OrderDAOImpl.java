package com.foodOrderingSystem.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.foodOrderingSystem.entity.Order;

@Repository
public class OrderDAOImpl implements OrderDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void saveOrder(Order order) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.save(order);
	}

}
