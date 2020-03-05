package com.foodOrderingSystem.entity;

import java.util.Collection;
import java.util.List;

import javax.persistence.*;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.security.core.GrantedAuthority;

@Entity
@Table(name="users")
public class User {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@NotEmpty
	@Column(name="first_name")
	private String firstName;
	
	@NotEmpty
	@Column(name="last_name")
	private String lastName;
	
    @NotEmpty
	@Column(name="username", nullable = false, unique = true)
	private String userName;
	
    @NotEmpty
	@Column(name="password")
	private String password;
    
    @NotEmpty
    @Column(name="role")
    private String role;
    
    @OneToMany(mappedBy="userId")
    private List<FoodItem> foodItem;
    
	public List<FoodItem> getFoodItem() {
		return foodItem;
	}

	public void setFoodItem(List<FoodItem> foodItem) {
		this.foodItem = foodItem;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public User(String userName, String password, String firstName, String lastName, String role) {
		this.userName = userName;
		this.password = password;
		this.firstName = firstName;
		this.lastName = lastName;
		this.role = role;
	}
	
	public User() {
		
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", userName=" + userName
				+ ", password=" + password + ", role=" + role + "]";
	}
}
