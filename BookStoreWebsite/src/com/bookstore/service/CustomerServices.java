package com.bookstore.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bookstore.dao.CustomerDAO;
import com.bookstore.dao.HashGenerator;
import com.bookstore.dao.OrderDAO;
import com.bookstore.dao.ReviewDAO;
import com.bookstore.entity.Customer;

public class CustomerServices {
	private HttpServletRequest request;
	private HttpServletResponse response;
	private CustomerDAO customerDAO;

	public CustomerServices(HttpServletRequest request, HttpServletResponse response) {
		super();
		this.request = request;
		this.response = response;
		customerDAO = new CustomerDAO();
	}

	// listCustomers method with a parameter
	public void listCustomers(String message) throws ServletException, IOException {
		List<Customer> listCustomer = customerDAO.listAll();

		if (message != null) {
			request.setAttribute("message", message);
		}

		request.setAttribute("listCustomer", listCustomer);
		String listPage = "customer_list.jsp";

		RequestDispatcher dispatcher = request.getRequestDispatcher(listPage);
		dispatcher.forward(request, response);
	}

	// Overload listCustomer method without a parameter
	public void listCustomers() throws ServletException, IOException {
		listCustomers(null);
	}

	public void createCustomer() throws ServletException, IOException {
		String message;

		String email = request.getParameter("email");
		Customer existCustomer = customerDAO.findByEmail(email);

		if (existCustomer != null) {
			message = "Could not create customer, the email already exist";
			listCustomers(message);

		} else {

			Customer newCustomer = new Customer();
			updateCustomerFieldsFromForm(newCustomer);
			customerDAO.create(newCustomer);
			message = "New customer has been created successfully";
			listCustomers(message);

		}
	}

	public void editCustomer() throws ServletException, IOException {
		int customerId = Integer.parseInt(request.getParameter("id"));
		Customer customer = customerDAO.get(customerId);

		if (customer != null) {

			request.setAttribute("customer", customer);

			String editPage = "customer_form.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(editPage);
			dispatcher.forward(request, response);
		} else {
			{
				String message = "Could not find customer with ID " + customerId;
				listCustomers(message);
			}
		}

	}

	public void updateCustomer() throws ServletException, IOException {

		int customerId = Integer.parseInt(request.getParameter("customerId"));
		String email = request.getParameter("email");
		String message;
		Customer customerByEmail = customerDAO.findByEmail(email);

		if (customerByEmail != null && customerByEmail.getCustomerId() != customerId) {
			message = "Could not update the customer ID " + customerId + ""
					+ " because ther's an existing customer with the same email";

			listCustomers(message);
		} else {
			message = "Customer updated successfully!";
			Customer customerById = customerDAO.get(customerId);
			updateCustomerFieldsFromForm(customerById);

			customerDAO.update(customerById);
			listCustomers(message);
		}
	}

	public void deleteCustomer() throws ServletException, IOException {
		Integer customerId = Integer.parseInt(request.getParameter("id"));
		Customer customer = customerDAO.get(customerId);
		
		if (customer != null) {
			ReviewDAO reviewDAO = new ReviewDAO();
			long reviewCount = reviewDAO.countByCustomer(customerId);
			
			if (reviewCount > 0) {
				String message = "Could not delete customer with ID " + customerId
						+ " because he/she posted reviews for books.";
				listCustomers(message);
			} else {
				OrderDAO orderDAO = new OrderDAO();
				long orderCount = orderDAO.countByCustomer(customerId);
				
				if (orderCount > 0) {
					String message = "Could not delete customer with ID " + customerId 
							+ " because he/she placed orders.";
					listCustomers(message);
				} else {
					customerDAO.delete(customerId);			
					String message = "The customer has been deleted successfully.";
					listCustomers(message);
				}
			}
		} else {
			String message = "Could not find customer with ID " + customerId + ", "
					+ "or it has been deleted by another admin";
			listCustomers(message);
		}
	}

	public void registerCustomer() throws ServletException, IOException {
		String email = request.getParameter("email");
		String message;
		Customer existCustomer = customerDAO.findByEmail(email);

		if (existCustomer != null) {
			message = "Could not register. The email	 " + email + "" + " is already registered";
		} else {

			Customer newCustomer = new Customer();
			updateCustomerFieldsFromForm(newCustomer);

			customerDAO.create(newCustomer);

			message = "You have registered successfully. Thank you.<br/>" + "<a href='login'>Click here</a> to login";
		}

		request.setAttribute("message", message);
		RequestDispatcher dispatcher = request.getRequestDispatcher("frontend/message.jsp");
		dispatcher.forward(request, response);
	}

	public void updateCustomerFieldsFromForm(Customer customer) {

		String email = request.getParameter("email");
		String fullName = request.getParameter("fullName");
		String password = request.getParameter("password");
		String phone = request.getParameter("phoneNumber");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String zipCode = request.getParameter("zipCode");
		String country = request.getParameter("country");

		if (email != null && !email.equals("")) {
			customer.setEmail(email);
		}

		customer.setFullname(fullName);

		if (password != null & !password.isEmpty()) {
			String encryptedPassword = HashGenerator.generateMD5(password);
			customer.setPassword(encryptedPassword);
		}

		customer.setPhone(phone);
		customer.setAddress(address);
		customer.setCity(city);
		customer.setZipcode(zipCode);
		customer.setCountry(country);
	}

	public void showLogin() throws ServletException, IOException {
		String loginPage = "frontend/login.jsp";

		RequestDispatcher dispatcher = request.getRequestDispatcher(loginPage);
		dispatcher.forward(request, response);

	}

	public void doLogin() throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		Customer customer = customerDAO.checkLogin(email, password);

		if (customer == null) {
			String message = "Login failed. Please make sure that you have entered the correct login details.";
			request.setAttribute("message", message);
			showLogin();
		} else {
			HttpSession session = request.getSession();
			session.setAttribute("loggedCustomer", customer);
			
			Object objRedirectURL = session.getAttribute("redirectURL");
			
			if(objRedirectURL != null) {
				String redirectURL = (String) objRedirectURL;
				session.removeAttribute("redirectURL");
				response.sendRedirect(redirectURL);
			} else {	
				
				showCustomerProfile();
			}
			
			
		}
	}

	public void showCustomerProfile() throws ServletException, IOException {
		String loginPage = "frontend/customer_profile.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(loginPage);
		dispatcher.forward(request, response);
	}

	public void showCustomerProfileEditForm() throws ServletException, IOException {
		String loginPage = "frontend/edit_profile.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(loginPage);
		dispatcher.forward(request, response);
	}

	public void updateCustomerProfile() throws ServletException, IOException {
		Customer customer = (Customer) request.getSession().getAttribute("loggedCustomer");
		updateCustomerFieldsFromForm(customer);
		customerDAO.update(customer);
		showCustomerProfile();
	}

}
