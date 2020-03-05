package com.foodOrderingSystem.dao;

import java.util.List;

import org.hibernate.*;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.foodOrderingSystem.entity.*;

@Repository
public class UserDAOImpl implements UserDAO{
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<User> getUsers() {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<User> theQuery = currentSession.createQuery("from users", User.class);
		List<User> theUsers = theQuery.getResultList();
		return theUsers;
	}
	
	@Override
	public void saveUser(User theUser) {
		Session currentSession = sessionFactory.getCurrentSession();
		currentSession.save(theUser);
	}
	
	@Override
	public User getUserId(String userName) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<User> theUser = currentSession.createQuery("from User where userName=:uName", User.class);
		theUser.setParameter("uName", userName);
		User user_ret = null;
		user_ret = theUser.getSingleResult();
		return user_ret;
	}
	
	@Override
	public User getUser(int theId) {
		Session currentSession = sessionFactory.getCurrentSession();
		Query<User> theUser = currentSession.createQuery("from User where id=:theid", User.class);
		theUser.setParameter("theid", theId);
		User get_user = null;
		get_user = theUser.getSingleResult();
		return get_user;
	}
	
	@Override
	public User findByUserName(String theUserName) {
		// get the current hibernate session
		Session currentSession = sessionFactory.getCurrentSession();
		// now retrieve/read from database using username
		Query<User> theQuery = currentSession.createQuery("from User where userName=:uName", User.class);
		theQuery.setParameter("uName", theUserName);
		User theUser = null;
		try {
			theUser = theQuery.getSingleResult();
		} catch (Exception e) {
			theUser = null;
		}
		return theUser;
	}

}
