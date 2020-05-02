package com.bookstore.dao;

import static org.junit.Assert.*;

import java.io.IOException;
import java.net.URI;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityNotFoundException;

import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import com.bookstore.entity.Book;
import com.bookstore.entity.Category;

public class BookDAOTest  {

	private static BookDAO bookDAO;

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		
		bookDAO = new BookDAO();
	}

	@Test
	public void testCreateBook() throws ParseException, IOException {
		Book newBook = new Book();

		Category category = new Category("Programming");
		category.setCategoryId(17);
		newBook.setCategory(category);

		newBook.setTitle("Effective Java (2nd Edition)");
		newBook.setAuthor("Joshua Bloch");
		newBook.setDescription("New coverage of generics, enums, annotation, autoboxing");
		newBook.setPrice(38.87);
		newBook.setIsbn("035848454");

		DateFormat dateFormat = new SimpleDateFormat("MM/DD/yyyy");
		Date publisheDate = dateFormat.parse("08/28/2008");
		newBook.setPublisheDate(publisheDate);

		String imagePath = "C:\\Users\\Bradley Phaswana\\eclipse-workspace\\BookStore\\Downloaded Images\\Effective Java.jpg";
		byte[] imageBytes = Files.readAllBytes(Paths.get(imagePath));
		newBook.setImage(imageBytes);
		Book createdBook = bookDAO.create(newBook);

		assertTrue(createdBook.getBookId() > 0);
	}

	@Test
	public void testCreate2ndBook() throws ParseException, IOException {
		Book newBook = new Book();

		Category category = new Category("Programming");
		category.setCategoryId(17);
		newBook.setCategory(category);

		newBook.setTitle("Java 8 In Action");
		newBook.setAuthor("Raul Gabriella Urma");
		newBook.setDescription("Lambdas, Streams, and Funcitonal-style-programming");
		newBook.setPrice(40.87);
		newBook.setIsbn("035848454");

		DateFormat dateFormat = new SimpleDateFormat("MM/DD/yyyy");
		Date publisheDate = dateFormat.parse("08/28/2014");
		newBook.setPublisheDate(publisheDate);

		String imagePath = "C:\\Users\\Bradley Phaswana\\eclipse-workspace\\BookStore\\Downloaded Images\\urma.png";
		byte[] imageBytes = Files.readAllBytes(Paths.get(imagePath));
		newBook.setImage(imageBytes);
		Book createdBook = bookDAO.create(newBook);

		assertTrue(createdBook.getBookId() > 0);
	}

	
	@Test
	public void updateBook() throws ParseException, IOException {
		Book existBook = new Book();
		existBook.setBookId(1);
		Category category = new Category("Health");
		category.setCategoryId(18);
		existBook.setCategory(category);

		existBook.setTitle("Effective Java (4th Edition)");
		existBook.setAuthor("Joshua Bloch");
		existBook.setDescription("New coverage of generics, enums, annotation, autoboxing");
		existBook.setPrice(40);
		existBook.setIsbn("035848454");

		DateFormat dateFormat = new SimpleDateFormat("MM/DD/yyyy");
		Date publisheDate = dateFormat.parse("08/28/2008");
		existBook.setPublisheDate(publisheDate);

		String imagePath = "C:\\Users\\Bradley Phaswana\\eclipse-workspace\\BookStore\\Downloaded Images\\Effective Java.jpg";
		byte[] imageBytes = Files.readAllBytes(Paths.get(imagePath));
		existBook.setImage(imageBytes);
		Book updatedBook = bookDAO.update(existBook);

		assertEquals(updatedBook.getTitle(), "Effective Java (4th Edition)");
	}

	@Test(expected = EntityNotFoundException.class)
	public void deleteBook() {
		Integer bookId = 2;
		bookDAO.delete(bookId);
	}

	@Test
	public void testGetBookFail() {
		Integer bookId = 99;
		Book book = bookDAO.get(bookId);
		assertNull(book);
	}

	@Test
	public void testGetBookSuccess() {
		Integer bookId = 5;
		Book book = bookDAO.get(bookId);
		assertNotNull(book);
	}
	
	@Test
	public void testFindAll() {
		List<Book> listBook =bookDAO.listAll();
		
		for(Book aBook: listBook) {
			System.out.println(aBook.getTitle() + " - " +aBook.getAuthor());
		}
		
		assertFalse(listBook.isEmpty());
	}
	@Test()
	public void deleteBookSuccess() {
		Integer bookId = 1;
		bookDAO.delete(bookId);
		assertTrue(true);
	}

	@Test
	public void findByTitleNotExist() {
		String title = "Thinking in Java";
		
		Book book = bookDAO.findByTitle(title);
		
		assertNull(book);
		
	}
	
	@Test
	public void findByTitleExist() {
		String title = "Java 8 in action";
		
		Book book = bookDAO.findByTitle(title);
		
		assertNotNull(book);
		System.out.println(book.getAuthor() + " - " + book.getPrice());
	}
	
	@Test
	public void testCount() {
		long totalBooks = bookDAO.count();
		
		assertEquals(1, totalBooks);
	}
	
	@Test
	public void testListByCategory() {
		int categoryId = 21;
		
		List<Book> listBooks = bookDAO.listByCategory(categoryId);
		
		assertTrue(listBooks.size() > 0);
	}
	
	@Test
	public void testSearchBookInTitlte() {
		String keyword = "Head";
		List<Book> result = bookDAO.search(keyword);
		
		for(Book aBook: result) {
			System.out.println(aBook.getTitle());
		}
		
		assertEquals(5, result.size());
	}
	
	@Test
	public void testSearchBookByAuthor() {
		String keyword = "Joshua";
		List<Book> result = bookDAO.search(keyword);
		
		for(Book aBook: result) {
			System.out.println(aBook.getTitle());
		}
		
		assertEquals(1, result.size());
	}
	
	@Test
	public void testSearchBookByDescription() {
		String keyword = "functional-style programming.";
		List<Book> result = bookDAO.search(keyword);
		
		for(Book aBook: result) {
			System.out.println(aBook.getTitle());
		}
		
		assertEquals(1, result.size());
	}
	
	@Test
	public void testListNewBooks() {
		List <Book> listNewBooks = bookDAO.listNewBooks();
		
		for(Book aBook: listNewBooks) {
			System.out.println(aBook.getTitle() + " - " + aBook.getPublisheDate());
		}
		
		assertEquals(4, listNewBooks.size());
		
	}
	
	@Test
	public void testCountByCategory() {
		int categoryId = 18;
		
		long numberOfBooks = bookDAO.countByCategory(categoryId);
		
		assertEquals(5, numberOfBooks);
	}
	
	@Test
	public void testListBestSellingBooks () {
		List<Book> topBestSellingBooks = bookDAO.listBestSellingBooks();
		
		for(Book book : topBestSellingBooks) {
			System.out.println(book.getTitle() + " - " + book.getAuthor());
		}
		
		assertEquals(4, topBestSellingBooks.size());
	}
	
	@Test
	public void testListMostFavoredBooks () {
		List<Book> topFavoredBooks = bookDAO.listMostFavoredBooks();
		
		for(Book book : topFavoredBooks) {
			System.out.println(book.getTitle() + " - " + book.getAuthor());
		}
		
		assertEquals(3, topFavoredBooks.size());
	}
	
	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		bookDAO.close();
	}

}
