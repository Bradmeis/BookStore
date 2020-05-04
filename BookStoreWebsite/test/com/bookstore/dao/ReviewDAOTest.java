package com.bookstore.dao;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Book;
import com.bookstore.entity.Customer;
import com.bookstore.entity.Review;

public class ReviewDAOTest {

	private static ReviewDAO reviewDAO;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		reviewDAO = new ReviewDAO();
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		reviewDAO.close();
	}

	@Test
	public void testCreateReview() {
		Review review = new Review();
		Book book = new Book();
		book.setBookId(12);
		
		Customer customer = new Customer();
		customer.setCustomerId(26);
		
		review.setBook(book);
		review.setCustomer(customer);
		
		review.setHeadline("Very Good book");
		review.setRating(2);
		review.setComment("I have learnedd a lot from this book");
		
		Review setReview = reviewDAO.create(review);
		
		assertTrue(setReview.getReviewId() > 0);
	}
	
	@Test
	public void testGet() {
		int reviewId = 1;
		Review review = reviewDAO.get(reviewId);
		
		assertNotNull(reviewId);
	}
	
	@Test
	public void testUpdate() {
		int reviewId = 1;
		Review review = reviewDAO.get(reviewId);
		review.setHeadline("Excellent book.");
		
		Review updatedReview = reviewDAO.update(review);
		
		assertEquals("Excellent book.", updatedReview.getHeadline());
	}
	
	@Test
	public void testListAll() {
		List<Review> listAll = reviewDAO.listAll();
		
		assertTrue(listAll.size()> 0);
		
		for(Review review: listAll) {
			System.out.println(review.getReviewId() + " - " + review.getBook().getTitle()+
					" Reviewed by: " + review.getCustomer().getFirstname());
		}
	}
	
	@Test
	public void testCount() {
		long totalReviews = reviewDAO.count();
		
		assertEquals(5, totalReviews);
	}
	
	@Test
	public void testDelete() {
		int reviewId = 4;
		reviewDAO.delete(reviewId);
		
		Review review = reviewDAO.get(reviewId);
		
		assertNull(review);
	}
	
	@Test
	public void countByBook () {
		int bookId = 19;
		long totalReviews = reviewDAO.countByBook(bookId); 
		
		assertEquals(2, totalReviews);
	}
	
	@Test
	public void countByCustomer () {
		int customerId = 26;
		long totalReviews = reviewDAO.countWithNamedQuery("Review.countByCustomer", "customerId", customerId); 
		
		assertEquals(2, totalReviews);
	}

	@Test
	public void findByCustomerAndBookNotFound() {
		int customerId = 100;
		int bookId = 99;
		
		Review result = reviewDAO.findByCustomerAndBook(customerId, bookId);
		
		assertNull(result);
	}
	
	@Test
	public void findByCustomerAndBookFound() {
		int customerId = 26;
		int bookId = 19;
		
		Review result = reviewDAO.findByCustomerAndBook(customerId, bookId);
		
		assertNotNull(result);
	}
	
	@Test
	public void testListMostRecent() {
		List<Review> recentReviews = reviewDAO.listMosteRecent();
		
		assertEquals(3, recentReviews.size());
	}
}
