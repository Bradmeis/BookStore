package com.bookstore.dao;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Customer;

public class CustomerDAOTest {
	private static CustomerDAO customerDAO;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		customerDAO = new CustomerDAO();
	}
	
	@Test
	public void testCreateCustomer() {
		Customer customer = new Customer();
		
		customer.setEmail("lucky@yahoo.com");
		
		customer.setFullname("Lucky Phaswana");
		customer.setCity("Johannesburg");
		customer.setCountry("South Africa");
		customer.setAddress("124 Carr Gardens");
		
		
		customer.setPassword("secret");
		customer.setPhone("0608032139");
		customer.setZipcode("1620");
		
		Customer savedCustomer = customerDAO.create(customer);
		
		assertTrue(savedCustomer.getCustomerId() > 0);
		
	}
	
	@Test
	public void testGetCustomer() {
		int customerId = 4;
		
		Customer customer = customerDAO.get(customerId);
		
		assertNotNull(customer);
	}
	
	@Test
	public void testUpdateCustomer() {
		Customer customer = customerDAO.get(8);
		String fullName = "BRAD BRAD BAD";
		String password = "secret";
		customer.setFullname("BRAD BRAD BAD");
		Customer updated = customerDAO.update(customer);
		
		
		assertTrue(updated.getFullname().equals(fullName));
	}

	@Test
	public void testListAll() {
		List<Customer> listCustomers = customerDAO.listAll();
		
		assertFalse(listCustomers.isEmpty());
		
		for(Customer aCustomer: listCustomers)
		{
			System.out.println("Customer name: " + aCustomer.getFullname());
		}
		
	}
	
	@Test
	public void testDeleteCustomer() {
		int customerId = 4;
		customerDAO.delete(4);
		Customer customer = customerDAO.get(4);
		assertTrue(customer == null);
	}
	
	@Test
	public void testCount() {
		long tottalCustomers = customerDAO.count();
		
		assertEquals(2, tottalCustomers);
	}
	
	@Test
	public void testFindByEmail() {
		String email = "bradmeis@yahoo.com";
		
		Customer existCustomer = customerDAO.findByEmail(email);
		
		assertNotNull(existCustomer);
	}
	
	@Test
	public void checkLoginSuccess() {
		String email = "bradmeis@yahoo.com";
		String password = "secret";
		
		Customer customer = customerDAO.checkLogin(email, password);
		
		assertNotNull(customer);
	}
	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		customerDAO.close();
	}

	

}
