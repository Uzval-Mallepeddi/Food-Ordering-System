package com.foodOrderingSystem.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.foodOrderingSystem.entity.User;
import com.foodOrderingSystem.service.UserService;

@Controller
public class AuthenticationController {
	
	@Autowired
    private UserService userService;
	
	@RequestMapping("/login")
	public String login() {
		return "login";
	}
	
	@GetMapping("/signup")
	public String signup(Model theModel, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("user") != null) {
			session.setAttribute("error", "loggedin");
			return "index";
		}
		else {
			User user = new User();
			theModel.addAttribute("user", user);
			return "signup";
		}
	}
	
	@PostMapping("/save")
	public String signUpUser(@Valid @ModelAttribute("user") User theUser, BindingResult theBindingResult, 
			Model theModel) {
		//userService.signupUser(theUser);
		if (theBindingResult.hasErrors()){
			 return "signup";
	        }
		else {
			userService.save(theUser);
			return "redirect:/home";
		}
	}
}
