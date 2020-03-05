package com.foodOrderingSystem.service;

import java.util.List;

import org.springframework.security.core.userdetails.UserDetailsService;

import com.foodOrderingSystem.entity.*;


public interface UserService extends UserDetailsService{

    public User findByUserName(String userName);
    public void save(User user);
    public User getUser(int theId);
}
