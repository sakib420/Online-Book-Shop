package com.database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.onlineshop.AccountInfo;
import com.onlineshop.BookInfo;

public class DatabaseOperations {
        
	Connection conn;
	AccountInfo ai = new AccountInfo();
	public void insertAccountDetails(AccountInfo ai) throws Exception {
		try {
			JDBC_Connect connect = new JDBC_Connect();
			conn = connect.getConnection();
			PreparedStatement ps1 = conn.prepareStatement("insert into account(name,email,password,phone)"
					+ "values('" + ai.getName() + "','" + ai.getEmail() + "','"
					+ ai.getPassword() + "','" + ai.getPhone() + "')");
			ps1.executeUpdate();
			//System.out.println("Inserted " + count1 + " row");
			conn.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		//return true;

		//return ((count1 > 0) && (count2 > 0));
	}
	ArrayList<String> books = new ArrayList<String>();
	public ArrayList<String> getAccountDetails(Connection conn,String email) throws Exception {
		//AccountInfo ai = new AccountInfo();

		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from userbook where username ='" + email + "'");
		while (rs.next()) {

			// Setting all variables to model class
			/*ai = new AccountInfo();
			//am.setAccount_no(rs.getString(1));
			ai.setName(rs.getString(1));
			ai.setEmail(rs.getString(2));
			ai.setPassword(rs.getString(3));
			ai.setPhone(rs.getString(4)); */
			books.add(rs.getString(2));
		}
		
		
		return books;
	}
	
	public void insertBookDetails(BookInfo bi) throws Exception {
		try {
			JDBC_Connect connect = new JDBC_Connect();
			conn = connect.getConnection();
			PreparedStatement ps1 = conn.prepareStatement("insert into book(bookname,writername,type,price)"
					+ "values('" + bi.getBookname() + "','" + bi.getWritername() + "','"
					+ bi.getType() + "','" + bi.getPrice() + "')");
			ps1.executeUpdate();
			//System.out.println("Inserted " + count1 + " row");
			conn.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		//return true;

		//return ((count1 > 0) && (count2 > 0));
	}
	AccountInfo aiii=new AccountInfo();
	ArrayList<AccountInfo> ac = new ArrayList<AccountInfo>();
	public ArrayList<AccountInfo> getuserDetails(Connection conn) throws Exception {
		//AccountInfo ai = new AccountInfo();
		
		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from account");
		while (rs.next()) {

			// Setting all variables to model class
			 AccountInfo aiiiii = new AccountInfo();
			//am.setAccount_no(rs.getString(1));
	        aiiiii.setName(rs.getString(1));
			aiiiii.setEmail(rs.getString(2));
			aiiiii.setPassword(rs.getString(3));
			aiiiii.setPhone(rs.getString(4));
			//BookInfo bii= new BookInfo();
			//bii.setBookname(rs.getString(1));
			//bii.setWritername(rs.getString(2));
			//bii.setType(rs.getString(3));
			//bii.setPrice(rs.getString(4));
			
			/*bii.getBookname();
			bii.getWritername();
			bii.getPrice();
			bii.getType();
			book.add(bii);*/
		    aiiiii.getName();
		    aiiiii.getEmail();
		    aiiiii.getPassword();
		    aiiiii.getPhone();
		    
		    ac.add(aiiiii);
		
		}
		
		
		return ac;
	}
	
	public void insertBookToUser(String username,String bookname) throws Exception {
		try {
			JDBC_Connect connect = new JDBC_Connect();
			conn = connect.getConnection();
			PreparedStatement ps1 = conn.prepareStatement("insert into userbook(username,bookname)"
					+ "values('" + username+ "','" + bookname + "')");
			ps1.executeUpdate();
			//System.out.println("Inserted " + count1 + " row");
			conn.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		//return true;

		//return ((count1 > 0) && (count2 > 0));
	}


	BookInfo bi=new BookInfo();
	ArrayList<BookInfo> book = new ArrayList<BookInfo>();
	public ArrayList<BookInfo> getBookDetails(Connection conn) throws Exception {
		//AccountInfo ai = new AccountInfo();
		
		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from book");
		while (rs.next()) {

			// Setting all variables to model class
			//ai = new AccountInfo();
			//am.setAccount_no(rs.getString(1));
	        //ai.setName(rs.getString(1));
			//ai.setEmail(rs.getString(2));
			//ai.setPassword(rs.getString(3));
			//ai.setPhone(rs.getString(4));
			BookInfo bii= new BookInfo();
			bii.setBookname(rs.getString(1));
			bii.setWritername(rs.getString(2));
			bii.setType(rs.getString(3));
			bii.setPrice(rs.getString(4));
			
			bii.getBookname();
			bii.getWritername();
			bii.getPrice();
			bii.getType();
			book.add(bii);
		}
		
		
		return book;
	}
	
}
