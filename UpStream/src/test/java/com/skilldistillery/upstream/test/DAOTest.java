package com.skilldistillery.upstream.test;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import com.skilldistillery.upstream.data.UpStreamDAO;
import com.skilldistillery.upstream.data.UpStreamDAOImpl;

@SpringBootTest
class DAOTest {

	private UpStreamDAO dao;

	@BeforeEach
	void setUp() throws Exception {
		dao = new UpStreamDAOImpl();
	}

	@AfterEach
	void tearDown() throws Exception {
		dao = null;
	}

	@Test
	void test() {
		assertEquals("", dao.getTopRatedContent().get(0));
	}

}
