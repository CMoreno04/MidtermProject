package com.skilldistillery.upstream.entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class User {
	// F I E L D S
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private boolean admin;
	private boolean active;
	private String username;
	private String password;
	@Column(name = "first_name")
	private String firstName;
	@Column(name = "last_name")
	private String lastName;
	@Column(name = "image_id")
	private String imageId;
	@Column(name = "service_id")
	private List<Service> serviceId;  // import when created
	@Column(name = "serv_total")
	private int serviceTotal;
	private List<Content> favorites;  // import when created
	private List<Content> wishlist;  // import when created

	
	// C O N S T R U C T O R S
	public User() {}

	public User(int id, boolean admin, boolean active, String username, String password, String firstName,
			String lastName, String imageId, List<Service> serviceId, int serviceTotal, List<Content> favorites,
			List<Content> wishlist) {
		super();
		this.id = id;
		this.admin = admin;
		this.active = active;
		this.username = username;
		this.password = password;
		this.firstName = firstName;
		this.lastName = lastName;
		this.imageId = imageId;
		this.serviceId = serviceId;
		this.serviceTotal = serviceTotal;
		this.favorites = favorites;
		this.wishlist = wishlist;
	}

	// G E T T E R S   A N D   S E T T E R S
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public boolean isAdmin() {
		return admin;
	}

	public void setAdmin(boolean admin) {
		this.admin = admin;
	}

	public boolean isActive() {
		return active;
	}


	public void setActive(boolean active) {
		this.active = active;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
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


	public String getImageId() {
		return imageId;
	}


	public void setImageId(String imageId) {
		this.imageId = imageId;
	}


	public List<Service> getServiceId() {
		return serviceId;
	}


	public void setServiceId(List<Service> serviceId) {
		this.serviceId = serviceId;
	}


	public int getServiceTotal() {
		return serviceTotal;
	}


	public void setServiceTotal(int serviceTotal) {
		this.serviceTotal = serviceTotal;
	}


	public List<Content> getFavorites() {
		return favorites;
	}


	public void setFavorites(List<Content> favorites) {
		this.favorites = favorites;
	}


	public List<Content> getWishlist() {
		return wishlist;
	}


	public void setWishlist(List<Content> wishlist) {
		this.wishlist = wishlist;
	}

	// T O   S T R I N G
	@Override
	public String toString() {
		return "User [id=" + id + ", admin=" + admin + ", active=" + active + ", username=" + username + ", password="
				+ password + ", firstName=" + firstName + ", lastName=" + lastName + ", imageId=" + imageId
				+ ", serviceTotal=" + serviceTotal + "]";
	}

	// H A S H   A N D   E Q U A L S
}
