package com.foodOrderingSystem.dao;
import java.util.List;

import org.hibernate.query.Query;

import com.foodOrderingSystem.entity.User;

public interface UserDAO {
	public List<User> getUsers();
	public void saveUser(User theUser);
	public User findByUserName(String userName);
	public User getUserId(String userName);
	public User getUser(int theId);
}
