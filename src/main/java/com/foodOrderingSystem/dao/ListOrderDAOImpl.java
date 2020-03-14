package com.foodOrderingSystem.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.foodOrderingSystem.entity.ListOrder;

@Repository
public class ListOrderDAOImpl implements ListOrderDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void saveListOrder(ListOrder listOrder) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.save(listOrder);
	}

}
