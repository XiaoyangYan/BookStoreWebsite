package com.bookstore.controller.admin.user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookstore.controller.admin.BaseServlet;
import com.bookstore.service.UserServices;

/**
 * Servlet implementation class EditUserServlet
 */
@WebServlet("/admin/edit_user")
public class EditUserServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	
	public EditUserServlet() {
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		UserServices userServices = new UserServices(entityManager,request, response);
		userServices.editUser();
	}

}
