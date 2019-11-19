package com.skilldistillery.upstream.entities;

import java.time.LocalDate;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "user_service")
public class UserService {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	
	@Column(name = "subscribe_date")
	private LocalDate subscribeDate;
	
	@Column(name = "current_subscrib")
	private boolean currentSubscrib;
	
	@ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.REMOVE })
	@JoinColumn(name = "user_id") // DB column name
//	@MapsId(value = "userId")     // Field in ID class
	private User users;
	
	@ManyToOne(cascade = { CascadeType.PERSIST, CascadeType.REMOVE })
	@JoinColumn(name = "service_id") // DB column name
//	@MapsId(value = "serviceId")     // Field in ID class
	private StreamService service;

	
	
	public UserService() {
		super();
	}

	

	public UserService(LocalDate subscribeDate, boolean currentSubscrib, User user, StreamService service) {
		super();
		this.subscribeDate = subscribeDate;
		this.currentSubscrib = currentSubscrib;
		this.users = user;
		this.service = service;
	}



	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public LocalDate getSubscribeDate() {
		return subscribeDate;
	}

	public void setSubscribeDate(LocalDate subscribeDate) {
		this.subscribeDate = subscribeDate;
	}

	public boolean isCurrentSubscrib() {
		return currentSubscrib;
	}

	public void setCurrentSubscrib(boolean currentSubscrib) {
		this.currentSubscrib = currentSubscrib;
	}

	
	public StreamService getService() {
		return service;
	}

	public void setService(StreamService service) {
		this.service = service;
	}

	
	public User getUsers() {
		return users;
	}



	public void setUsers(User users) {
		this.users = users;
	}



	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (currentSubscrib ? 1231 : 1237);
		result = prime * result + id;
		result = prime * result + ((service == null) ? 0 : service.hashCode());
		result = prime * result + ((subscribeDate == null) ? 0 : subscribeDate.hashCode());
		result = prime * result + ((users == null) ? 0 : users.hashCode());
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
		UserService other = (UserService) obj;
		if (currentSubscrib != other.currentSubscrib)
			return false;
		if (id != other.id)
			return false;
		if (service == null) {
			if (other.service != null)
				return false;
		} else if (!service.equals(other.service))
			return false;
		if (subscribeDate == null) {
			if (other.subscribeDate != null)
				return false;
		} else if (!subscribeDate.equals(other.subscribeDate))
			return false;
		if (users == null) {
			if (other.users != null)
				return false;
		} else if (!users.equals(other.users))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "UserService [id=" + id + ", subscribeDate=" + subscribeDate + ", currentSubscrib=" + currentSubscrib
				+ "]";
	}

}
