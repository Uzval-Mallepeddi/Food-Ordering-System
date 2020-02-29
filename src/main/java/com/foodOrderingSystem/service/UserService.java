package com.foodOrderingSystem.service;

import java.util.List;

import org.springframework.security.core.userdetails.UserDetailsService;

import com.foodOrderingSystem.entity.*;


public interface UserService extends UserDetailsService{

    User findByUserName(String userName);
    void save(User user);
	
}
