package com.skilldistillery.upstream.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

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
	
	@Column(name="service_id")
	private int serviceId;
	
	@Column(name="image_id")
	private int imageId;
  
	
	@Column(name="video_id")
	private int videoId;


 
	// C O N S T R U C T O R S
	
	public Content() {
		super();
	}
	
	public Content(int id, String title, String description, int serviceId, int imageId, int videoId) {
		super();
		this.id = id;
		this.title = title;
		this.description = description;
		this.serviceId = serviceId;
		this.imageId = imageId;
		this.videoId = videoId;
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

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getServiceId() {
		return serviceId;
	}

	public void setServiceId(int serviceId) {
		this.serviceId = serviceId;
	}

	public int getImageId() {
		return imageId;
	}

	public void setImageId(int imageId) {
		this.imageId = imageId;
	}

	public int getVideoId() {
		return videoId;
	}

	public void setVideoId(int videoId) {
		this.videoId = videoId;
	}

  
	// H A S H   A N D   E Q A L S


	

	// T O  S T R I N G
	
}
