package com.skilldistillery.upstream.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import com.skilldistillery.upstream.entities.RatingReview;
import com.skilldistillery.upstream.entities.Service;
import com.skilldistillery.upstream.entities.User;

public class UpStreamDAOImpl implements UpStreamDAO{
	
	@PersistenceContext
	private EntityManager em;
	

	@Override
	public List<Service> getAllServices() {
		String jpql = "SELECT s FROM Service s ";
				
		return em.createQuery(jpql,Service.class).getResultList();
		// TODO Auto-generated method stub
		
	}

	@Override
	public void getContentByService() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<RatingReview> getReviews() {
		return null;
		// TODO Auto-generated method stub
		
	}

	@Override
	public void getCustomers() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<User> getUsers() {
		// TODO Auto-generated method stub
		return null;
	}

}
