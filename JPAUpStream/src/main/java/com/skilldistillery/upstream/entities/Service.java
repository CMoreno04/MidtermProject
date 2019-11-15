package com.skilldistillery.upstream.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


@Entity
public class Service {

	// F I E L D S
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "name")
	private String name;

	@Column(name = "monthly_price")
	private double monthlyPrice;


	// C O N S T R U C T O R S
	public Service() {
		super();
          	}

	public Service(String name, double monthlyPrice) {
		super();
		this.name = name;
		this.monthlyPrice = monthlyPrice;
	}

	// S E T T E R S  A N D  G E T T E R S
	
	public int getId() {
		return id;
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

	// T O  S T R I N G
	
	@Override
	public String toString() {
		return "Service [id=" + id + ", name=" + name + ", monthlyPrice=" + monthlyPrice + "]";
	}

	//H A S H  A N D  E Q U A L S
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		long temp;
		temp = Double.doubleToLongBits(monthlyPrice);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + ((name == null) ? 0 : name.hashCode());
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
		Service other = (Service) obj;
		if (id != other.id)
			return false;
		if (Double.doubleToLongBits(monthlyPrice) != Double.doubleToLongBits(other.monthlyPrice))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		return true;
	}
	
}
