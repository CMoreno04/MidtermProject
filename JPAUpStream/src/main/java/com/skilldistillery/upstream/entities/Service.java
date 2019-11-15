package com.skilldistillery.upstream.entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

@Entity
public class Service {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column
	private String name;
	
	@Column
	private double monthlyPrice;
//	
//	@ManyToMany(mappedBy="services")
//	private List<Content> contents;

	public Service(int id, String name, double monthlyPrices) {
		super();
		this.id = id;
		this.name = name;
		this.monthlyPrice = monthlyPrice;
//		this.contents = contents;
	}

	public Service() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getMonthlyPrice() {
		return monthlyPrice;
	}

	public void setMonthlyPrice(double monthlyPrice) {
		this.monthlyPrice = monthlyPrice;
	}

//	public List<Content> getContents() {
//		return contents;
//	}
//
//	public void setContents(List<Content> contents) {
//		this.contents = contents;
//	}
//	
}
