package com.foodOrderingSystem.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.foodOrderingSystem.entity.ItemType;
import com.foodOrderingSystem.entity.User;

@Repository
public class ItemTypeDAOImpl implements ItemTypeDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public void saveItemType(ItemType type) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.saveOrUpdate(type);
	}

	@Override
	public List<ItemType> getAll() {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<ItemType> theQuery = currentSession.createQuery("from item_type", ItemType.class);
		List<ItemType> allItemTypes = theQuery.getResultList();
		return allItemTypes;
	}

	@Override
	public ItemType getItem(int theId) {
		Session currentSession = sessionFactory.getCurrentSession();
		ItemType item_ret = currentSession.get(ItemType.class, theId);
		return item_ret;
	}

	@Override
	public void delete(int id) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query theQuery = currentSession.createQuery("delete from item_type where id=:theId");
		theQuery.setParameter("theId", id);
		int rec = theQuery.executeUpdate();
	}
}
