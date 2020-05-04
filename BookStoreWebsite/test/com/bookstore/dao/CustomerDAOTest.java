package com.bookstore.dao;

import static org.junit.Assert.*;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.ServletException;

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
		
		customer.setFirstname("Lucky");
		customer.setLastname("Phaswana");
		customer.setCity("Johannesburg");
		customer.setProvince("Gauteng");
		customer.setCountry("South Africa");
		customer.setAddressLine1("124 Carr Gardens");
		customer.setAddressLine2("1 High Road");
		
		customer.setPassword("secret");
		customer.setPhone("0608032139");
		customer.setZipcode("1620");
		
		Customer savedCustomer = customerDAO.create(customer);
		
		assertTrue(savedCustomer.getCustomerId() > 0);
		
	}
	
	@Test
	public void testGetCustomer() {
		int customerId = 27;
		
		Customer customer = customerDAO.get(customerId);
		
		assertNotNull(customer);
	}
	
	@Test
	public void testUpdateCustomer() {
		Customer customer = customerDAO.get(8);
		String fullName = "BRAD BRAD BAD";
		String password = "Secret";
		customer.setFirstname("BRAD BRAD BAD");
		Customer updated = customerDAO.update(customer);
		
		
		assertTrue(updated.getFirstname().equals(fullName));
	}

	@Test
	public void testListAll() {
		List<Customer> listCustomers = customerDAO.listAll();
		
		assertFalse(listCustomers.isEmpty());
		
		for(Customer aCustomer: listCustomers)
		{
			System.out.println("Customer name: " + aCustomer.getFirstname());
		}
		
	}
	
	@Test
	public void testDeleteCustomer() {
		int customerId = 4;
		customerDAO.delete(customerId);
		Customer customer = customerDAO.get(4);
		assertTrue(customer == null);
	}
	
	@Test
	public void testCount() {
		long tottalCustomers = customerDAO.count();
		
		assertEquals(4, tottalCustomers);
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
	
	@Test
	public void testNewCustomer() {
		String[] countryCodes = Locale.getISOCountries();
		
		Map<String, String> mapCountries = new HashMap<>();
		
		
		for(String countryCode: countryCodes) {
			Locale locale = new Locale("", countryCode);
			String code = locale.getCountry();	 
			String name = locale.getDisplayCountry();
			
			mapCountries.put(code, name);
		}
		
		assertTrue(mapCountries.size()>0);
		
		System.out.println(mapCountries);
		
		
	}
	
	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		customerDAO.close();
	}

	

}
