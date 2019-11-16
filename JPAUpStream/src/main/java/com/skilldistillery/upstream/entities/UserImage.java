package com.skilldistillery.upstream.entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity(name = "user_image")
public class UserImage {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "url")
	private String url;

	@OneToMany(mappedBy="userImage")
	private List<User> contenImages;

	
	public UserImage() {
		super();
		// TODO Auto-generated constructor stub
	}

	public UserImage(String url, List<User> contenImages) {
		super();
		this.url = url;
		this.contenImages = contenImages;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public List<User> getContenImages() {
		return contenImages;
	}

	public void setContenImages(List<User> contenImages) {
		this.contenImages = contenImages;
	}

	@Override
	public String toString() {
		return "UserImage [id=" + id + ", url=" + url + ", contenImages=" + contenImages + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((contenImages == null) ? 0 : contenImages.hashCode());
		result = prime * result + id;
		result = prime * result + ((url == null) ? 0 : url.hashCode());
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
		UserImage other = (UserImage) obj;
		if (contenImages == null) {
			if (other.contenImages != null)
				return false;
		} else if (!contenImages.equals(other.contenImages))
			return false;
		if (id != other.id)
			return false;
		if (url == null) {
			if (other.url != null)
				return false;
		} else if (!url.equals(other.url))
			return false;
		return true;
	}
	
	
	

}
