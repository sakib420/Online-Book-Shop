<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.database.DatabaseOperations"%>
<%@page import="com.onlineshop.AccountInfo"%>
<%@page import="com.database.JDBC_Connect"%>
<%@page import="java.sql.Connection,java.sql.PreparedStatement"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%!
AccountInfo ai=new AccountInfo();
%>

<%
  ai = (AccountInfo) session.getAttribute("userDetails");
  String  name=ai.getName();

%>
<%   if(name.equals("admin"))
{%>
<a href="admin.jsp">Home</a>
<%}
else
{
%>
<a  href="afterlogin.jsp">Home</a>      

<%} %>

<a  href="books.jsp" >Book</a>
<a  href="logout.jsp" >Log out</a>


<%!AccountInfo bi;%>

<%
	//ai = (AccountInfo) session.getAttribute("userDetails");
	//String email = ai.getEmail();
	JDBC_Connect connect = new JDBC_Connect();
	Connection conn = connect.getConnection();
	DatabaseOperations operations = new DatabaseOperations();
	ArrayList<AccountInfo> book = new ArrayList<AccountInfo>();
	book=operations.getuserDetails(conn);
	
	//ai = //operations.getAccountDetails(conn, email);
%>
<%

Iterator <AccountInfo> itr = book.iterator();
int i=1;
for(AccountInfo bi:book){ 
	
    //System.out.println(b.id+" "+b.name+" "+b.author+" "+b.publisher+" "+b.quantity);
    
%>
<h2> User's Information</h2>
<p> Name: <B> <%=bi.getName() %> </B> Email: <B><%=bi.getEmail() %></B> Phone: <B><%=bi.getPhone()%></B></p>


<% 
i++;
}
%>

</body>
</html>