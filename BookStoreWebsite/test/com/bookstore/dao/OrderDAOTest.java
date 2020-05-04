package com.bookstore.dao;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;

import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;



import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Book;
import com.bookstore.entity.BookOrder;
import com.bookstore.entity.Customer;
import com.bookstore.entity.OrderDetail;

public class OrderDAOTest {

	private static OrderDAO orderDAO;
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		orderDAO = new OrderDAO();
	}

	
	@Test
	public void testCreateBookOrder() {
		BookOrder order = new BookOrder();
		Customer customer = new Customer();
		customer.setCustomerId(8);
		
		order.setCustomer(customer);
		order.setRecipientName("Bradley Phaswa");
		order.setRecipientPhone("0608032139");
		order.setShippingAddress("124 Carr Gardens, Fordsburg");
		
		Set<OrderDetail> orderDetails = new HashSet<>();
		OrderDetail orderDetail = new OrderDetail();
	
		Book book1 = new Book(21);
		
		orderDetail.setBook(book1);
	
		orderDetail.setQuantity(2);
		orderDetail.setSubtotal(3023.64);
		orderDetail.setBookOrder(order);
		
		orderDetails.add(orderDetail);
		
		order.setOrderDetails(orderDetails);
		
		BookOrder savedOrder = orderDAO.create(order);
		
		assertTrue(savedOrder != null && savedOrder.getOrderDetails().size() > 0);
	}

	@Test
	public void testUpdateBookOrder() {
		fail("Not yet implemented");
	}

	@Test
	public void testGet() {
		Integer orderId = 18;
		BookOrder order = orderDAO.get(orderId);
		
		assertEquals(1, order.getOrderDetails().size());
	}

	@Test
	public void testDeleteObject() {
		int orderId = 17;
		
		orderDAO.delete(orderId);
		
		BookOrder order = orderDAO.get(orderId);
		
		assertNull(order);
	}

	@Test
	public void testListAll() {
		List<BookOrder> listOrders = orderDAO.listAll();
		
		assertTrue(listOrders.size() > 0);
	}

	@Test
	public void testCount() {
		long totalOrders = orderDAO.count();
		
		assertEquals(2, totalOrders);
	}

	
	@Test
	public void testUpdateBookOrderDetails() {
		Integer orderId = 17;
		BookOrder order = orderDAO.get(orderId);
		
		Iterator<OrderDetail> iterator = order.getOrderDetails().iterator();
		
	
		
		while(iterator.hasNext()) {
			OrderDetail orderDetail = iterator.next();
			if(orderDetail.getBook().getBookId() == 12) {
				orderDetail.setQuantity(10);
				orderDetail.setSubtotal(9000);
			}
		}
		
		orderDAO.update(order);
		BookOrder updatedOrder = orderDAO.get(orderId);
		
		iterator = order.getOrderDetails().iterator();
		int expectedQuantity = 10;
		double expectedSubtotal = 9000;
		int actualQuantity = 0;
		double actualSubtotal = 0.0;
		
		while(iterator.hasNext()) {
			OrderDetail orderDetail = iterator.next();
			if(orderDetail.getBook().getBookId() == 12) {
				actualQuantity = orderDetail.getQuantity();
				actualSubtotal = orderDetail.getSubtotal();
			}
		}
			
		
		assertEquals(expectedQuantity, actualQuantity);
		assertEquals(expectedSubtotal, actualSubtotal);
		
		
	}
	
	@Test
	public void testUpdateBookOrderShippingAddress() {
		Integer orderId = 18;
		BookOrder order = orderDAO.get(orderId);
		order.setShippingAddress("New shipping address");
		
		orderDAO.update(order);
		BookOrder updatedOrder = orderDAO.get(orderId);
		
		assertEquals("New shipping address", updatedOrder.getShippingAddress());
		
		
	}
	
	@Test
	public void testListByCustomerNoOrders() {
		int customerId = 99;
		
		List<BookOrder> listOrders = orderDAO.listByCustomer(customerId);
		
		assertTrue(listOrders.isEmpty());
	}

	@Test
	public void testListByCustomerHasOrders() {
		int customerId = 8;
		
		List<BookOrder> listOrders = orderDAO.listByCustomer(customerId);
		
		assertTrue(listOrders.size() > 0);
	}
	
	
	@Test
	public void testGetByOrderIdAndCustomer() {
		int orderId = 25;
		int customerId = 8;
		
		BookOrder order = orderDAO.get(orderId, customerId);
		
		assertNotNull(order);
	}
	
	@Test
	public void testListRecentSales() {
		List<BookOrder> recentSales = orderDAO.listMostRecentSales();
		
		assertEquals(3, recentSales.size());
	}
	
	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		orderDAO.close();
	}

}
