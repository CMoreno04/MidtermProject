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


class ContentTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Content content;

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
		content = em.find(Content.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		content = null;
		
	}

	@Test
	@DisplayName("Checks if not null.")
	void test1() {
		assertNotNull(content);
		assertEquals("stranger things", content.getTitle().toLowerCase()); 
		
	}
	
	@Test
	@DisplayName("Checks if not null and description.")
	void test2() {
		assertEquals("When a young boy vanishes, a small town uncovers a mystery involving secret experiments, terrifying supernatural forces and one strange little girl.", content.getDescription()); 
	}
	
	
	@Test
	@DisplayName("Checks content id")
	void test3() {
		assertEquals(1, content.getServiceId()); 
	}
	
	@Test
	@DisplayName("Checks content id")
	void test4() {
		assertEquals(2, content.getVideo().getId()); 
	}
	
	@Test
	@DisplayName("Checks content id")
	void test5() {
		assertEquals(1, content.getImage().getId()); 
	}
	
	@Test
	@DisplayName("get genres ")
	void get_genres() {
		assertEquals("Horror", content.getGenres().get(0).getName()); 
	}
	
	
	
}
