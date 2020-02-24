package com.foodOrderingSystem.service;

import java.util.List;

import com.foodOrderingSystem.entity.*;

public interface UserService {
	public List<User> getUsers();

	public void signupUser(User theUser);
	
}
