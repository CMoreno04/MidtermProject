package com.skilldistillery.upstream.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class UserTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private User user;

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
		user = em.find(User.class, 4);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		user = null;
		
	}

	@Test
	@DisplayName("Checks if user is not null.  Checks that username exists.")
	void test1() {
		assertNotNull(user);
		assertEquals("bobbobert", user.getUsername().toLowerCase());
	}
	
	@Test
	@DisplayName("Checks if user is not null.  Checks that username exists.")
	void test1AndAHalf() {
		assertNotNull(user);
		assertEquals("notboring", user.getPassword().toLowerCase());
	}
	
	@Test
	@DisplayName("Checks if user first name is correct")
	void test2() {
		assertNotNull(user);
		assertEquals("zak", user.getFirstName().toLowerCase());
	}
	
	@Test
	@DisplayName("Checks if user last name is correct")
	void test3() {
		assertNotNull(user);
		assertEquals("saylors", user.getLastName().toLowerCase());
	}
	
	@Test
	@DisplayName("Checks if user is admin")
	void test4() {
		assertEquals(false, user.isAdmin());
	}
	
	@Test
	@DisplayName("Checks for user image")
	void test5() {
		assertEquals("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsTiCmktIKpEbqMkD-ArsbCaVHYcgEW-tpMixez8pbPeQDgDQi&s", user.getUserImage().getUrl());
	}
	
//	@Test
//	@DisplayName("Checks if user is admin (uncomment and switch user to 1.  Should be one of only test cases that pass.")
//	void test4AndAHalf() {
//		assertNotNull(user);
//		assertEquals(true, user.isAdmin());
//	}
	
//	@Test
//	@DisplayName("Checks if image is populated")
//	void test5() {
//		assertEquals("", user.getImageId()); // enter img id in order to pass.
//	}

//	@Test
//	@DisplayName("Checks if program is retreiving services")
//	void test6() {
//		assertEquals("stranger things", user.getContentId().get(0)); // enter service id's
//	}
	

// BELOW TEST CASES ARE FOR STRETCH GOALS
	
//	@Test
//	@DisplayName("Checks favorites")
//	void test8() {
//		assertEquals("", user.getFavorites().get(0)); // enter img id in order to pass.
//	}
//	
//	@Test
//	@DisplayName("Checks wishlist")
//	void test9() {
//		assertEquals("", user.getWishlist().get(0)); // enter img id in order to pass.
//	}
	
	
}