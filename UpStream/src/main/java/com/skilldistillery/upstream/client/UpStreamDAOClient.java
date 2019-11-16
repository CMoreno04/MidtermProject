package com.skilldistillery.upstream.client;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.springframework.beans.factory.annotation.Autowired;

import com.skilldistillery.upstream.data.UpStreamDAO;
import com.skilldistillery.upstream.data.UpStreamDAOImpl;
import com.skilldistillery.upstream.entities.Content;
import com.skilldistillery.upstream.entities.RatingReview;

public class UpStreamDAOClient {

	private static EntityManagerFactory emf = Persistence.createEntityManagerFactory("UpStreamPU");
	private static EntityManager em = emf.createEntityManager();

	@Autowired
	private static UpStreamDAO dao = new UpStreamDAOImpl();

	public static void main(String[] args) {
		for (RatingReview string : dao.getTopRatedByService(1)) {

			System.out.println(string.getContent().getService().getName());
			System.out.println(string.getContent().getTitle()+" "+string.getRating()+"\n");
		}

//		UpStreamDAOClient app = new UpStreamDAOClient();
//		app.createNewReview();

	}

	private void createNewReview() {

		Content cont = em.find(Content.class, 2);

		RatingReview rev1 = new RatingReview(3, cont, "Excellent Show", 4);
		RatingReview rev2 = new RatingReview(3, cont, "Excellent Show", 3);
		RatingReview rev3 = new RatingReview(3, cont, "Excellent Show", 5);

		em.getTransaction().begin();

		em.persist(rev1);
		em.persist(rev2);
		em.persist(rev3);

		em.flush();

		em.getTransaction().commit();

		em.close();
		emf.close();

	}

}
