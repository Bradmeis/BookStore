package com.bookstore.dao;

import static org.junit.Assert.*;

import java.util.HashSet;
import java.util.Set;

import org.junit.Test;

import com.bookstore.entity.Book;
import com.bookstore.entity.Review;

public class BookRatingTest {


	@Test
	public void testAveragRating() {
		Book book = new Book();
		Set<Review> reviews = new HashSet<>();
		Review review1 = new Review();
		
		review1.setRating(5);
		reviews.add(review1);
		
		book.setReviews(reviews);
		
		double averageRating = book.getAverageRating();
		
		assertEquals(5.0, averageRating, 0.0);
	}
	
	@Test
	public void testAveragRating2() {
		Book book = new Book();
		Set<Review> reviews = new HashSet<>();
		
		Review review1 = new Review();
		review1.setRating(5);
		reviews.add(review1);
		
		Review review2 = new Review();
		review2.setRating(4);
		reviews.add(review2);
		
		Review review3 = new Review();
		review3.setRating(3);
		reviews.add(review3);
		
		book.setReviews(reviews);
		
		double averageRating = book.getAverageRating();
		
		assertEquals(4.0, averageRating, 0.0);
	}
	
	@Test
	public void testRatingString() {
		double averageRating = 0.0;
		Book book = new Book();
		String actual = book.getRatingString(averageRating);
		
		String expected = "off,off,off,off,off";
		
		assertEquals(expected, actual);
	}
	
	@Test
	public void testRatingString2() {
		double averageRating = 5.0;
		Book book = new Book();
		String actual = book.getRatingString(averageRating);
		
		String expected = "on,on,on,on,on";
		
		assertEquals(expected, actual);
	}
	
	@Test
	public void testRatingString3() {
		double averageRating = 4.5;
		Book book = new Book();
		String actual = book.getRatingString(averageRating);
		
		String expected = "on,on,on,on,half";
		
		assertEquals(expected, actual);
	}
	
	
	@Test
	public void testRatingString4() {
		double averageRating = 3.6;
		Book book = new Book();
		String actual = book.getRatingString(averageRating);
		
		String expected = "on,on,on,half,off";
		
		assertEquals(expected, actual);
	}

}
