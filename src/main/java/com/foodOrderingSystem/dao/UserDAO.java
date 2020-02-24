package com.foodOrderingSystem.dao;
import java.util.*;

import com.foodOrderingSystem.entity.*;


public interface UserDAO {
	public List<User> getUsers();
	public void saveUser(User theUser);
}
