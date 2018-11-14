<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ page import="java.sql.*"%>
<%@ page import="Procedures.*"%>
<%@ page import="oracle.jdbc.OracleTypes"%>



<%

System.out.println("");
System.out.println("Users/set_session.jsp: ");

String temp = request.getParameter("temp");if (temp==null){temp="";}

System.out.println("temp: "+temp);

session.setAttribute(temp, "1");

	
%>



