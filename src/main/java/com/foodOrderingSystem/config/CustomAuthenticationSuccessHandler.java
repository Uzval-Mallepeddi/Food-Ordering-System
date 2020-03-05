package com.foodOrderingSystem.config;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.foodOrderingSystem.entity.User;
import com.foodOrderingSystem.service.UserService;

@Component
public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

    @Autowired
    private UserService userService;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException, ServletException {

		System.out.println("\n\nIn customAuthenticationSuccessHandler\n\n");

		String userName = authentication.getName();
		
		//System.out.println("userName=" + userName);

		User theUser = userService.findByUserName(userName);
		
		// now place in the session
		HttpSession session = request.getSession();
		session.setAttribute("user", theUser);
		// forward to home page
		
		User user = (User) session.getAttribute("user");
		//System.out.println(user);
		// get all info about logged-in user
		session.setAttribute("id", user.getId());
		session.setAttribute("name", user.getFirstName()+" "+user.getLastName());
		session.setAttribute("role", user.getRole().toString());
		session.setAttribute("username", user.getUserName());
		response.sendRedirect(request.getContextPath() + "/");
	}

}
