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

class MediaTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Media media;

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
		media = em.find(Media.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		media = null;
	}

	@Test
	@DisplayName("Checks if first media is stranger things logo image")
	void test1() {
		assertNotNull(media);

		assertEquals("https://upload.wikimedia.org/wikipedia/commons/3/38/stranger_things_logo.png",
				media.getUrl().toLowerCase());

	}

}
