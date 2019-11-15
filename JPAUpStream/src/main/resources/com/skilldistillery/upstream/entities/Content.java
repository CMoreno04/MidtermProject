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

@Entity
public class Content {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column
	private String title;
	
	@Column
	private String description;
	
	@Column
	private List<Genre> genre;
	
	@Column(name="review_id")
	private int reviewId;
	
	@Column(name="service_id")
	private int serviceId;
	
	@Column(name="image_link")
	private String imageLink;
	
	@ManyToMany
	@JoinTable(name="service_content",
		joinColumns=@JoinColumn(name="service_id"),
		inverseJoinColumns=@JoinColumn(name="content_id")
	)
	private List<Service> services;

	public Content(int id, String title, String description, String genre, int reviewId, int serviceId,
			String imageLink) {
		super();
		this.id = id;
		this.title = title;
		this.description = description;
		this.genre = genre;
		this.reviewId = reviewId;
		this.serviceId = serviceId;
		this.imageLink = imageLink;
	}

	public Content() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String name) {
		this.title = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public int getReviewId() {
		return reviewId;
	}

	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}

	public int getServiceId() {
		return serviceId;
	}

	public void setServiceId(int serviceId) {
		this.serviceId = serviceId;
	}

	public String getImageLink() {
		return imageLink;
	}

	public void setImageLink(String imageLink) {
		this.imageLink = imageLink;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((description == null) ? 0 : description.hashCode());
		result = prime * result + ((genre == null) ? 0 : genre.hashCode());
		result = prime * result + id;
		result = prime * result + ((imageLink == null) ? 0 : imageLink.hashCode());
		result = prime * result + ((title == null) ? 0 : title.hashCode());
		result = prime * result + reviewId;
		result = prime * result + serviceId;
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
		Content other = (Content) obj;
		if (description == null) {
			if (other.description != null)
				return false;
		} else if (!description.equals(other.description))
			return false;
		if (genre == null) {
			if (other.genre != null)
				return false;
		} else if (!genre.equals(other.genre))
			return false;
		if (id != other.id)
			return false;
		if (imageLink == null) {
			if (other.imageLink != null)
				return false;
		} else if (!imageLink.equals(other.imageLink))
			return false;
		if (title == null) {
			if (other.title != null)
				return false;
		} else if (!title.equals(other.title))
			return false;
		if (reviewId != other.reviewId)
			return false;
		if (serviceId != other.serviceId)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Content [id=" + id + ", title=" + title + ", description=" + description + ", genre=" + genre
				+ ", reviewId=" + reviewId + ", serviceId=" + serviceId + ", imageLink=" + imageLink + "]";
	}
	
}
