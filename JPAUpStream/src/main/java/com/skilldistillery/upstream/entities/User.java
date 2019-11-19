package com.skilldistillery.upstream.entities;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

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

	@ManyToOne
	@JoinColumn(name = "image_id")
	private UserImage userImage;

	@ManyToMany(mappedBy = "user")
	private List<UserContent> userCont;

	@OneToMany(mappedBy = "user", cascade = CascadeType.PERSIST, fetch = FetchType.EAGER)
	private List<UserService> userService;

	// C O N S T R U C T O R S

	public User() {
		super();
	}

	public User(boolean admin, boolean active, String username, String password, String firstName, String lastName,
			UserImage userImage) {
		super();
		this.admin = admin;
		this.active = active;
		this.username = username;
		this.password = password;
		this.firstName = firstName;
		this.lastName = lastName;
		this.userImage = userImage;
	}

	// G E T T E R S A N D S E T T E R S

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

	public UserImage getUserImage() {
		return userImage;
	}

	public void setUserImage(UserImage userImage) {
		this.userImage = userImage;
	}

	public List<UserContent> getUserCont() {
		return userCont;
	}

	public void setUserCont(List<UserContent> userCont) {
		this.userCont = userCont;
	}

	public List<UserService> getUserService() {
		return userService;
	}

	public void setUserService(List<UserService> userService) {
		this.userService = userService;
	}

	// T O S T R I N G

	@Override
	public String toString() {
		return "User [id=" + id + ", admin=" + admin + ", active=" + active + ", username=" + username + ", password="
				+ password + ", firstName=" + firstName + ", lastName=" + lastName + ", userImage=" + userImage + "]";
	}

	// H A S H A N D E Q U A L S

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (active ? 1231 : 1237);
		result = prime * result + (admin ? 1231 : 1237);
		result = prime * result + ((firstName == null) ? 0 : firstName.hashCode());
		result = prime * result + id;
		result = prime * result + ((lastName == null) ? 0 : lastName.hashCode());
		result = prime * result + ((password == null) ? 0 : password.hashCode());
		result = prime * result + ((userCont == null) ? 0 : userCont.hashCode());
		result = prime * result + ((userImage == null) ? 0 : userImage.hashCode());
		result = prime * result + ((userService == null) ? 0 : userService.hashCode());
		result = prime * result + ((username == null) ? 0 : username.hashCode());
		return result;
	}

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
		if (firstName == null) {
			if (other.firstName != null)
				return false;
		} else if (!firstName.equals(other.firstName))
			return false;
		if (id != other.id)
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
		if (userCont == null) {
			if (other.userCont != null)
				return false;
		} else if (!userCont.equals(other.userCont))
			return false;
		if (userImage == null) {
			if (other.userImage != null)
				return false;
		} else if (!userImage.equals(other.userImage))
			return false;
		if (userService == null) {
			if (other.userService != null)
				return false;
		} else if (!userService.equals(other.userService))
			return false;
		if (username == null) {
			if (other.username != null)
				return false;
		} else if (!username.equals(other.username))
			return false;
		return true;
	}

}