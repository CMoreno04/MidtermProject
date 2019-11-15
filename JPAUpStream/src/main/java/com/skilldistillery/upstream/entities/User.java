package com.skilldistillery.upstream.entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Transient;

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
	
	@Transient
	@Column(name = "image_id")
	private String imageId;
	

//	@Column(name = "content_id")
//	private List<Service> contentId;  // import when created
//	private List<Content> favorites;  // import when created
//	private List<Content> wishlist;  // import when created

//	@ManyToMany
//	@JoinTable(name="user_content",
//		joinColumns=@JoinColumn(name="user_id"),
//		inverseJoinColumns=@JoinColumn(name="content_id")
//	)
//	private List <Content> contents;
	
	// C O N S T R U C T O R S
	public User() {}

	public User(int id, boolean admin, boolean active, String username, String password, String firstName, String lastName,
		String imageId) {
	super();
	this.id = id;
	this.admin = admin;
	this.active = active;
	this.username = username;
	this.password = password;
	this.firstName = firstName;
	this.lastName = lastName;
	this.imageId = imageId;
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

//
//	public List<Service> getContentId() {
//		return contentId;
//	}
//
//	public void setContentId(List<Service> contentId) {
//		this.contentId = contentId;
//	}
//
//	// T O   S T R I N G
//	@Override
//	public String toString() {
//		return "User [id=" + id + ", admin=" + admin + ", active=" + active + ", username=" + username + ", password="
//				+ password + ", firstName=" + firstName + ", lastName=" + lastName + ", imageId=" + imageId
//				+ ", contentId=" + contentId + "]";
//	}

	
	// H A S H   A N D   E Q U A L S
}
