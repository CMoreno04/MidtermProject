package com.skilldistillery.upstream.entities;

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

	@Column(name = "username")
	private String username;

	@Column(name = "password")
	private String password;

	@Column(name = "first_name")
	private String firstName;

	@Column(name = "last_name")
	private String lastName;

	@Column(name = "admin")
	private boolean admin;

	@Column(name = "active")
	private boolean active;

	@Column(name = "image_id ")
	private Integer imageId;

	@Column(name = "content_id")
	private Integer contentId;

	@Column(name = "serv_total")
	private Integer servTotal;

//	@ManyToMany
//	@JoinTable(name="user_content",
//		joinColumns=@JoinColumn(name="user_id"),
//		inverseJoinColumns=@JoinColumn(name="content_id")
//	)
//	private List <Content> contents;

	// C O N S T R U C T O R S
	
	public User() {
		super();
	}

	public User(int id, String username, String password, String firstName, String lastName, boolean admin,
			boolean active, Integer imageId, Integer contentId, Integer servTotal) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.firstName = firstName;
		this.lastName = lastName;
		this.admin = admin;
		this.active = active;
		this.imageId = imageId;
		this.contentId = contentId;
		this.servTotal = servTotal;
	}

	// G E T T E R S A N D S E T T E R S
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public Integer getImageId() {
		return imageId;
	}

	public void setImageId(Integer imageId) {
		this.imageId = imageId;
	}

	public Integer getContentId() {
		return contentId;
	}

	public void setContentId(Integer contentId) {
		this.contentId = contentId;
	}

	public Integer getServTotal() {
		return servTotal;
	}

	public void setServTotal(Integer servTotal) {
		this.servTotal = servTotal;
	}

	// T O S T R I N G
	
	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", firstName=" + firstName
				+ ", lastName=" + lastName + ", admin=" + admin + ", active=" + active + ", imageId=" + imageId
				+ ", contentId=" + contentId + ", servTotal=" + servTotal + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (active ? 1231 : 1237);
		result = prime * result + (admin ? 1231 : 1237);
		result = prime * result + ((contentId == null) ? 0 : contentId.hashCode());
		result = prime * result + ((firstName == null) ? 0 : firstName.hashCode());
		result = prime * result + id;
		result = prime * result + ((imageId == null) ? 0 : imageId.hashCode());
		result = prime * result + ((lastName == null) ? 0 : lastName.hashCode());
		result = prime * result + ((password == null) ? 0 : password.hashCode());
		result = prime * result + ((servTotal == null) ? 0 : servTotal.hashCode());
		result = prime * result + ((username == null) ? 0 : username.hashCode());
		return result;
	}

	// H A S H A N D E Q U A L S
	
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		User other = (User) obj;
		if (active != other.active)
			return false;
		if (admin != other.admin)
			return false;
		if (contentId == null) {
			if (other.contentId != null)
				return false;
		} else if (!contentId.equals(other.contentId))
			return false;
		if (firstName == null) {
			if (other.firstName != null)
				return false;
		} else if (!firstName.equals(other.firstName))
			return false;
		if (id != other.id)
			return false;
		if (imageId == null) {
			if (other.imageId != null)
				return false;
		} else if (!imageId.equals(other.imageId))
			return false;
		if (lastName == null) {
			if (other.lastName != null)
				return false;
		} else if (!lastName.equals(other.lastName))
			return false;
		if (password == null) {
			if (other.password != null)
				return false;
		} else if (!password.equals(other.password))
			return false;
		if (servTotal == null) {
			if (other.servTotal != null)
				return false;
		} else if (!servTotal.equals(other.servTotal))
			return false;
		if (username == null) {
			if (other.username != null)
				return false;
		} else if (!username.equals(other.username))
			return false;
		return true;
	}

	

	
}
