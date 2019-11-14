package com.skilldistillery.upstream.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class RatingReview {
	// F I E L D S
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "user_id")
	private int userId;
	
	private String comment;
	
	private int rating;
	
	@Column(name = "content_id")
	private int contentId;

	
	// C O N S T R U C T O R S
	public RatingReview() {}
	
	public RatingReview(int id, int userId, String comment, int rating, int contentId) {
		super();
		this.id = id;
		this.userId = userId;
		this.comment = comment;
		this.rating = rating;
		this.contentId = contentId;
	}

	public int getId() {
		return id;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public int getContentId() {
		return contentId;
	}

	public void setContentId(int contentId) {
		this.contentId = contentId;
	}

	
	// T O   S T R I N G
	@Override
	public String toString() {
		return "RatingReview [id=" + id + ", userId=" + userId + ", comment=" + comment + ", rating=" + rating
				+ ", contentId=" + contentId + "]";
	}
	
	// H A S H   A N D   E Q U A L S
}
