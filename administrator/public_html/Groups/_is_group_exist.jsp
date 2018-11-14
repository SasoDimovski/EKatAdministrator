<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ page import="java.sql.*"%>
<%@ page import="Procedures.*"%>
<%@ page import="oracle.jdbc.OracleTypes"%>



<%

System.out.println("");
System.out.println("Groups/_is_group_exist.jsp: ");

String id = request.getParameter("id");if (id==null){id="";}
String group = request.getParameter("group");if (group==null){group="";}

System.out.println("id: "+id);
System.out.println("group: "+group);

String is_group_exist = Procs.is_group_exist(id,group,request.getSession());

System.out.println("is_group_exist: "+is_group_exist);
%>
 <input name="is_group_exist" id="is_group_exist" type="hidden" value="<%=is_group_exist%>" />
 <input name="is_group_exist_temp" id="is_group_exist_temp" type="hidden" value="" />

