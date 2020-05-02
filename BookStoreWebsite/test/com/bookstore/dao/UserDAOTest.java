package com.bookstore.dao;

import static org.junit.Assert.*;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceException;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Users;

public class UserDAOTest {
	
	private static UserDAO userDAO;

	@BeforeClass
	public static void setUpClass() throws Exception {

		userDAO = new UserDAO();

	}

	//1.Testing Create User Method
	@Test
	public void testCreateUsers() {
		Users user1 = new Users();
		user1.setEmail("jen@gmail.com");
		user1.setFullName("loli Jansen");
		user1.setPassword("123456");

		user1 = userDAO.create(user1);
		assertTrue(user1.getUserId() > 0);

	}

	//2.Testing Create User Method
	@Test(expected = PersistenceException.class)
	public void testCreateUsersFieldsNotSet() {
		Users user1 = new Users();
		user1 = userDAO.create(user1);
		assertTrue(user1.getUserId() > 0);

	}
	//Testing update user
	@Test
	public void testUpdateUsers() {
		Users user = new Users();
		user.setUserId(4);
		user.setEmail("	jen@gmail.com");
		user.setFullName("Loli Jansen");
		user.setPassword("secret");
		
		user = userDAO.update(user);
		
		
	}

	//1.Testing GetUser Found Method
	@Test
	public void testGetusersFound(){
		Integer userId=3;
		
		Users user = userDAO.get(userId);
		System.out.println("Email of User: " + user.getEmail());
		if(user !=null) {
		assertNotNull(user);}
		
	}
	
	//2.Testing GetUser Not Found Method
	@Test()
	public void testGetusersNotFound(){
		Integer userId=5;
		Users user = userDAO.get(userId);	
		assertNull(user);
	}
	
	//1. Testing DeleteUser
	@Test
	public void deleteUsers() {
		Integer userId=2;
		Users user = userDAO.get(userId);
		userDAO.delete(userId);
		System.out.println("User "+ user.getFullName()+" is deleted from database");
	}
	
	//1. Testing DeleteUser when the user doesn't exist
		@Test(expected = Exception.class)
		public void deleteNonExistUsers() {
			Integer userId=2;
			userDAO.delete(userId);
			
		}
	
		//Testing ListAll method 
		@Test
		public void testListAll(){
			List<Users> listUsers = userDAO.listAll();
			assertTrue(listUsers.size() >0);
			
			for(Users user: listUsers) {
			System.out.println(user.getFullName());
			}
		}
		
		@Test
		public void testCount() {
			long totalUsers = userDAO.count();
			assertEquals(3, totalUsers);
		}
		
		@Test
		public void testCheckLogin() {
			String email = "bradmeis@yahoo.com";
			String password = "Brad6263087";
			boolean actual = userDAO.checkLogin(email, password);
			assertTrue(actual);
		}
		@Test
		public void testFindByEmail() {
			String email = "bradmeis@yahoo.com";
			Users user = userDAO.findByEmail(email);
			
			assertNotNull(user);
		}
	@AfterClass
	public static void tearDownClass() throws Exception {
		userDAO.close();
	}

}
