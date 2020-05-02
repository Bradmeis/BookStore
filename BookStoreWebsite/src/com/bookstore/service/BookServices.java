package com.bookstore.service;

import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.bookstore.dao.BookDAO;
import com.bookstore.dao.CategoryDAO;
import com.bookstore.dao.OrderDAO;
import com.bookstore.entity.Book;
import com.bookstore.entity.Category;

public class BookServices {
	private BookDAO bookDAO;

	private CategoryDAO categoryDAO;
	private HttpServletRequest request;
	private HttpServletResponse response;

	public BookServices(HttpServletRequest request, HttpServletResponse response) {
		super();
		this.request = request;
		this.response = response;
		bookDAO = new BookDAO();
		categoryDAO = new CategoryDAO();

	}

	public void listBooks() throws ServletException, IOException {
		listBooks(null);
	}

	public void listBooks(String message) throws ServletException, IOException {
		List<Book> listBooks = bookDAO.listAll();
		request.setAttribute("listBooks", listBooks);

		if (message != null) {
			request.setAttribute("message", message);
		}
		String listPage = "book_list.jsp";

		RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPage);
		requestDispatcher.forward(request, response);
	}

	public void showBookNewForm() throws ServletException, IOException {
		List<Category> listCategory = categoryDAO.listAll();
		request.setAttribute("listCategory", listCategory);

		String newPage = "book_form.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(newPage);
		requestDispatcher.forward(request, response);
	}

	public void createBook() throws ServletException, IOException {

		int categoryId = Integer.parseInt(request.getParameter("category"));
		String title = request.getParameter("title");

		Book existBook = bookDAO.findByTitle(title);

		if (existBook != null) {
			String message = "Could not create book new book, a book with the title '" + title + "' already exists.";
			listBooks(message);
		}

		String author = request.getParameter("author");
		String description = request.getParameter("description");
		String isbn = request.getParameter("isbn");
		double price = Double.parseDouble(request.getParameter("price"));

		DateFormat dateFormat = new SimpleDateFormat("MM/DD/yyyy");
		Date publishDate = null;
		try {
			publishDate = dateFormat.parse(request.getParameter("publishDate"));
		} catch (ParseException ex) {
			ex.printStackTrace();
			throw new ServletException("Error parsing publish date (format is MM/DD/yyyy");
		}

		Book newBook = new Book();
		Category category = categoryDAO.get(categoryId);
		newBook.setCategory(category);
		newBook.setTitle(title);
		newBook.setAuthor(author);
		newBook.setDescription(description);
		newBook.setIsbn(isbn);

		// Getting Image from the servlet which is uploaded from System storage. More
		// info in CreateBooksServlet.

		Part part = request.getPart("bookImage");

		if (part != null && part.getSize() > 0) {
			long size = part.getSize();
			byte[] imageBytes = new byte[(int) size];

			InputStream inputStream = part.getInputStream();
			inputStream.read(imageBytes);
			inputStream.close();

			newBook.setImage(imageBytes);
		}

		newBook.setPrice(price);
		newBook.setPublisheDate(publishDate);

		Book createdBook = bookDAO.create(newBook);

		if (createdBook.getBookId() > 0) {
			String message = "New book has been created successfully!";
			listBooks(message);

		}
	}

	public void editBook() throws ServletException, IOException {

		int bookId = Integer.parseInt(request.getParameter("id"));

		Book book = bookDAO.get(bookId);

		if (book == null) {

			String message = "Could not find book with ID " + bookId + " to edit.";
			request.setAttribute("message", message);

			listBooks(message);

		}

		List<Category> listCategory = categoryDAO.listAll();

		request.setAttribute("book", book);
		request.setAttribute("listCategory", listCategory);
		String editPage = "book_form.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(editPage);
		requestDispatcher.forward(request, response);
	}

	public void updateBook() throws ServletException, IOException {

		int bookId = Integer.parseInt(request.getParameter("bookId"));

		Book existBook = bookDAO.get(bookId);

		int categoryId = Integer.parseInt(request.getParameter("category"));
		String title = request.getParameter("title");

		Book bookByTitle = bookDAO.findByTitle(title);

		if (bookByTitle != null && !existBook.equals(bookByTitle)) {
			String message = "Cuould not update this book. A book with the same title exists.";
			listBooks(message);
			return;
		}

		String author = request.getParameter("author");
		String description = request.getParameter("description");
		String isbn = request.getParameter("isbn");
		double price = Double.parseDouble(request.getParameter("price"));

		DateFormat dateFormat = new SimpleDateFormat("MM/DD/yyyy");
		Date publishDate = null;
		try {
			publishDate = dateFormat.parse(request.getParameter("publishDate"));
		} catch (ParseException ex) {
			ex.printStackTrace();
			throw new ServletException("Error parsing publish date (format is MM/DD/yyyy");
		}

		Category category = categoryDAO.get(categoryId);
		existBook.setCategory(category);
		existBook.setTitle(title);
		existBook.setAuthor(author);
		existBook.setDescription(description);
		existBook.setIsbn(isbn);

		// Getting Image from the servlet which is uploaded from System storage. More
		// info in CreateBooksServlet.

		Part part = request.getPart("bookImage");

		if (part != null && part.getSize() > 0) {
			long size = part.getSize();
			byte[] imageBytes = new byte[(int) size];

			InputStream inputStream = part.getInputStream();
			inputStream.read(imageBytes);
			inputStream.close();

			existBook.setImage(imageBytes);
		}

		existBook.setPrice(price);
		existBook.setPublisheDate(publishDate);

		bookDAO.update(existBook);

		String message = "Book updated successfuly";
		listBooks(message);
	}

	public void deleteBook() throws ServletException, IOException {

		int bookId = Integer.parseInt(request.getParameter("id"));

		Book book = bookDAO.get(bookId);

		if (book == null) {
			String message = "Could not find book with ID " + bookId + " , or it might have been deleted";
			listBooks(message);
		} else {
			if (!book.getReviews().isEmpty()) {
				String message = "Could not delete the book with ID " + bookId + " because it has reviews";
				listBooks(message);
			} else {
				OrderDAO orderDAO = new OrderDAO();
				long countByOrder = orderDAO.countOrderDetailByBook(bookId);

				if (countByOrder > 0) {
					String message = "Could not delete book with ID " + bookId
							+ " because there are orders associated with it.";
					listBooks(message);
				}

				else {
					String message = "Book was deleted successfully";
					bookDAO.delete(bookId);
					listBooks(message);
				}

			}

		}

	}

	public void listBooksByCategory() throws ServletException, IOException {
		int categoryId = Integer.parseInt(request.getParameter("id"));
		List<Book> listBooks = bookDAO.listByCategory(categoryId);

		Category category = categoryDAO.get(categoryId);

		if (category == null) {
			String message = "Could not find this category. ";
			request.setAttribute("message", message);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("frontend/message.jsp");
			requestDispatcher.forward(request, response);
			return;
		}

		List<Category> listCategory = categoryDAO.listAll();

		request.setAttribute("listCategory", listCategory);
		request.setAttribute("listBooks", listBooks);
		request.setAttribute("category", category);

		String listPage = "frontend/books_list_by_category.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPage);
		requestDispatcher.forward(request, response);
	}

	public void viewBookDetail() throws ServletException, IOException {

		int bookId = Integer.parseInt(request.getParameter("id"));

		Book book = bookDAO.get(bookId);

		if (book == null) {
			String message = "Sorry, the book with ID " + bookId + "is not available.";

			request.setAttribute("message", message);
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("frontend/message.jsp");
			requestDispatcher.forward(request, response);
		}

		request.setAttribute("book", book);

		String detailPage = "frontend/book_detail.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(detailPage);
		requestDispatcher.forward(request, response);
	}

	public void search() throws ServletException, IOException {
		String keyword = request.getParameter("keyword");
		List<Book> result = null;

		if (keyword.equals("")) {
			result = bookDAO.listAll();
		} else {
			result = bookDAO.search(keyword);
		}

		request.setAttribute("keyword", keyword);
		request.setAttribute("result", result);

		String detailPage = "frontend/search_result.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(detailPage);
		requestDispatcher.forward(request, response);

	}
}
