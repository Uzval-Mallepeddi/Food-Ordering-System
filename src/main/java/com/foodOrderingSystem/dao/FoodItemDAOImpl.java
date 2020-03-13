package com.foodOrderingSystem.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.foodOrderingSystem.entity.FoodItem;
import com.foodOrderingSystem.entity.ItemType;
import com.foodOrderingSystem.entity.User;

@Repository
public class FoodItemDAOImpl implements FoodItemDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void saveFoodItem(FoodItem type) {
		Session currentSession = sessionFactory.getCurrentSession();
		String[] availability = type.getAvailability().toString().split(",");
		for(String available: availability) {
			type.setName(type.getName());
			type.setDesc(type.getDesc());
			type.setImglink(type.getImglink());
			type.setPrice(type.getPrice());
			type.setAvailability(available);
			type.setAdded_by_id(type.getAdded_by_id());
			type.setItemTypeId1(type.getItemTypeId1());
			java.util.Date dt = new java.util.Date();
			java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String dateTimeStamp = sdf.format(dt);
			type.setAdded_at(dateTimeStamp);
			currentSession.saveOrUpdate(type);
		}
	}

	@Override
	public List<FoodItem> getAll() {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<FoodItem> theQuery = currentSession.createQuery("from food_item", FoodItem.class);
		List<FoodItem> allFoodItems = theQuery.getResultList();
		return allFoodItems;
	}

	@Override
	public FoodItem getFoodItem(int theId) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<FoodItem> theFoodItem = currentSession.createQuery("from food_item where id=:theid", FoodItem.class);
		theFoodItem.setParameter("theid", theId);
		FoodItem food_item = null;
		food_item = theFoodItem.getSingleResult();
		return food_item;
	}

	@Override
	public void delete(int id) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query theQuery = currentSession.createQuery("delete from food_item where id=:theId");
		theQuery.setParameter("theId", id);
		theQuery.executeUpdate();
	}

}
