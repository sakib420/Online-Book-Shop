package com.onlineshop;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BookInfoOperation extends HttpServlet{

	String bookname,writername,type,price;
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
			{
		        PrintWriter out = response.getWriter();
		        bookname = request.getParameter("bookname");
	            writername = request.getParameter("writername");
				type = request.getParameter("type");
				price= request.getParameter("price");

				

				// Setting all variables to model class
				BookInfo bi = new BookInfo();
				bi.setBookname(bookname);
				bi.setWritername(writername);
				bi.setType(type);
				bi.setPrice(price);
				
				request.setAttribute("Book_details", bi);
				RequestDispatcher rd = request.getRequestDispatcher("create_book_progress.jsp");
				rd.forward(request, response);
			}
}
