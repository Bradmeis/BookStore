package com.bookstore.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.dao.BookDAO;
import com.bookstore.dao.CategoryDAO;
import com.bookstore.entity.Category;


public class CategoryServices {
	
	private CategoryDAO categoryDAO;
	private HttpServletRequest request;
	private HttpServletResponse response;

	public CategoryServices(HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
		

		categoryDAO = new CategoryDAO();
	}

	public void listCategory() throws ServletException, IOException {
		listCategory(null);
	}

	public void listCategory(String message) throws ServletException, IOException {
		List<Category> listCategory = categoryDAO.listAll();

		request.setAttribute("listCategory", listCategory);

		if (message != null) {
			request.setAttribute("message", message);
		}

		String listPage = "category_list.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPage);

		requestDispatcher.forward(request, response);
	}

	public void createCategory() throws ServletException, IOException {
		String name = request.getParameter("name");
		String existMessage = "Category alredy exist. A category with name " + name + " already exist";

		Category existCat = categoryDAO.findByName(name);

		if (existCat != null) {
			request.setAttribute("message", existMessage);
			RequestDispatcher dispatcher = request.getRequestDispatcher("message.jsp");
			dispatcher.forward(request, response);
		} else {
			Category newCat = new Category(name);
			categoryDAO.create(newCat);
			String message = "Category created successfully!";
			listCategory(message);
		}

	}

	public void editCategory() throws ServletException, IOException {
		int categoryId = Integer.parseInt(request.getParameter("id"));
		Category category = categoryDAO.get(categoryId);

		if (category == null) {
			String message = "Could not find category to update";
			request.setAttribute("message", message);

			RequestDispatcher dispatcher = request.getRequestDispatcher("category_list.jsp");
			dispatcher.forward(request, response);
		} else {
			String editPage = "category_form.jsp";
			request.setAttribute("category", category);
			RequestDispatcher dispatcher = request.getRequestDispatcher(editPage);
			dispatcher.forward(request, response);
		}
	}

	public void updateCategory() throws ServletException, IOException {
		int categoryId = Integer.parseInt(request.getParameter("categoryId"));
		String name = request.getParameter("name");

		Category categoryById = categoryDAO.get(categoryId);
		Category categoryByName = categoryDAO.findByName(name);

		if (categoryByName != null && categoryByName.getCategoryId() != categoryById.getCategoryId()) {
			String message = "Could not update category. Category with name " + name + " alreday exist!!!";
			request.setAttribute("message", message);

			RequestDispatcher dispatcher = request.getRequestDispatcher("message.jsp");
			dispatcher.forward(request, response);

		}

		else {
			categoryById.setName(name);
			categoryDAO.update(categoryById);

			String message = "Category has been updated successfully!!!";
			listCategory(message);
		}

	}

	public void deleteCategory() throws ServletException, IOException {
		int categoryId = Integer.parseInt(request.getParameter("id"));
		BookDAO bookDAO = new BookDAO();
		long numberOfBooks = bookDAO.countByCategory(categoryId);
		String message;
		
		if (numberOfBooks > 0) {
			message = "Could not delete the Category (ID: %d) because it contains some books.";
			message = String.format(message, categoryId);
			
		} else {
			categoryDAO.delete(categoryId);
			message = "The Category with ID " + categoryId + " was removed successfully.";
			
		}
		listCategory(message);
	}

}
