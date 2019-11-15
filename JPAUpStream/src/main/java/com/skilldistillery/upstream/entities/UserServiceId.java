package com.skilldistillery.upstream.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class UserServiceId implements Serializable {
	private static final long serialVersionUID = 1L;
	

	@Column(name="service_id")
	private int serviceId;
	@Column(name="user_id")
	private int userId;
	
	public UserServiceId() {
		super();
	}

	public UserServiceId(int serviceId, int userId) {
		super();
		this.serviceId = serviceId;
		this.userId = userId;
	}

	public int getServiceId() {
		return serviceId;
	}

	public void setServiceId(int serviceId) {
		this.serviceId = serviceId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + serviceId;
		result = prime * result + userId;
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
		UserServiceId other = (UserServiceId) obj;
		if (serviceId != other.serviceId)
			return false;
		if (userId != other.userId)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "UserServiceId [serviceId=" + serviceId + ", userId=" + userId + "]";
	}
	
	

	
	
}
