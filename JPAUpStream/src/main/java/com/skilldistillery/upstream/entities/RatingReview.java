package com.skilldistillery.upstream.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "rating_review")
public class RatingReview {
	
	// F I E L D S
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column
	private String comment;
	
	@Column(name="rating")
	private Integer rating;
	
	@Column(name = "user_id")
	private int userId;
	
	@ManyToOne
	@JoinColumn(name = "content_id")
	private Content content;
	
	
	
	// C O N S T R U C T O R S
	public RatingReview() {}
	
	public RatingReview(int userId, Content content, String comment, Integer rating) {
		super();
		this.userId = userId;
		this.content = content;
		this.comment = comment;
		this.rating = rating;
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

	public Integer getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public Content getContent() {
		return content;
	}

	public void setContent(Content content) {
		this.content = content;
	}

	// T O   S T R I N G
	
	@Override
	public String toString() {
		return "RatingReview [id=" + id + ", userId=" + userId + ", content=" + content.getTitle() + ", comment=" + comment
				+ ", rating=" + rating + "]";
	}
	
	// H A S H   A N D   E Q U A L S

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((comment == null) ? 0 : comment.hashCode());
		result = prime * result + ((content == null) ? 0 : content.hashCode());
		result = prime * result + id;
		result = prime * result + rating;
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
		RatingReview other = (RatingReview) obj;
		if (comment == null) {
			if (other.comment != null)
				return false;
		} else if (!comment.equals(other.comment))
			return false;
		if (content == null) {
			if (other.content != null)
				return false;
		} else if (!content.equals(other.content))
			return false;
		if (id != other.id)
			return false;
		if (rating != other.rating)
			return false;
		if (userId != other.userId)
			return false;
		return true;
	}

	
}
