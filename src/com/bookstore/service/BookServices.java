package com.bookstore.service;

import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.bookstore.dao.BookDAO;
import com.bookstore.dao.CategoryDAO;
import com.bookstore.entity.Book;
import com.bookstore.entity.Category;

public class BookServices {
	private BookDAO BookDAO;
	private CategoryDAO categoryDAO;
	private HttpServletRequest request;
	private HttpServletResponse response;
	public BookServices(EntityManager entityManager, HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
		BookDAO = new BookDAO(entityManager);
		categoryDAO = new CategoryDAO(entityManager);
	}
	public void listBook() throws ServletException, IOException {
		List<Book> listBook = BookDAO.listAll();
		request.setAttribute("listBook", listBook);
		String listPage = "book_list.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPage);
		
		requestDispatcher.forward(request, response);
	}
	
	public void listBooks(String message) throws ServletException, IOException {
		List<Book> listBook = BookDAO.listAll();
		request.setAttribute("listBook", listBook);
		
		if (message != null) {
			request.setAttribute("message", message);
		}
		String listPage = "book_list.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPage);
		
		requestDispatcher.forward(request, response);
	}
	
	public void listBook(String message) throws ServletException, IOException {
		List<Book> listBook = BookDAO.listAll();
		request.setAttribute("listBook", listBook);
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
		String title = request.getParameter("title");
		
		Book existBook = BookDAO.findByTitle(title);
		
		if (existBook != null) {
			String message = "Could not create new book because the title"+ title + "already exists.";
			listBooks(message);
			return;
		}
		Book newBook = new Book();
		readBookFields(newBook);
		
		Book createBook = BookDAO.create(newBook);
		
		if (createBook.getBookId() > 0) {
			String message = "A new book has been created successfully.";
			request.setAttribute("message", message);
			listBook();
		}
		
	}
	
	public void editBook() throws ServletException, IOException {
		int BookId = Integer.parseInt(request.getParameter("bookId"));
		Book Book = BookDAO.get(BookId);
		List<Category> listCategory = categoryDAO.listAll();
		request.setAttribute("book", Book);
		request.setAttribute("listCategory", listCategory);
		String editPage = "book_form.jsp";
		RequestDispatcher requestDispatcher = request.getRequestDispatcher(editPage);
		requestDispatcher.forward(request, response);
	}
	public void readBookFields(Book book) throws ServletException, IOException {
		Integer categoryId = Integer.parseInt(request.getParameter("category"));
		String title = request.getParameter("title");
		String author = request.getParameter("author");
		String description = request.getParameter("description");
		String isbn = request.getParameter("isbn");
		float price = Float.parseFloat(request.getParameter("price"));
		
		DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
		Date publishDate = null;
		try {
			publishDate = dateFormat.parse(request.getParameter("publishDate"));
		} catch (ParseException e) {
			e.printStackTrace();
			throw new ServletException("Error parsing publish date (format is MM/dd/yyyy)");
		}
		
		Part part = request.getPart("bookImage");
		book.setTitle(title);
		book.setAuthor(author);
		book.setDescription(description);
		book.setIsbn(isbn);
		book.setPublishDate(publishDate);
		Category category = categoryDAO.get(categoryId);
		book.setPrice(price);
		book.setCategory(category);
		if (part != null && part.getSize() > 0) {
			long size = part.getSize();
			byte[] imageBytes = new byte[(int)size];
			InputStream inputStream = part.getInputStream();
			inputStream.read(imageBytes);
			inputStream.close();
			
			book.setImage(imageBytes);
		}
	}
	public void updateBook() throws ServletException, IOException {
		int BookId = Integer.parseInt(request.getParameter("bookId"));
		Book existBook = BookDAO.get(BookId);
		String title = request.getParameter("title");
		Book bookByTitle = BookDAO.findByTitle(title);
		if (existBook.equals(bookByTitle)) {
			String message = "Could not update book because there's another book having same title";
			listBooks(message);
			return;
		}
		readBookFields(existBook);
		BookDAO.update(existBook);
		String message = "The book has been updated successfully";
		listBooks(message);
	}
	
	public void deleteBook() throws ServletException, IOException {
		Integer bookId = Integer.parseInt(request.getParameter("id"));
		BookDAO.delete(bookId);
		
		String message = "The book has been updated successfully.";
		listBook(message);
	}
}
