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
	public String login(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("user") == null)
		{
			session.setAttribute("role", null);
			session.setAttribute("loggedin", false);
			return "login";
		}
		else
		{
			session.setAttribute("loggedin", true);
			return "index";
		}
	}
	
	@GetMapping("/signup")
	public String signup(Model theModel, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("user") == null) {
			session.setAttribute("error", null);
			User user = new User();
			theModel.addAttribute("user", user);
			return "signup";
		}
		else if(session.getAttribute("user") != null && session.getAttribute("role").equals("ADMIN")) {
			session.setAttribute("error", null);
			User user = new User();
			theModel.addAttribute("user", user);
			return "signup";
		}
		
		else {
			session.setAttribute("error", "loggedin");
			return "index";
		}
	}
	
	@PostMapping("/save")
	public String signUpUser(@Valid @ModelAttribute("user") User theUser, BindingResult theBindingResult, 
			Model theModel, HttpServletRequest request) {
		//userService.signupUser(theUser);
		HttpSession session = request.getSession();
		System.out.println(theUser);
		if (theBindingResult.hasErrors()){
			System.out.println(">>>>>"+theBindingResult.getAllErrors());
			 return "signup";
	    }
		else {
			userService.save(theUser);
			return "redirect:/home";
		}
	}
}
