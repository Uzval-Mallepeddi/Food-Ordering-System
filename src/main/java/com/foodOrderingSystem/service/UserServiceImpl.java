package com.foodOrderingSystem.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.query.Query;
import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.BeanDefinitionDsl.Role;
import org.springframework.security.config.core.GrantedAuthorityDefaults;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.foodOrderingSystem.dao.UserDAO;
import com.foodOrderingSystem.entity.User;

@Service
public class UserServiceImpl implements UserService {
	private Logger logger = Logger.getLogger(getClass().getName());
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Override
	@Transactional
	public void save(User theUser) {
		User user = new User();
		user.setFirstName(theUser.getFirstName());
		user.setLastName(theUser.getLastName());
		user.setUserName(theUser.getUserName());
		user.setRole(theUser.getRole());
		user.setPassword(passwordEncoder.encode(theUser.getPassword()));
		userDAO.saveUser(user);
	}
	
	@Override
	@Transactional
	public User getUser(int theId) {
		return userDAO.getUser(theId);
	}

	@Override
	@Transactional
	public User findByUserName(String userName) {
		// check the database if the user already exists
		return userDAO.findByUserName(userName);
	}
	
	@Override
	@Transactional
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
		User user = userDAO.findByUserName(userName);
		if (user == null) {
			throw new UsernameNotFoundException("Invalid username or password.");
		}
		else {
			return new CustomUserDetails(user.getUserName(), user.getPassword(), user.getRole());
		}
	}
	
	public class CustomUserDetails implements UserDetails {
		
		private String username;
        private String password;
        private Collection<? extends GrantedAuthority> authorities;

        public CustomUserDetails() {
            super();
        }

        public CustomUserDetails(String username, String password, String role) {
            this.username = username;
            this.password = password;
            ArrayList<GrantedAuthority> grantedAuthorities = new ArrayList<>();
            grantedAuthorities.add(new SimpleGrantedAuthority(role));
            this.authorities = grantedAuthorities;
        }
		@Override
		public Collection<? extends GrantedAuthority> getAuthorities() {
			// TODO Auto-generated method stub
			return authorities;
		}

		@Override
		public String getPassword() {
			// TODO Auto-generated method stub
			return this.password;
		}

		@Override
		public String getUsername() {
			// TODO Auto-generated method stub
			return this.username;
		}

		@Override
		public boolean isAccountNonExpired() {
			// TODO Auto-generated method stub
			return true;
		}

		@Override
		public boolean isAccountNonLocked() {
			// TODO Auto-generated method stub
			return true;
		}

		@Override
		public boolean isCredentialsNonExpired() {
			// TODO Auto-generated method stub
			return true;
		}

		@Override
		public boolean isEnabled() {
			// TODO Auto-generated method stub
			return true;
		}
		
	}
}
