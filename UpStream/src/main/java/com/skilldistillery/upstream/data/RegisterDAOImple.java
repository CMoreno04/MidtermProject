package com.skilldistillery.upstream.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.upstream.entities.User;

@Transactional
@Service
public class RegisterDAOImple implements RegisterDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public User addUser(User user) {
		

//		user.setActive(true);
		em.persist(user);
		em.flush();


		return user;
	}
	@Override
	public boolean checkIsUniqueUser(User user) {
		String jpql = "SELECT u FROM User u";

		
		if (user != null) {
			List<User> userCheck = em.createQuery(jpql, User.class).getResultList();
			for (User userInDB : userCheck) {
				if (userInDB.getUsername().equalsIgnoreCase(user.getUsername())) {

					return true;
				}
			}
		}

		return false;

	}
	@Override
	public User updateUser(User user) {
//		System.out.println("RegisterDAOImple.updateUser(): " + user);
		User updatedUser = em.find(User.class, user.getId());
//		System.out.println("RegisterDAOImple.updateUser(): " + updatedUser);
		
		updatedUser.setFirstName(user.getFirstName());
		updatedUser.setLastName(user.getLastName());
		updatedUser.setUsername(user.getUsername());
		updatedUser.setPassword(user.getPassword());
		em.flush();
		
		
		return updatedUser;
	}
	
}
