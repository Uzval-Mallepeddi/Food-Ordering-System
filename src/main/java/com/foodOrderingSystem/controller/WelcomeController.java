package com.foodOrderingSystem.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.foodOrderingSystem.dao.*;
import com.foodOrderingSystem.entity.*;
import com.foodOrderingSystem.service.*;

@Controller
public class WelcomeController {
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="/welcome")
	public String welcome() {
		return "welcome";
	}
	
	@RequestMapping(value="/")
	public String index() {
		return "index";
	}
	
	@RequestMapping(value="/home")
	public String home() {
		return "index";
	}
	
	@RequestMapping("/login")
	public String login() {
		return "login";
	}
	
	@GetMapping("/signup")
	public String signup(Model theModel) {
		User user = new User();
		theModel.addAttribute("user", user);
		return "signup";
	}
	
	@PostMapping("/save")
	public String signUpUser(@ModelAttribute("user") User theUser) {
		userService.signupUser(theUser);
		return "redirect:/home";
	}
	
	@RequestMapping("/list")
	public String getUsers(Model theModel) {
		List<User> allUsers = userService.getUsers();
		theModel.addAttribute("users", allUsers);
		return "welcome";
	}
	
}
