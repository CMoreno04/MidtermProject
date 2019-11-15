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
	// F I E L D S

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column
	private String title;
	
	@Column
	private String description;
	
//	@Column
//	private List<Genre> genre;
	
	@Column(name="review_id")
	private int reviewId;
	
	@Column(name="service_id")
	private int serviceId;
	
	@Column(name="image_id")
	private int imageId;
	
	@Column(name="video_id")
	private int videoId;
	
//	@ManyToMany
//	@JoinTable(name="service_content",
//		joinColumns=@JoinColumn(name="service_id"),
//		inverseJoinColumns=@JoinColumn(name="content_id")
//	)
	private List<Service> services;
	
	@ManyToMany(mappedBy="contents")
	private List<User> users;
	
//	@ManyToMany
//	@JoinTable(name="content_genre",
//		joinColumns=@JoinColumn(name="content_id"),
//		inverseJoinColumns=@JoinColumn(name="id")
//	)
	private List<Genre> genres;
	
	@ManyToMany
	@JoinTable(name="rating_review",
		joinColumns=@JoinColumn(name="content_id"),
		inverseJoinColumns=@JoinColumn(name="user_id")
	)
	private List<RatingReview> reviews;
	
//	private List<Service> services;
//	
//	private List<User> users;

 
	// C O N S T R U C T O R S
	

	public Content() {
		super();
	}

	// G E T T E R S   A N D   S E T T E R S
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

//	public List<Genre> getGenre() {
//		return genre;
//	}
//
//	public void setGenre(List<Genre> genre) {
//		this.genre = genre;
//	}

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

	

	


	// H A S H   A N D   E Q A L S


	

	// T O  S T R I N G
	

	
}
