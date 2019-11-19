package com.skilldistillery.upstream.entities;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

@Entity
public class Genre {
	// F I E L D S

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String name;

	@ManyToMany(mappedBy = "genres", cascade = { CascadeType.PERSIST, CascadeType.REMOVE })
	private List<Content> contents;

	// C O N S T R U C T O R S

	public Genre() {
	}

	public Genre(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	// G E T T E R S A N D S E T T E R S

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Content> getContents() {
		return contents;
	}

	public void setContents(List<Content> contents) {
		this.contents = contents;
	}

	// T O S T R I N G
	@Override
	public String toString() {
		return "Genre [id=" + id + ", name=" + name + "]";
	}
}
