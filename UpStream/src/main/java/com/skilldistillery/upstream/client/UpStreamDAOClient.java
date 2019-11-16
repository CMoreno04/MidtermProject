package com.skilldistillery.upstream.client;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.springframework.beans.factory.annotation.Autowired;

import com.skilldistillery.upstream.data.UpStreamDAO;
import com.skilldistillery.upstream.data.UpStreamDAOImpl;
import com.skilldistillery.upstream.entities.User;

public class UpStreamDAOClient {

	private static EntityManagerFactory emf = Persistence.createEntityManagerFactory("UpStreamPU");
	private static EntityManager em = emf.createEntityManager();

	@Autowired
	private static UpStreamDAO dao = new UpStreamDAOImpl();

	public static void main(String[] args) {
		UpStreamDAOClient app = new UpStreamDAOClient();

		User user= new User(false, true, "tito", "123", "man", "ecko", null);
		
		
		
		System.out.println(dao.checkUserRegistration(user));
		System.out.println(dao.checkUserRegistration(em.find(User.class, 1)).getFirstName());

	}

}
