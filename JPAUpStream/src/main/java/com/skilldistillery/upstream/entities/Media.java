package com.skilldistillery.upstream.entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Media {
	// Fields
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column
	private String url;
	
	@OneToMany(mappedBy="image")
	private List<Content> contenImages;
	
	@OneToMany(mappedBy="video")
	private List<Content> contenVideos;
	
	
	

	// Getters and Setters
	
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

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((contenImages == null) ? 0 : contenImages.hashCode());
		result = prime * result + ((contenVideos == null) ? 0 : contenVideos.hashCode());
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
		Media other = (Media) obj;
		if (contenImages == null) {
			if (other.contenImages != null)
				return false;
		} else if (!contenImages.equals(other.contenImages))
			return false;
		if (contenVideos == null) {
			if (other.contenVideos != null)
				return false;
		} else if (!contenVideos.equals(other.contenVideos))
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
