<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ page import="java.sql.*"%>
<%@ page import="Procedures.*"%>
<%@ page import="oracle.jdbc.OracleTypes"%>



<%

System.out.println("");
System.out.println("Users/_is_user_exist.jsp: ");

String id = request.getParameter("id");if (id==null){id="";}
String naziv = request.getParameter("naziv");if (naziv==null){naziv="";}

System.out.println("id: "+id);
System.out.println("naziv: "+naziv);

String is_user_exist = Procs.is_user_exist(id,naziv,request.getSession());

System.out.println("is_user_exist: "+is_user_exist);
%>
 <input name="is_user_exist" id="is_user_exist" type="hidden" value="<%=is_user_exist%>" />
 <input name="is_user_exist_temp" id="is_user_exist_temp" type="hidden" value="" />

