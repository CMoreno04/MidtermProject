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
@Table(name = "user_content")
public class UserContent {
	// F I E L D S

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@ManyToOne
	@JoinColumn(name = "content_id")
	private Content userContent;

	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;

	@Column
	private boolean favorites;
	
	@Column(name= "wish_list")
	private boolean wishlist;
	
	// C O N S T R U C T O R S

	public UserContent() {
		super();
		// TODO Auto-generated constructor stub
	}

	public UserContent(Content content, User user, boolean favorites, boolean wishlist) {
		super();
		this.userContent = content;
		this.user = user;
		this.favorites = favorites;
		this.wishlist = wishlist;
	}

	// G E T T E R S A N D S E T T E R S

	public int getId() {
		return id;
	}

	public Content getUserContent() {
		return userContent;
	}

	public void setUserContent(Content content) {
		this.userContent = content;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public boolean isFavorites() {
		return favorites;
	}

	public void setFavorites(boolean favorites) {
		this.favorites = favorites;
	}


	public boolean isWishlist() {
		return wishlist;
	}

	public void setWishlist(boolean wishlist) {
		this.wishlist = wishlist;
	}
	// T O S T R I N G

	@Override
	public String toString() {
		return "UserContent [id=" + id + ", userContent=" + userContent + ", user=" + user + ", favorites=" + favorites
				+ ", wishlist=" + "]";
	}

	// H A S H A N D E Q U A L S

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (favorites ? 1231 : 1237);
		result = prime * result + id;
		result = prime * result + ((user == null) ? 0 : user.hashCode());
		result = prime * result + ((userContent == null) ? 0 : userContent.hashCode());
		result = prime * result + (wishlist ? 1231 : 1237);
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
		UserContent other = (UserContent) obj;
		if (favorites != other.favorites)
			return false;
		if (id != other.id)
			return false;
		if (user == null) {
			if (other.user != null)
				return false;
		} else if (!user.equals(other.user))
			return false;
		if (userContent == null) {
			if (other.userContent != null)
				return false;
		} else if (!userContent.equals(other.userContent))
			return false;
		if (wishlist != other.wishlist)
			return false;
		return true;
	}

}
