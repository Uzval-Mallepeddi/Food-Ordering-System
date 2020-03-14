package com.foodOrderingSystem.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.foodOrderingSystem.dao.ListOrderDAO;
import com.foodOrderingSystem.entity.ListOrder;

@Service
public class ListOrderServiceImpl implements ListOrderService {
	
	@Autowired
	private ListOrderDAO listOrderDao;
	
	@Override
	@Transactional
	public void save(ListOrder listOrder) {
		listOrderDao.saveListOrder(listOrder);
	}

}
