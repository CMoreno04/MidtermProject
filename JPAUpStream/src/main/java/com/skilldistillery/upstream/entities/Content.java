package com.skilldistillery.upstream.entities;


import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;


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

	@ManyToOne
	@JoinColumn(name = "image_id")
	private Media image;

	@ManyToOne
	@JoinColumn(name = "video_id")
	private Media video;

	@ManyToMany(cascade = { CascadeType.PERSIST, CascadeType.REMOVE })
	@JoinTable(name = "content_genre", joinColumns = @JoinColumn(name = "content_id"), inverseJoinColumns = @JoinColumn(name = "genre_id"))
	private List<Genre> genres;

	@ManyToOne
	@JoinColumn(name = "service_id")
	private StreamService service;

	@ManyToMany(mappedBy = "content",cascade = { CascadeType.PERSIST, CascadeType.REMOVE })
	private List<RatingReview> ratingReviews;
	
	@ManyToMany(mappedBy = "userContent",cascade = { CascadeType.PERSIST, CascadeType.REMOVE })
	private List<UserContent> userContent;

	
	// C O N S T R U C T O R S

	public Content() {
		super();
	}


	public Content(String title, String description, Media image, Media video, List<Genre> genres, StreamService streamService,
			List<RatingReview> ratingReviews, List<UserContent> userContent) {
		super();
		this.title = title;
		this.description = description;
		this.image = image;
		this.video = video;
		this.genres = genres;
		this.service = streamService;
		this.ratingReviews = ratingReviews;
		this.userContent = userContent;
	}


	// G E T T E R S A N D S E T T E R S

	public StreamService getService() {
		return service;
	}

	public void setService(StreamService streamService) {
		this.service = streamService;
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

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public List<Genre> getGenres() {
		return genres;
	}

	public void setGenres(List<Genre> genres) {
		this.genres = genres;
	}

	public Media getImage() {
		return image;
	}

	public void setImage(Media image) {
		this.image = image;
	}

	public Media getVideo() {
		return video;
	}

	public void setVideo(Media video) {
		this.video = video;
	}


	public List<RatingReview> getRatingReviews() {
		return ratingReviews;
	}

	public void setRatingReviews(List<RatingReview> ratingReviews) {
		this.ratingReviews = ratingReviews;
	}
	
	

	public List<UserContent> getUserContent() {
		return userContent;
	}


	public void setUserContent(List<UserContent> userContent) {
		this.userContent = userContent;
	}

	// T O  S T R I N G

	@Override
	public String toString() {
		return "Content [id=" + id + ", title=" + title + ", description=" + description + ", image=" + image
				+ ", video=" + video + ", genres=" + genres + ", service=" + service + ", ratingReviews="
				+ ratingReviews + "]";
	}
	
	// H A S H  A N D  E Q U A L S

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((description == null) ? 0 : description.hashCode());
		result = prime * result + ((genres == null) ? 0 : genres.hashCode());
		result = prime * result + id;
		result = prime * result + ((image == null) ? 0 : image.hashCode());
		result = prime * result + ((ratingReviews == null) ? 0 : ratingReviews.hashCode());
		result = prime * result + ((service == null) ? 0 : service.hashCode());
		result = prime * result + ((title == null) ? 0 : title.hashCode());
		result = prime * result + ((userContent == null) ? 0 : userContent.hashCode());
		result = prime * result + ((video == null) ? 0 : video.hashCode());
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
		if (genres == null) {
			if (other.genres != null)
				return false;
		} else if (!genres.equals(other.genres))
			return false;
		if (id != other.id)
			return false;
		if (image == null) {
			if (other.image != null)
				return false;
		} else if (!image.equals(other.image))
			return false;
		if (ratingReviews == null) {
			if (other.ratingReviews != null)
				return false;
		} else if (!ratingReviews.equals(other.ratingReviews))
			return false;
		if (service == null) {
			if (other.service != null)
				return false;
		} else if (!service.equals(other.service))
			return false;
		if (title == null) {
			if (other.title != null)
				return false;
		} else if (!title.equals(other.title))
			return false;
		if (userContent == null) {
			if (other.userContent != null)
				return false;
		} else if (!userContent.equals(other.userContent))
			return false;
		if (video == null) {
			if (other.video != null)
				return false;
		} else if (!video.equals(other.video))
			return false;
		return true;
	}
}