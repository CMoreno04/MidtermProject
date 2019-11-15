package com.skilldistillery.upstream.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

@Entity
@Table(name = "user_service")
public class UserService {

	@EmbeddedId
	private UserServiceId id;
	@Column(name = "subscribe_date")
	private Date subscribeDate;
	@Column(name = "current_subscrib")
	private boolean currentSubscrib;
	
	@ManyToOne
	@JoinColumn(name = "user_id") // DB column name
	@MapsId(value = "userId")     // Field in ID class
	private User user;
	
	@ManyToOne
	@JoinColumn(name = "service_id") // DB column name
	@MapsId(value = "serciveId")     // Field in ID class
	private Service service;

	
	
	public UserService() {
		super();
	}

	public UserService(UserServiceId id, Date subscribeDate, boolean currentSubscrib) {
		super();
		this.id = id;
		this.subscribeDate = subscribeDate;
		this.currentSubscrib = currentSubscrib;
	}

	public UserServiceId getId() {
		return id;
	}

	public void setId(UserServiceId id) {
		this.id = id;
	}

	public Date getSubscribeDate() {
		return subscribeDate;
	}

	public void setSubscribeDate(Date subscribeDate) {
		this.subscribeDate = subscribeDate;
	}

	public boolean isCurrentSubscrib() {
		return currentSubscrib;
	}

	public void setCurrentSubscrib(boolean currentSubscrib) {
		this.currentSubscrib = currentSubscrib;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (currentSubscrib ? 1231 : 1237);
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((subscribeDate == null) ? 0 : subscribeDate.hashCode());
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
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (subscribeDate == null) {
			if (other.subscribeDate != null)
				return false;
		} else if (!subscribeDate.equals(other.subscribeDate))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "UserService [id=" + id + ", subscribeDate=" + subscribeDate + ", currentSubscrib=" + currentSubscrib
				+ "]";
	}

}
