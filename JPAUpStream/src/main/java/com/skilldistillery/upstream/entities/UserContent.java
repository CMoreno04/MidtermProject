package com.skilldistillery.upstream.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity(name="user_content")
public class UserContent {
	// F I E L D S
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "content_id")
	private int contentId;
	
	@Column(name = "user_id")
	private int userId;
	
	@Column
	private boolean favorites;

	
	// C O N S T R U C T O R S
	
	public UserContent() {}
		
	public UserContent(int id, int contentId, int userId, boolean favorites) {
		super();
		this.id = id;
		this.contentId = contentId;
		this.userId = userId;
		this.favorites = favorites;
	}
	
	
	// G E T T E R S   A N D   S E T T E R S

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getContentId() {
		return contentId;
	}

	public void setContentId(int contentId) {
		this.contentId = contentId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public boolean isFavorites() {
		return favorites;
	}

	public void setFavorites(boolean favorites) {
		this.favorites = favorites;
	}
	

	// H A S H   A N D   E Q A U A L S
	
	
	// T O  S T R I N G
}
