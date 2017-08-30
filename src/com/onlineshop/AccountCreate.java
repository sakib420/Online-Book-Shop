package com.onlineshop;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AccountCreate extends HttpServlet {

	String name,email,password,phone;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
			{
		      PrintWriter out = response.getWriter();
		        name = request.getParameter("name");
	            password = request.getParameter("password");
				email = request.getParameter("email");
				phone= request.getParameter("phone");

				

				// Setting all variables to model class
				AccountInfo ai = new AccountInfo();
				ai.setName(name);
				ai.setEmail(email);
				ai.setPassword(password);
				ai.setPhone(phone);
				
				request.setAttribute("Account_details", ai);
				RequestDispatcher rd = request.getRequestDispatcher("create_account_progress.jsp");
				rd.forward(request, response);
				

		      
			}

}
