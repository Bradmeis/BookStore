package com.bookstore.dao;

import static org.junit.Assert.*;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Category;

public class CategoryDAOTest {

	private static CategoryDAO categoryDAO;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		

		categoryDAO = new CategoryDAO();
	}

	
	@Test
	public void testCreateCategory() {
		Category newCat = new Category("Python");
		Category category = categoryDAO.create(newCat);
		
		assertTrue(category != null && category.getCategoryId() > 0);
		
	}

	@Test
	public void testUpdateCategory() {
		Category newCat = new Category("Java Core");
		newCat.setCategoryId(1);
		categoryDAO.update(newCat);
		System.out.println("Updated");
		 
	}

	@Test
	public void testGet() {
		int catId = 8;
		Category cat = categoryDAO.get(catId);
		
		if(cat !=null) {
		assertNotNull(cat);
		System.out.println("Id found");
		}else {
			assertNull(cat);
			System.out.println("Id not found");
		}
	}

	@Test
	public void testDeleteObject() {
		int catId = 1;
		categoryDAO.delete(catId);
		
		System.out.println("Deleted");
	}

	@Test
	public void testListAll() {
		List<Category> listCategory = categoryDAO.listAll();
		
		assertTrue(listCategory.size() > 0);
		listCategory.forEach(c -> System.out.println(c.getName()));
	}

	@Test
	public void testCount() {
		long totalCategories = categoryDAO.count();
		assertEquals(4, totalCategories);
	}
	
	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		categoryDAO.close();
	}


}
