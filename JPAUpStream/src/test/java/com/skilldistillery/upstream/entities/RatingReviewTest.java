package com.skilldistillery.upstream.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;


class RatingReviewTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private RatingReview rating;
	
	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("UpStreamPU");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		rating = em.find(RatingReview.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		rating = null;
		
	}

	@Test
	@DisplayName("Checks what first rating is")
	void test1() {
		assertNotNull(rating);
		assertEquals(1, rating.getRating());  
	}
	
	@Test
	@DisplayName("Checks what first coment is")
	void test2() {
		assertEquals("", rating.getComment());  // add whatever content is added.
	}
}
