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


class UserContentTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private UserContent uc;
	
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
		uc = em.find(UserContent.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		uc = null;
		
	}

	@Test
	@DisplayName("Checks content id")
	void test1() {
		assertNotNull(uc);
		assertEquals(1, uc.getId()); 
	}
	
	@Test
	@DisplayName("Checks user id")
	void test2() {
		assertNotNull(uc);
		assertEquals(4, uc.getUser().getId()); 
	}
	
	@Test
	@DisplayName("Checks favorites")
	void test3() {
		assertNotNull(uc);
		assertEquals(false, uc.isFavorites()); 
	}
	@Test
	@DisplayName("Checks wishlist")
	void test4() {
		assertNotNull(uc);
		assertEquals(false, uc.isWishlist());
		
	}
	
}